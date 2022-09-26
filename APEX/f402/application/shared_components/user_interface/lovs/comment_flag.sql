prompt --application/shared_components/user_interface/lovs/comment_flag
begin
--   Manifest
--     COMMENT_FLAG
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.4'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(11794321487687925)
,p_lov_name=>'COMMENT_FLAG'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   v1.display_value as display_value',
'  ,v1.display_value as return_value',
'  ,v1.display_seq   as display_seq',
'from #OWNER#.blog_v_lov v1',
'where 1 = 1',
'and lov_name = ''COMMENT_FLAG'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_table=>'BLOG_V_LOV'
,p_return_column_name=>'RETURN_VALUE'
,p_display_column_name=>'DISPLAY_VALUE'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'DISPLAY_SEQ'
,p_default_sort_direction=>'ASC'
);
wwv_flow_imp.component_end;
end;
/
