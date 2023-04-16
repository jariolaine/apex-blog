prompt --application/shared_components/navigation/lists/footer_modal_pages
begin
--   Manifest
--     LIST: Footer Modal Pages
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(41857893903151708)
,p_name=>'Footer Modal Pages'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   1                as list_level',
'  ,v1.content_desc  as list_label',
'  ,v1.content_url   as list_target',
'  ,''NO''             as is_current',
'from blog_v_dynamic_content v1',
'where 1 = 1',
'  and v1.content_type = ''FOOTER_LINK''',
'order by v1.display_seq'))
,p_list_status=>'PUBLIC'
,p_required_patch=>wwv_flow_imp.id(42618909236023987)
);
wwv_flow_imp.component_end;
end;
/
