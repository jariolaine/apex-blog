--------------------------------------------------------
--  DDL for View BLOG_APEX_BUILD_OPTIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "BLOG_V_APEX_BUILD_OPTIONS" ("APPLICATION_ID", "BUILD_OPTION_ID", "BUILD_OPTION_NAME", "FEATURE_NAME", "STATUS", "LAST_UPDATED", "LAST_UPDATED_BY", "SWITCH_HTML") AS
  with bo as(
  select t1.application_id
  ,t1.build_option_status
  ,t1.last_updated_on as last_updated
  ,lower( t1.last_updated_by ) as last_updated_by
  ,t1.build_option_id
--  ,t1.feature_identifier
  ,t1.build_option_name
  ,msg.feature_enabled
  ,msg.feature_disabled
  ,apex_lang.message(
    p_name => t1.build_option_name
  ) as feature_name
  ,case
  when t1.build_option_status = 'Include'
    then msg.feature_enabled
  when build_option_status = 'Exclude'
    then msg.feature_disabled
  end as status
--  ,case
--  when t1.build_option_status = 'Include'
--    then msg.feature_enabled
--  when build_option_status = 'Exclude'
--    then msg.feature_disabled
--  end as current_status
--  ,case
--  when t1.build_option_status = 'Include'
--    then 'u-success-text'
--  when t1.build_option_status = 'Exclude'
--    then 'u-danger-text'
--  end as current_status_css_class
from apex_application_build_options t1
cross join (
  select apex_lang.message( p_name => 'APEX.FEATURE.CONFIG.ENABLED' ) feature_enabled
    ,apex_lang.message( p_name => 'APEX.FEATURE.CONFIG.DISABLED' ) feature_disabled
  from dual
) msg
where 1 = 1
and build_option_name like 'BLOG\_FEATURE\_%' escape '\'
)
select application_id
  ,build_option_id
  ,build_option_name
  ,feature_name
  ,status
  ,last_updated
  ,last_updated_by
  ,apex_item.hidden( 1, build_option_id )
  || apex_item.switch (
     p_idx        => 2
    ,p_value      => build_option_status
    ,p_on_value   => 'Include'
    ,p_on_label   => feature_enabled
    ,p_off_value  => 'Exclude'
    ,p_off_label  => feature_disabled
    ,p_item_id    => 'BO_OPT_' || rownum
    ,p_attributes => 'data-IR-switch="true"'
    ,p_item_label => (
      case
      when build_option_status = 'Include' then
        apex_lang.message(
           p_name => 'APEX.FEATURE.CONFIG.IS_ENABLED'
          ,p0 => apex_escape.html( feature_name )
        )
      when build_option_status = 'Exclude' then
        apex_lang.message(
           p_name => 'APEX.FEATURE.CONFIG.IS_DISABLED'
          ,p0 => apex_escape.html( feature_name )
        )
      end
    )
  ) as switch_html
from bo
where 1 = 1
with read only
;
