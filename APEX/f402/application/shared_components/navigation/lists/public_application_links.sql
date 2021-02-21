prompt --application/shared_components/navigation/lists/public_application_links
begin
--   Manifest
--     LIST: Public Application Links
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(43181213072992711)
,p_name=>'Public Application Links'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null as link_level',
'  ,v1.list_label',
'  ,v1.list_link',
'  ,''N'' is_current',
'  ,v1.list_icon as list_image',
'  ,null as image_attribute',
'  ,null as image_alt_attribute',
'  ,v1.list_link as attribute1',
'  ,null as attribute2',
'  ,''target="_blank"'' as attribute3',
'from blog_v_rep_app_links v1',
'order by v1.display_seq',
''))
,p_list_status=>'PUBLIC'
);
wwv_flow_api.component_end;
end;
/
