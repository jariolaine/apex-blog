prompt --application/shared_components/user_interface/shortcuts/blog_requst_to_message
begin
--   Manifest
--     SHORTCUT: BLOG_REQUST_TO_MESSAGE
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(8947488695046409)
,p_shortcut_name=>'BLOG_REQUST_TO_MESSAGE'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>'return apex_lang.message( :REQUEST );'
);
wwv_flow_api.component_end;
end;
/
