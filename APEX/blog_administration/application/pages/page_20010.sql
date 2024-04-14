prompt --application/pages/page_20010
begin
--   Manifest
--     PAGE: 20010
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>20010
,p_name=>'Administration'
,p_alias=>'ADMINISTRATION'
,p_step_title=>'Administration'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(20246051173750852)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>The administration page allows blogger to configure the application and maintain common data used across the application.',
'By selecting one of the available settings, blogger can potentially change how the application is displayed and/or features available to the end users.</p>',
'<p>This page also has links to various reports on the activity of this application.</p>'))
,p_page_component_map=>'06'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20240411201512'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(51691560566605050)
,p_plug_name=>'Configuration'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:t-ContentBlock--lightBG'
,p_component_template_options=>'#DEFAULT#:u-colors:t-MediaList--iconsRounded'
,p_plug_template=>wwv_flow_imp.id(8490381578518205)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_list_id=>wwv_flow_imp.id(24798726331419823)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(8538547318518236)
,p_translate_title=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(52139368712075166)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8506230469518215)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(20248729235781977)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(8549985374518244)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(108046136990118051)
,p_plug_name=>'Activity Reports'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:t-ContentBlock--lightBG'
,p_component_template_options=>'#DEFAULT#:u-colors'
,p_plug_template=>wwv_flow_imp.id(8490381578518205)
,p_plug_display_sequence=>10
,p_list_id=>wwv_flow_imp.id(43889817309617069)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(8538547318518236)
,p_plug_query_num_rows=>15
);
wwv_flow_imp.component_end;
end;
/
