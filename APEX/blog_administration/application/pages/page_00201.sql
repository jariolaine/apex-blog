prompt --application/pages/page_00201
begin
--   Manifest
--     PAGE: 00201
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
 p_id=>201
,p_name=>'Dynamic Help'
,p_alias=>'HELP'
,p_page_mode=>'MODAL'
,p_step_title=>'Help'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(8930100593603171)
,p_step_template=>wwv_flow_imp.id(8456403392518180)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>'No help available for this page.'
,p_page_component_map=>'11'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20231005190441'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38593123511274332)
,p_plug_name=>'Help Text'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8475374748518195)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'BELOW'
,p_plug_source_type=>'NATIVE_HELP_TEXT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19110028917561785)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(38593123511274332)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Close'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'w40p mxw240'
,p_icon_css_classes=>'fa-close'
,p_grid_column_css_classes=>'u-textCenter padding-top-md'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(19110790732561798)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(19110028917561785)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19111151741561799)
,p_event_id=>wwv_flow_imp.id(19110790732561798)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp.component_end;
end;
/
