prompt --application/pages/page_20010
begin
--   Manifest
--     PAGE: 20010
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
 p_id=>20010
,p_user_interface_id=>wwv_flow_api.id(8571044485518264)
,p_name=>'Administration'
,p_alias=>'ADMINISTRATION'
,p_step_title=>'Administration'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(8574375481518289)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20220209233852'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(51691560566605050)
,p_plug_name=>'Configuration'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:t-ContentBlock--lightBG'
,p_component_template_options=>'#DEFAULT#:u-colors:t-MediaList--iconsRounded'
,p_plug_template=>wwv_flow_api.id(8490381578518205)
,p_plug_display_sequence=>10
,p_list_id=>wwv_flow_api.id(24798726331419823)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(8538547318518236)
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(52139368712075166)
,p_plug_name=>'Administration'
,p_region_template_options=>'#DEFAULT#:t-HeroRegion--hideIcon'
,p_plug_template=>wwv_flow_api.id(8492139706518207)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.component_end;
end;
/
