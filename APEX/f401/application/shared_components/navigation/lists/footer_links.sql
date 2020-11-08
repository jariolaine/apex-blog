prompt --application/shared_components/navigation/lists/footer_links
begin
--   Manifest
--     LIST: Footer Links
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(41857893903151708)
,p_name=>'Footer Links'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null                         as list_level',
'  ,t1.content_desc                  as list_label',
'  ,apex_page.get_url(',
'     p_page     => 1002',
'    ,p_request  => t1.content_static_id',
'  )                                 as list_target',
'  ,''N''                              as is_current',
'',
'from blog_dynamic_content t1',
'where 1 = 1',
'and t1.is_active = 1',
'and t1.content_type = ''FOOTER_LINK''',
'order by t1.display_seq'))
,p_list_status=>'PUBLIC'
);
wwv_flow_api.component_end;
end;
/
