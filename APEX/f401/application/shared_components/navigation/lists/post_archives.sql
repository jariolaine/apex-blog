prompt --application/shared_components/navigation/lists/post_archives
begin
--   Manifest
--     LIST: Post Archives
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(30076925956418880)
,p_name=>'Post Archives'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   1                                                  as link_level',
'  ,v1.archive_year                                    as link_text',
'  ,#OWNER#.blog_url.get_archive(',
'     p_archive_id => v1.archive_year',
'   )                                                  as target_url',
'-- list is cached',
'-- we can''t use is_current attribute',
'  ,''NO''                                               as is_current',
'  ,null                                               as image',
'  ,null                                               as image_attribute',
'  ,null                                               as image_alt_attribute',
'  ,case when d.post_count = ''INCLUDE''',
'    then v1.post_count',
'  end                                                 as attribute1',
'-- add archive id to data attribute',
'-- we can use it then in dynamic action',
'-- set class for current list item',
'  ,''data-blog-content-id="'' || v1.archive_year || ''"'' as attribute2',
'  ,''z-linkList''                                       as attribute3',
'from #OWNER#.blog_v_archive_year v1',
'cross join(',
'  select apex_util.get_build_option_status(',
'     p_application_id => :APP_ID',
'    ,p_build_option_name => ''BLOG_FEATURE_ARCHIVE_POST_COUNT''',
'  ) as post_count',
'  from dual',
') d',
'order by v1.archive_year desc',
''))
,p_list_status=>'PUBLIC'
,p_required_patch=>wwv_flow_api.id(8670890848739263)
);
wwv_flow_api.component_end;
end;
/
