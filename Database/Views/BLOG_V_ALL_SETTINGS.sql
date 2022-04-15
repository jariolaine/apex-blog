--------------------------------------------------------
--  DDL for View BLOG_V_ALL_SETTINGS
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_SETTINGS" ("ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "IS_NULLABLE", "DISPLAY_SEQ", "ATTRIBUTE_NAME", "ATTRIBUTE_VALUE", "DATA_TYPE", "ATTRIBUTE_MESSAGE", "ATTRIBUTE_DESC", "ATTRIBUTE_GROUP_MESSAGE", "ATTRIBUTE_GROUP", "ATTRIBUTE_GROUP_SEQ", "POST_EXPRESSION", "INT_MIN", "INT_MAX", "HELP_MESSAGE") AS
  select
   t1.id                      as id
  ,t1.row_version             as row_version
  ,t1.created_on              as created_on
  ,lower(t1.created_by)       as created_by
  ,t1.changed_on              as changed_on
  ,lower(t1.changed_by)       as changed_by
  ,t1.is_nullable             as is_nullable
  ,t1.display_seq             as display_seq
  ,t1.attribute_name          as attribute_name
  ,t1.attribute_value         as attribute_value
  ,t1.data_type               as data_type
  ,t1.attribute_message       as attribute_message
  ,apex_lang.message(
    p_name => t1.attribute_message
  )                           as attribute_desc
  ,t1.attribute_group_message as attribute_group_message
  ,apex_lang.message(
    p_name => t1.attribute_group_message
  )                           as attribute_group
  ,(
    select min( lkp.display_seq )
    from blog_settings lkp
    where 1 = 1
      and lkp.attribute_group_message = t1.attribute_group_message
  )                           as attribute_group_seq
  ,t1.post_expression         as post_expression
  ,t1.int_min                 as int_min
  ,t1.int_max                 as int_max
  ,t1.help_message            as help_message
from blog_settings t1
where 1 = 1
/
