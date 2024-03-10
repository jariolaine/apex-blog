prompt --application/shared_components/user_interface/lovs/is_active
begin
--   Manifest
--     IS_ACTIVE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(11784376262412448)
,p_lov_name=>'IS_ACTIVE'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   v1.display_value             as display_value',
'  ,to_number( v1.return_value ) as return_value',
'from blog_v_lov v1',
'where 1 = 1',
'and v1.lov_name = ''IS_ACTIVE''',
'order by v1.display_seq'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_table=>'BLOG_V_LOV'
,p_return_column_name=>'RETURN_VALUE'
,p_display_column_name=>'DISPLAY_VALUE'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
);
wwv_flow_imp.component_end;
end;
/
