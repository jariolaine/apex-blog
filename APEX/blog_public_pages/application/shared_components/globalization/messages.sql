prompt --application/shared_components/globalization/messages
begin
--   Manifest
--     MESSAGES: 401
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
null;
wwv_flow_imp.component_end;
end;
/
begin
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(55636351016374001)
,p_name=>'BLOG_APP_DESC'
,p_message_text=>'About Almost Everything'
,p_version_scn=>41110081076467
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(55636136510372843)
,p_name=>'BLOG_APP_NAME'
,p_message_text=>'My Blog'
,p_version_scn=>41110081076461
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(39147943567749366)
,p_name=>'BLOG_ATOM_TITLE'
,p_message_text=>'%0 &raquo; Atom Feed'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7036756648298659)
,p_name=>'BLOG_GENERIC_ERROR'
,p_message_text=>'Ooops... We are sorry! Unexpected internal error have occurred. Please try again later.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(38726719560531351)
,p_name=>'BLOG_MSG_ENTER_SEARCH_TERM'
,p_message_text=>'Please enter a search term in the search box.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(41895368735673735)
,p_name=>'BLOG_MSG_LAST_UPDATED'
,p_message_text=>'Document was last updated on'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(31915575291785585)
,p_name=>'BLOG_MSG_MODERATE_ENABLED'
,p_message_text=>'Comment moderation has been enabled. All comments must be approved by the blog author.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(10467340621519122)
,p_name=>'BLOG_MSG_NO_COMMENTS'
,p_message_text=>'No comments yet on this post'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(26263231362694367)
,p_name=>'BLOG_MSG_NO_DATA_FOUND'
,p_message_text=>'No Records Found'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7042120500196275)
,p_name=>'BLOG_RSS_TITLE'
,p_message_text=>'%0 &raquo; RSS Feed'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(30074031496663213)
,p_name=>'BLOG_TXT_CATEGORY'
,p_message_text=>'Category'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9205558986702730)
,p_name=>'BLOG_TXT_COMMENT'
,p_message_text=>'Comment'
,p_version_scn=>39901465078739
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9206697868783552)
,p_name=>'BLOG_TXT_FILE'
,p_message_text=>'File'
,p_version_scn=>39901465783278
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9205751770704031)
,p_name=>'BLOG_TXT_POST'
,p_message_text=>'Post'
,p_version_scn=>39901465089953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(24586810319770154)
,p_name=>'BLOG_TXT_POSTED_BY'
,p_message_text=>'Posted by'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(24586617313766281)
,p_name=>'BLOG_TXT_POSTED_ON'
,p_message_text=>'Posted on'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(24586418712760715)
,p_name=>'BLOG_TXT_READ_MORE'
,p_message_text=>'Continue Reading'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(24587228624778564)
,p_name=>'BLOG_TXT_TAGS'
,p_message_text=>'Tags'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(26884343793378938)
,p_name=>'BLOG_VALIDATION_ERR_COMMENT_HTML'
,p_message_text=>'Please check that allowed HTML tags are entered properly.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(26897874228793079)
,p_name=>'BLOG_VALIDATION_ERR_COMMENT_LENGTH'
,p_message_text=>'Comment is too long. Please summarize the comment.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37506760598851568)
,p_name=>'BLOG_VALIDATION_ERR_EMAIL'
,p_message_text=>'Please check that the email address is entered correctly.'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
