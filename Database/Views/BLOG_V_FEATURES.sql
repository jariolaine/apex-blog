--------------------------------------------------------
--  DDL for View BLOG_V_FEATURES
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_FEATURES" ("ID", "APPLICATION_ID", "BUILD_OPTION_ID", "LAST_UPDATED_ON", "LAST_UPDATED_BY", "DISPLAY_SEQ", "BUILD_OPTION_NAME", "BUILD_OPTION_STATUS", "BUILD_OPTION_PARENT", "FEATURE_DESC", "HELP_MESSAGE", "FEATURE_GROUP_HTML") AS
select
   t1.id                        as id
  ,v1.application_id            as application_id
  ,v1.build_option_id           as build_option_id
  ,v1.last_updated_on           as last_updated_on
  ,lower( v1.last_updated_by )  as last_updated_by
  ,t1.display_seq               as display_seq
  ,t1.build_option_name         as build_option_name
  ,v1.build_option_status       as build_option_status
  ,t1.build_option_parent       as build_option_parent
  ,apex_lang.message(
    p_name => t1.build_option_name
  )                             as feature_desc
  ,regexp_replace(
    t1.build_option_name
    ,'^(BLOG)'
    ,'\1_HELP'
  )                             as help_message
-- HTML in query because IG removes HTML from column HTM expression in control break column
-- Contrel break is soretd and attribute data-sort-order gives correct sort order
  ,apex_string.format(
     p_message => '<span data-sort-order="%s" class="u-bold">%s</span>'
    ,p0 => lpad( min( t1.display_seq ) over( partition by t1.build_option_group ), 5, '0' )
    ,p1 =>
      apex_lang.message(
        p_name => t1.build_option_group
      )
  )                             as feature_group_html
from blog_features t1
join apex_application_build_options v1
  on t1.build_option_name = v1.build_option_name
where 1 = 1
and t1.is_active = 1
and not exists(
  select 1
  from apex_application_build_options x1
  where x1.build_option_status = 'Exclude'
    and x1.application_id = v1.application_id
    and x1.build_option_name = t1.build_option_parent
)
with read only
/
