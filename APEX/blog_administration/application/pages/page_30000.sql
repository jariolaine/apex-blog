prompt --application/pages/page_30000
begin
--   Manifest
--     PAGE: 30000
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>30000
,p_name=>'Reports'
,p_alias=>'REPORTS'
,p_step_title=>'Reports'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(111116381830742743)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>'<p>This page has links to various reports on e.g. the activity of this application.</p>'
,p_page_component_map=>'06'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(231493683974522115)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(90952353111350306)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(102694851877614068)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(90996108016350335)
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(287400452252565000)
,p_plug_name=>'Activity'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:t-ContentBlock--lightBG'
,p_component_template_options=>'#DEFAULT#:u-colors:t-MediaList--cols t-MediaList--2cols'
,p_plug_template=>wwv_flow_imp.id(90936504220350296)
,p_plug_display_sequence=>10
,p_location=>null
,p_list_id=>wwv_flow_imp.id(126335939951449160)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(90984669960350327)
,p_plug_query_num_rows=>15
,p_ai_enabled=>false
,p_plug_comment=>'Public application activity reports'
);
wwv_flow_imp.component_end;
end;
/
