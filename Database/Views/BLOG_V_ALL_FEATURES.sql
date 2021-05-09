--------------------------------------------------------
--  DDL for View BLOG_V_ALL_FEATURES
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_FEATURES" ("ID", "APPLICATION_ID", "BUILD_OPTION_ID", "DISPLAY_SEQ", "FEATURE_NAME", "FEATURE_GROUP", "BUILD_OPTION_STATUS", "LAST_UPDATED_ON", "LAST_UPDATED_BY", "IS_ACTIVE") AS
  select
   t2.id                        as id
  ,t1.application_id            as application_id
  ,t1.build_option_id           as build_option_id
  ,t2.display_seq               as display_seq
  ,apex_lang.message(
    p_name => t2.build_option_name
  )                             as feature_name
  ,apex_lang.message(
    p_name => t2.build_option_group
  )                             as feature_group
  ,t1.build_option_status       as build_option_status
  ,t1.last_updated_on           as last_updated_on
  ,lower( t1.last_updated_by )  as last_updated_by
  ,t2.is_active                 as is_active
from apex_application_build_options t1
join blog_features t2
  on t1.build_option_name = t2.build_option_name
where 1 = 1
with read only
/
