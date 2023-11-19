prompt --application/shared_components/navigation/lists/post_archives
begin
--   Manifest
--     LIST: Post Archives
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(30076925956418880)
,p_name=>'Post Archives'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   1                  as link_level',
'  ,v1.archive_year    as link_text',
'  ,v1.archive_url     as target_url',
'-- list is cached, can''t use is_current attribute.',
'  ,''NO''               as is_current',
'  ,''fa-chevron-right'' as image',
'  ,null               as image_attribute',
'  ,null               as image_alt_attribute',
'  ,v1.list_badge      as attribute1',
'-- Archive id data attribute.',
'-- Used in dynamic action to set class for current list item.',
'  ,v1.list_attr       as attribute2',
'  ,''blog-linkList''       as attribute3',
'from blog_v_archive_year v1',
'order by v1.archive_year desc'))
,p_list_status=>'PUBLIC'
,p_required_patch=>wwv_flow_imp.id(8670890848739263)
);
wwv_flow_imp.component_end;
end;
/
