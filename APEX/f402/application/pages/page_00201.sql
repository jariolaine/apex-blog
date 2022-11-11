prompt --application/pages/page_00201
begin
--   Manifest
--     PAGE: 00201
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
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
,p_page_component_map=>'10'
,p_last_updated_by=>'LAINFJAR'
,p_last_upd_yyyymmddhh24miss=>'20221003075500'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38181061881570820)
,p_plug_name=>'Help Text'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8475374748518195)
,p_plug_display_sequence=>10
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_application.help(',
'  p_flow_id        => :APP_ID',
'  ,p_flow_step_id   => 12',
'  ,p_show_item_help => ''YES''',
'  ,p_show_regions   => ''YES''',
'  ,p_before_page_html   => ''<div>''',
'  ,p_after_page_html    => ''</div>''',
'  ,p_before_region_html => ''<h2>''',
'  ,p_after_region_html  => ''</h2>''',
'  --,p_before_prompt_html => ''<p><strong>''',
'  --,p_after_prompt_html  => ''</strong>''',
'  --,p_before_item_html   => ''<span>''',
'  --,p_after_item_html    => ''</span></p>''',
'  ,p_before_prompt_html => ''<dl><dt><b>''',
'  ,p_after_prompt_html  => ''</b></dt>''',
'  ,p_before_item_html   => ''<dd>''',
'  ,p_after_item_html    => ''</dd></dl>''',
');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19110028917561785)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(38181061881570820)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(8549262062518244)
,p_button_image_alt=>'Close'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-remove'
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
