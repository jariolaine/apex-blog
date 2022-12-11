prompt --application/pages/page_01002
begin
--   Manifest
--     PAGE: 01002
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.1'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_page.create_page(
 p_id=>1002
,p_name=>'Footer Link Modal Dialog'
,p_alias=>'INFORMATION'
,p_page_mode=>'MODAL'
,p_step_title=>'&P1002_PAGE_TITLE.'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(8700188054171688)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_chained=>'N'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'10'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20221124194856'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(41876461524408305)
,p_plug_name=>'Content'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6781372168267375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#OWNER#.blog_util.render_dynamic_content(',
'   p_content_id     => :REQUEST',
'  ,p_date_format    => :G_APP_DATE_FORMAT',
'  ,p_content_title  => :P1002_PAGE_TITLE',
');',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(36227766771379736)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(41876461524408305)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(6855239813267414)
,p_button_image_alt=>'Close'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'w40p mxw240'
,p_icon_css_classes=>'fa-close'
,p_grid_column_css_classes=>'u-textCenter padding-top-md'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41879333719408334)
,p_name=>'P1002_PAGE_TITLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6433141607894071)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(22524139649146436)
,p_computation_sequence=>10
,p_computation_item=>'P1002_PAGE_TITLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'Test'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(36227874221379737)
,p_name=>'Close Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(36227766771379736)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(36227948089379738)
,p_event_id=>wwv_flow_imp.id(36227874221379737)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(43471134461898243)
,p_name=>'Set Dialog Title'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(43471253207898244)
,p_event_id=>wwv_flow_imp.id(43471134461898243)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.util.getTopApex().jQuery(".ui-dialog-content").dialog("option", "title", "&P1002_PAGE_TITLE.");'
);
wwv_flow_imp.component_end;
end;
/
