prompt --application/shared_components/navigation/lists/navigation_menu
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(34303351556032323)
,p_name=>'Navigation Menu'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   1                    as link_level',
'  ,t1.page_title        as link_text',
'  ,blog_url.get_tab(',
'     p_app_page_id => t1.page_alias',
'   )                    as target_url',
'  ,case',
'    when t1.page_alias = :APP_PAGE_ALIAS',
'    then ''YES''',
'    else ''NO''',
'  end                   as is_current',
'from #OWNER#.blog_pages t1',
'where 1 = 1',
'and t1.is_active = 1',
'and t1.page_type = ''TAB''',
'and not case when t1.build_option is null',
'then ''INCLUDE''',
'else apex_util.get_build_option_status(',
'   p_application_id    => :APP_ID',
'  ,p_build_option_name => t1.build_option',
')',
'end = ''EXCLUDE''',
'order by t1.display_seq',
''))
,p_list_status=>'PUBLIC'
,p_required_patch=>wwv_flow_api.id(8635355820099640)
);
end;
/
