prompt --application/shared_components/email/templates/blog_new_comment_notify
begin
wwv_flow_api.create_email_template(
 p_id=>wwv_flow_api.id(31484344164259065)
,p_name=>'Blog new comment notification'
,p_static_id=>'BLOG_NEW_COMMENT_NOTIFY'
,p_subject=>'#APP_NAME# new comment notification'
,p_html_body=>wwv_flow_string.join(wwv_flow_t_varchar2(
'New comment received in the post <a href="#POST_LINK#">#POST_TITLE#</a>.',
'',
''))
,p_html_header=>'<b>Hello #BLOGGER_NAME#,</b>'
,p_html_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Best Regards,<br>',
'#APP_NAME#'))
,p_text_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Hello #BLOGGER_NAME#,',
'',
'New comment received in the post #POST_TITLE#.',
'See post from below link.',
'#POST_LINK#',
'',
'Best Regards,',
'#APP_NAME#'))
);
end;
/
