prompt --application/shared_components/navigation/lists/post_tags
begin
--   Manifest
--     LIST: Post Tags
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(13220237658425595)
,p_name=>'Post Tags'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   1              as link_level',
'  ,v1.tag         as link_text',
'  ,v1.tag_url     as target_url',
'  ,''NO''           as is_current',
'  ,null           as image',
'  ,null           as image_attribute',
'  ,null           as image_alt_attribute',
'  ,v1.list_badge  as attribute1',
'  ,v1.tag_bucket  as attribute2',
'from blog_v_tags v1',
'where 1 = 1',
'order by v1.tag'))
,p_list_status=>'PUBLIC'
,p_required_patch=>wwv_flow_imp.id(13229141933919002)
);
wwv_flow_imp.component_end;
end;
/
