## 如何设计一款高度自定义的表单系统？

`自定义`意味着`表单数量不确定`，每个表单`字段数量不确定`，每个字段`类型不确定`，`存储量不确定`，等等一切都是`未知`的。

以及之后如何建立索引，如何搜索定位指定的数据？这些问题都将在下面的方案中进行解答。

### 背景
为了实现某个比较`脑洞大开`的需求，建立自定义表单，而且，还限定了前置条件—技术选型不许复杂，数据存储只能基于`mysql`, So…

所谓的“自定义”（表设计）
我们会定义这么几张表，用来实现自定义模板的大致框架。

```
diy_field_pool      字段池（我们定义好的字段类型）
diy_form            表单表（记录用户自定义的表单）
diy_form_field      表单字段表（记录某张表单中有哪些字段）
diy_form_entity     表单实例表（记录某张表单中的某条数据实例）
diy_form_data       表单数据表（记录某张表单在某条实例下，哪些字段对应的数据）
```

### 系统初始化字段池
我们提供一批预定义的字段类型，初始化数据到`diy_field_pool`表中，用户也能自己定义自己的字段池。

### 用户创建自定义表单
用户通过选用字段池（`diy_field_pool`表）中提供的字段，创建一张自定义表单，表单的属性信息记录在`diy_form`表中，表单包含的字段（从字段池中选好的字段）记录在`diy_form_field`表中。这样用户就创建了一张自定义表单。

### 用户填写表单
用户使用创建好的表单填写数据，每新增一条数据，在`diy_form_entity`表就会新增一条记录，该表单中有几个`field`，就会同时在`diy_form_data`表中新增几条 `data` 数据。数据结构关系如下图所示：

```
diy_form    ------ diy_enity
|                   |
|---diy_field       |---diy_data
|                   |
|---diy_field       |---diy_data
|                   |
|---diy_field       |---diy_data
|                   |
|---diy_field       |---diy_data
|                   |
|---diy_field       |---diy_data
|                   |
|---diy_field       |---diy_data
|                   |
|...
```

### 如何进行数据搜索
数据存储结构中，最终保存数据的地方其实是`data`表，但是，`data表`的辅助字段有`form表id`，`field表id`，`entity表id`，只有一个`content`字段是记录真实信息的，那么，如何搭建索引体系呢？

### 采用 Sphinx
构建`Sphinx`的`sql`语句时，将`data表`的`id`作为文档`id`。

```
# 公共的自定义模板的数据源
source diyCommonSource
{
    type            = mysql
    sql_db          = diy_form
    sql_host        = 127.0.0.1
    sql_port        = 3306
    sql_user        = root
    sql_pass        = root
    sql_query_pre   = SET NAMES utf8

    sql_query   = \
        select \
        dfd.id, \
        dfd.entity_id,dfd.content,dfd.created_at,dfd.updated_at, \
        dff.id as field_id,dff.field, \
        df.id as form_id \
    from diy_form_data as dfd \
        inner join diy_form_field as dff on dff.form_id=dfd.form_id and dff.is_delete=0 \
        inner join diy_form as df on df.id=dff.form_id and df.is_delete=0 \
    where dfd.is_delete=0
}

# 公共的自定义模板的索引
index diyCommonIndex
{
    source          = diyCommonSource
    path            = /var/local/diy/sphinx/data/diyCommonIndex
    docinfo         = extern
    #charset_type   = zh_cn.utf-8
    charset_type    = utf-8
    min_word_len    = 1
    ngram_len       = 1
    ngram_chars     = U+3000..U+2FA1F
}

# 范围：用户模板（假定form_type为user_register）
source news:diyCommonSource
{
    sql_query    = \
        select \
            dfd.id, \
            dfd.entity_id,dfd.content,dfd.created_at,dfd.updated_at, \
            dff.id as field_id,dff.field, \
            df.id as form_id \
        from pre_diy_form_data as dfd \
            inner join pre_diy_form_field as dff \
                on dff.form_id=dfd.form_id and dff.is_delete=0 \
            inner join diy_form as df \
                on df.id=dff.form_id and df.is_delete=0 and df.form_type='user_register' \
        where dfd.is_delete=0

    # 使用sql_attr设置的字段(搜索条件)，只能作为属性，使用SphinxClient::SetFilter()进行过滤；
    # 未被设置的字段，自动作为全文检索的字段，使用SphinxClient::Query("搜索字符串")进行全文搜索
    # sql_query第一列id需为整数，且被系统使用，无需再设置sql_attr_uint
    sql_attr_uint       = form_id
    sql_attr_uint       = field_id
    sql_attr_uint       = field
    sql_attr_uint       = entity_id
    sql_attr_timestamp  = created_at
    sql_attr_timestamp  = updated_at
}
# 构造商品模板的数据索引
index news:diyCommonIndex
{
    source  = news
    path    = /var/local/diy/sphinx/data/news
}
```

其中，如果需要指定查找某些字段的数据，那么，以上面的数据源再重新定义数据源，sql 语句进一步指定 `field` 表的某个标志字段即可。