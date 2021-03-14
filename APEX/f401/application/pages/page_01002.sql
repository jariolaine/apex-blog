prompt --application/pages/page_01002
begin
--   Manifest
--     PAGE: 01002
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_page(
 p_id=>1002
,p_user_interface_id=>wwv_flow_api.id(6877050287267426)
,p_name=>'Footer Links Dialog'
,p_alias=>'INFORMATION'
,p_page_mode=>'MODAL'
,p_step_title=>'Information'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(8700188054171688)
,p_step_template=>wwv_flow_api.id(6762463719267365)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20210301155935'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(41876461524408305)
,p_plug_name=>'Content'
,p_region_template_options=>'#DEFAULT#:margin-bottom-lg'
,p_plug_template=>wwv_flow_api.id(6781372168267375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_util.render_dynamic_content(',
'   p_content_id  => :REQUEST',
'  ,p_date_format => :G_POST_TITLE_DATE_FORMAT',
');',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(41879333719408334)
,p_name=>'P1002_PAGE_TITLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(41876461524408305)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'U'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.component_end;
end;
/
