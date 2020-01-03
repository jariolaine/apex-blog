--------------------------------------------------------
--  File created - Friday-January-03-2020
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View BLOG_APEX_BUILD_OPTIONS
--------------------------------------------------------

CREATE OR REPLACE FORCE VIEW "BLOG_APEX_BUILD_OPTIONS"
AS
select build_option_id
  ,application_id
  ,feature_identifier
  ,build_option_name
  ,apex_lang.message(
    p_name => build_option_name
  ) as feature_name
  ,case
  when build_option_status = 'Include'
    then msg.feature_enabled
  when build_option_status = 'Exclude'
    then msg.feature_disabled
  end as status
  ,apex_lang.message(
    p_name => build_option_name || '_DESC'
  ) as feature_desc
  ,last_updated_on as last_updated
  ,lower( last_updated_by ) as last_updated_by
  ,case
  when build_option_status = 'Include'
    then msg.feature_enabled
  when build_option_status = 'Exclude'
    then msg.feature_disabled
  end as current_status
  ,apex_item.hidden( 1, build_option_id )
  || apex_item.switch (
     p_idx        => 2
    ,p_value      => build_option_status
    ,p_on_value   => 'Include'
    ,p_on_label   => msg.feature_enabled
    ,p_off_value  => 'Exclude'
    ,p_off_label  => msg.feature_disabled
    ,p_item_id    => 'BO_OPT_' || rownum
    ,p_attributes => 'style="white-space:pre;display:inline-flex;"'
    ,p_item_label => (
      case
      when build_option_status = 'Include' then
        apex_lang.message(
           p_name => 'APEX.FEATURE.CONFIG.IS_ENABLED'
          ,p0 => apex_escape.html( build_option_name )
        )
      when build_option_status = 'Exclude' then
        apex_lang.message(
           p_name => 'APEX.FEATURE.CONFIG.IS_DISABLED'
          ,p0 => apex_escape.html( build_option_name )
        )
      end
    )
  ) as switch_html
  ,case
  when build_option_status = 'Include'
    then 'u-success-text'
  when build_option_status = 'Exclude'
    then 'u-danger-text'
  end as current_status_css_class
from apex_application_build_options
cross join (
  select apex_lang.message( p_name => 'APEX.FEATURE.CONFIG.ENABLED' ) feature_enabled
    ,apex_lang.message( p_name => 'APEX.FEATURE.CONFIG.DISABLED' ) feature_disabled
  from dual
) msg
where 1 = 1
and build_option_name like 'BLOG\_FEATURE\_%' escape '\'
--'
;
