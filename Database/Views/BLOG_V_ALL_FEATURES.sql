--------------------------------------------------------
--  DDL for View BLOG_V_ALL_FEATURES
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_FEATURES" ("ID", "APPLICATION_ID", "BUILD_OPTION_ID", "BUILD_OPTION_NAME", "BUILD_OPTION_GROUP", "DISPLAY_SEQ", "FEATURE_NAME", "FEATURE_GROUP", "FEATURE_GROUP_SEQ", "BUILD_OPTION_STATUS", "LAST_UPDATED_ON", "LAST_UPDATED_BY", "IS_ACTIVE", "FEATURE_PARENT", "HELP_MESSAGE") AS
  select
   t2.id                        as id
  ,t1.application_id            as application_id
  ,t1.build_option_id           as build_option_id
  ,t2.build_option_name         as build_option_name
  ,t2.build_option_group        as build_option_group
  ,t2.display_seq               as display_seq
  ,apex_lang.message(
    p_name => t2.build_option_name
  )                             as feature_name
  ,apex_lang.message(
    p_name => t2.build_option_group
  )                             as feature_group
  ,min( t2.display_seq ) over(
    partition by t2.build_option_group
  )                             as feature_group_seq
  ,t1.build_option_status       as build_option_status
  ,t1.last_updated_on           as last_updated_on
  ,lower( t1.last_updated_by )  as last_updated_by
  ,t2.is_active                 as is_active
  ,t2.build_option_parent       as feature_parent
  ,t2.help_message              as help_message
from apex_application_build_options t1
join blog_features t2
  on t1.build_option_name = t2.build_option_name
where 1 = 1
with read only
/
