prompt --application/shared_components/email/templates/blog_new_comment_notify
begin
--   Manifest
--     REPORT LAYOUT: Blog new comment notification
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.1'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_email_template(
 p_id=>wwv_flow_imp.id(31484344164259065)
,p_name=>'Blog new comment notification'
,p_static_id=>'BLOG_NEW_COMMENT_NOTIFY'
,p_version_number=>2
,p_subject=>'#APP_NAME# new comment notification'
,p_html_body=>'New comment received in the post <a href="#POST_LINK#">#POST_TITLE#</a>.'
,p_html_header=>'<strong>Hello #BLOGGER_NAME#,</strong>'
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
wwv_flow_imp.component_end;
end;
/
