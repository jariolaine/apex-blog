prompt --application/shared_components/user_interface/shortcuts/blog_requst_to_message
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(8947488695046409)
,p_shortcut_name=>'BLOG_REQUST_TO_MESSAGE'
,p_shortcut_type=>'FUNCTION_BODY'
,p_shortcut=>'return apex_lang.message( :REQUEST );'
);
end;
/
