prompt --application/shared_components/navigation/lists/ai_configuration
begin
--   Manifest
--     LIST: AI Configuration
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(114469191785084578)
,p_name=>'AI Configuration'
,p_list_status=>'PUBLIC'
,p_version_scn=>41493967392454
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(117322057090104070)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Generative AI'
,p_list_item_link_target=>'f?p=&APP_ID.:20016:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-ai'
,p_list_text_01=>'Configure generative AI to help write blog posts.'
,p_list_text_02=>'&P20010_GENERATIVE_AI_STATUS.'
,p_list_text_06=>'u-color-8'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(114469723841084562)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Language AI'
,p_list_item_link_target=>'f?p=&APP_ID.:20015:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-language'
,p_list_text_01=>'Configure Oracle cloud language service to analyze comment sentiment.'
,p_list_text_02=>'&P20010_OCI_LANG_AI_STATUS.'
,p_list_text_06=>'u-color-9'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
