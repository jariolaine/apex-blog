--------------------------------------------------------
--  DDL for View BLOG_V_SETTINGS
--------------------------------------------------------
create or replace force view blog_v_settings as
select
  t1.id                       as id
, t1.row_version              as row_version
, t1.changed_on               as changed_on
, lower(t1.changed_by)        as changed_by
, t1.is_nullable              as is_nullable
, t1.display_seq              as display_seq
, t1.attribute_name           as attribute_name
, apex_lang.get_message(
    p_name => t1.attribute_message
  )                           as attribute_desc
, t1.attribute_value          as attribute_value
, t1.data_type                as data_type
, t1.int_min                  as int_min
, t1.int_max                  as int_max
, t1.help_message             as help_message
, (
    select lov.display_value
    from blog_v_lov lov
    where lov.lov_name = 'YES_NO'
    and to_number( lov.return_value ) = ( t1.is_nullable - 1 ) * -1
  )                           as value_required
-- HTML in query because IG removes HTML from column HTM expression in control break column
-- Control break is sorted and attribute data-sort-order gives correct order
, apex_string.format(
    p_message => '<span data-sort-order="%s" class="u-bold">%s</span>'
  , p0 => lpad( min( t1.display_seq ) over( partition by t1.attribute_group_message ), 5, '0' )
  , p1 =>
      apex_lang.get_message(
        p_name => t1.attribute_group_message
      )
  )                           as attribute_group_html
, t1.attribute_group_message  as attribute_group
from blog_settings t1
left join blog_setting_features t2 on t1.attribute_name = t2.attribute_name
where 1 = 1
  and (
    apex_application_admin.get_build_option_status(
      p_application_id    => sys_context( 'APEX$SESSION', 'APP_ID' )
    , p_build_option_name => t2.build_option_name
    ) = t2.build_option_status
    or t2.build_option_name is null
  )
with read only
/
