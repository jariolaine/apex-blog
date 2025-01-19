prompt --application/shared_components/globalization/messages
begin
--   Manifest
--     MESSAGES: 401
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>44906910937164790
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(134430745977194793)
,p_name=>'BLOG_GENERIC_ERROR'
,p_message_text=>'Ooops... We are sorry! Unexpected internal error have occurred. Please try again later.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(166120708889427485)
,p_name=>'BLOG_MSG_ENTER_SEARCH_TERM'
,p_message_text=>'Please enter a search term in the search box.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(169289358064569869)
,p_name=>'BLOG_MSG_LAST_UPDATED'
,p_message_text=>'Document was last updated on'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(159309564620681719)
,p_name=>'BLOG_MSG_MODERATE_ENABLED'
,p_message_text=>'Comment moderation has been enabled. All comments must be approved by the blog author.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137861329950415256)
,p_name=>'BLOG_MSG_NO_COMMENTS'
,p_message_text=>'No comments yet on this post'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(153657220691590501)
,p_name=>'BLOG_MSG_NO_DATA_FOUND'
,p_message_text=>'No Records Found'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(166541932896645500)
,p_name=>'BLOG_TXT_ATOM'
,p_message_text=>'Atom Feed'
,p_version_scn=>41375601993167
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(157468020825559347)
,p_name=>'BLOG_TXT_CATEGORY'
,p_message_text=>'Category'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(136599548315598864)
,p_name=>'BLOG_TXT_COMMENT'
,p_message_text=>'Comment'
,p_version_scn=>39901465078739
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(136600687197679686)
,p_name=>'BLOG_TXT_FILE'
,p_message_text=>'File'
,p_version_scn=>39901465783278
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(136599741099600165)
,p_name=>'BLOG_TXT_POST'
,p_message_text=>'Post'
,p_version_scn=>39901465089953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(151980799648666288)
,p_name=>'BLOG_TXT_POSTED_BY'
,p_message_text=>'Posted by'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(151980606642662415)
,p_name=>'BLOG_TXT_POSTED_ON'
,p_message_text=>'Posted on'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(151980408041656849)
,p_name=>'BLOG_TXT_READ_MORE'
,p_message_text=>'Continue Reading'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(134436109829092409)
,p_name=>'BLOG_TXT_RSS'
,p_message_text=>'RSS Feed'
,p_version_scn=>41375603013405
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(151981217953674698)
,p_name=>'BLOG_TXT_TAGS'
,p_message_text=>'Tags'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(154278333122275072)
,p_name=>'BLOG_VALIDATION_ERR_COMMENT_HTML'
,p_message_text=>'Please check that allowed HTML tags are entered properly.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(154291863557689213)
,p_name=>'BLOG_VALIDATION_ERR_COMMENT_LENGTH'
,p_message_text=>'Comment is too long. Please summarize the comment.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(134565831689680686)
,p_name=>'BLOG_VALIDATION_ERR_COMMENT_PREVIEW'
,p_message_text=>'Please check your that your comment has meaningful content.'
,p_version_scn=>41475013689624
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(164900749927747702)
,p_name=>'BLOG_VALIDATION_ERR_EMAIL'
,p_message_text=>'Please check that the email address is entered correctly.'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
