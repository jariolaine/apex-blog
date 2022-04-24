prompt --application/pages/page_00202
begin
--   Manifest
--     PAGE: 00202
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_page(
 p_id=>202
,p_user_interface_id=>wwv_flow_api.id(8571044485518264)
,p_name=>'About This Application'
,p_alias=>'ABOUT-THIS-APPLICATION'
,p_page_mode=>'MODAL'
,p_step_title=>'About This Application'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(8930100593603171)
,p_page_template_options=>'#DEFAULT#:t-Dialog--noPadding'
,p_protection_level=>'C'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20220417044528'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(11416108930329119)
,p_name=>'Information'
,p_template=>wwv_flow_api.id(8475374748518195)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:margin-top-md:margin-bottom-md'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  ''Version''         as attribute_message',
'  ,attribute_value  as attribute_value',
'  ,1                as display_seq',
'from blog_settings',
'where 1 = 1',
'  and attribute_name = ''G_APP_VERSION''',
'union all',
'select',
'  ''Installed''       as attribute_message',
'  ,to_char(',
'    created_on',
'    ,''DD.MM.YYYY HH24:MI''',
'  )                 as attribute_value',
'  ,2                as display_seq ',
'from blog_settings',
'where 1 = 1',
'  and attribute_name = ''G_APP_VERSION''',
'union all',
'select',
'  ''Last Upgrade''   as attribute_message',
'  ,case when exists(',
'    select 1',
'    from blog_settings x1',
'    where x1.attribute_name like ''PATCH%''',
'  )',
'  then',
'    to_char( changed_on, ''DD.MM.YYYY HH24:MI'' )',
'  end               as attribute_value',
'  ,3                as display_seq ',
'from blog_settings',
'where 1 = 1',
'  and attribute_name = ''G_APP_VERSION''',
'order by display_seq'))
,p_optimizer_hint=>'APEX$USE_NO_PAGINATION'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(8511931463518219)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(11416887123329126)
,p_query_column_id=>1
,p_column_alias=>'ATTRIBUTE_MESSAGE'
,p_column_display_sequence=>20
,p_column_heading=>'Name'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(11416335010329121)
,p_query_column_id=>2
,p_column_alias=>'ATTRIBUTE_VALUE'
,p_column_display_sequence=>30
,p_column_heading=>'Value'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(11416947696329127)
,p_query_column_id=>3
,p_column_alias=>'DISPLAY_SEQ'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.component_end;
end;
/
