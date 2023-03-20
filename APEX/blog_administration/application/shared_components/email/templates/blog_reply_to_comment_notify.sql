prompt --application/shared_components/email/templates/blog_reply_to_comment_notify
begin
--   Manifest
--     REPORT LAYOUT: Blog reply to comment notification
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_email_template(
 p_id=>wwv_flow_imp.id(31515408461580789)
,p_name=>'Blog reply to comment notification'
,p_static_id=>'BLOG_REPLY_TO_COMMENT_NOTIFY'
,p_version_number=>2
,p_subject=>'#APP_NAME!RAW# new reply to comments'
,p_html_body=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>You have chosen to receive follow up notification if new reply is posted to <a href="#POST_LINK#">#POST_TITLE#</a>.</p>',
'<p>Please do not reply to this email. This mailbox does not allow incoming messages.</p>',
'<p>If you wish not get notification email in future you can <a href="#UNSUBSCRIBE_LINK#">unsubscibe</a>.</p>'))
,p_html_header=>'Hi,'
,p_html_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Best Regards,<br>',
'#APP_NAME!RAW#',
'</p>'))
,p_text_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Hi,',
'',
'You have chosen to receive follow up notification if new reply is posted to "#POST_TITLE!RAW#".',
'See blog post and comments from below link.',
'#POST_LINK!RAW#',
'',
'Please do not reply to this email. This mailbox does not allow incoming messages.',
'',
'If you wish not get notification email in future you can unsubscibe using below link.',
'#UNSUBSCRIBE_LINK!RAW#',
'',
'Best Regards,',
'#APP_NAME!RAW#'))
);
wwv_flow_imp.component_end;
end;
/
