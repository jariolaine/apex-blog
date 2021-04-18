prompt --application/shared_components/globalization/messages
begin
--   Manifest
--     MESSAGES: 402
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(31240293691117226)
,p_name=>'BLOG_BTN_ARIA_LABEL_COPY_TO_CLIPBOARD'
,p_message_text=>'Copy Full URL to Clipboard'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(31239116333152817)
,p_name=>'BLOG_BTN_TITLE_COPY_TO_CLIPBOARD'
,p_message_text=>'Copy to clipboard'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(31260830488872355)
,p_name=>'BLOG_BTN_TITLE_EDIT'
,p_message_text=>'Edit'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(38326544290801225)
,p_name=>'BLOG_BTN_TITLE_OPEN'
,p_message_text=>'Open'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(26356711295747260)
,p_name=>'BLOG_BTN_TITLE_VIEW_POSTS'
,p_message_text=>'View Posts'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10038616769932485)
,p_name=>'BLOG_CATEGORIES_UK1'
,p_message_text=>'Category with same name already exists.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(22951494877017022)
,p_name=>'BLOG_CONFIRM_FILE_OVERWRITE'
,p_message_text=>'Following file(s) already exists. Please confirm file overwrite.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(19324753900501668)
,p_name=>'BLOG_CONFIRM_LINK_GROUP_DELETE'
,p_message_text=>'You have requested the permanent deletion of links label. Following link(s) will be also deleted.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(30112367443952323)
,p_name=>'BLOG_FEATURE_ABOUT'
,p_message_text=>'About'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7073242512629817)
,p_name=>'BLOG_FEATURE_ALLOW_COMMENTS'
,p_message_text=>'Commenting to posts'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(8669649763749563)
,p_name=>'BLOG_FEATURE_ARCHIVE'
,p_message_text=>'Archives'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(8651520942348857)
,p_name=>'BLOG_FEATURE_CATEGORY'
,p_message_text=>'Categories'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(37513927722106952)
,p_name=>'BLOG_FEATURE_EMAIL_VALIDATION_API'
,p_message_text=>'Validate email address using REST API call'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(24631921054971612)
,p_name=>'BLOG_FEATURE_FILES'
,p_message_text=>'Files'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(28287948386327902)
,p_name=>'BLOG_FEATURE_GROUP_COMMENTS'
,p_message_text=>'Comments'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(42619895282058203)
,p_name=>'BLOG_FEATURE_GROUP_MISC'
,p_message_text=>'Miscellaneous'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(28375527216531703)
,p_name=>'BLOG_FEATURE_GROUP_PAGE'
,p_message_text=>'Tabs and Pages '
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(28288384519293388)
,p_name=>'BLOG_FEATURE_GROUP_RIGHT_COLUMN'
,p_message_text=>'Right column'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(28288182390324870)
,p_name=>'BLOG_FEATURE_GROUP_SEARCH'
,p_message_text=>'Search'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(8674474933943719)
,p_name=>'BLOG_FEATURE_LATEST_POSTS'
,p_message_text=>'Latest posts'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(6922054863320129)
,p_name=>'BLOG_FEATURE_LINKS'
,p_message_text=>'Links'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(42619643585051305)
,p_name=>'BLOG_FEATURE_MODAL_PAGES'
,p_message_text=>'Modal pages links in blog footer'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(28283165676427890)
,p_name=>'BLOG_FEATURE_MODERATE_COMMENTS'
,p_message_text=>'Comments need to moderated'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(27923224953053769)
,p_name=>'BLOG_FEATURE_POST_PAGINATION'
,p_message_text=>'Links to newer and older post'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(8651776706351892)
,p_name=>'BLOG_FEATURE_RSS'
,p_message_text=>'RSS feed link'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(25687100030320389)
,p_name=>'BLOG_FEATURE_SEARCH_FILES'
,p_message_text=>'Search from files'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(25687386211322835)
,p_name=>'BLOG_FEATURE_SEARCH_LINKS'
,p_message_text=>'Search from links'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(8666155895722574)
,p_name=>'BLOG_FEATURE_SEARCH_POSTS'
,p_message_text=>'Search from posts'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(26723867067879987)
,p_name=>'BLOG_FEATURE_SITEMAP'
,p_message_text=>'Generate sitemap'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(33704880398366885)
,p_name=>'BLOG_FEATURE_SUBSCRIBE_COMMENTS'
,p_message_text=>'Sent email notification of new comments'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(42044380079014521)
,p_name=>'BLOG_FILES_CK4'
,p_message_text=>'Files displayed in public files must have a description.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(31903383999893435)
,p_name=>'BLOG_FILES_UK1'
,p_message_text=>'File with same name already exists.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(34308574163272763)
,p_name=>'BLOG_GENERIC_ERROR'
,p_message_text=>'Ooops... We are sorry! Unexpected internal error have occurred.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(38624054787092561)
,p_name=>'BLOG_HELP_POST_EDITOR'
,p_message_text=>'Refer online document <a target="_balank" href="https://ckeditor.com/docs/ckeditor4/latest/features/basicstyles.html">Basic Text Styles: Bold, Italic and More</a> how style your post.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(23116114610465857)
,p_name=>'BLOG_LINK_GROUPS_UK1'
,p_message_text=>'Label with same name already exists.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(40637327457556920)
,p_name=>'BLOG_MSG_BASIC_SETTINGS_INFO'
,p_message_text=>'Changes to settings only take effect for new sessions in the public application.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(25114336930810124)
,p_name=>'BLOG_MSG_NO_DATA_FOUND'
,p_message_text=>'No Records Found'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(27165806843666535)
,p_name=>'BLOG_MSG_NO_RECORDS_SELECTED'
,p_message_text=>'No Record Selected'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(19058970469252490)
,p_name=>'BLOG_PAR_CANONICAL_URL'
,p_message_text=>'Canonical URL'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(28322450890472128)
,p_name=>'BLOG_PAR_GROUP_GENERAL'
,p_message_text=>'General'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(28322663848470765)
,p_name=>'BLOG_PAR_GROUP_REPORTS'
,p_message_text=>'Reports'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(28293831052157093)
,p_name=>'BLOG_PAR_GROUP_SEO'
,p_message_text=>'URL'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(28294042511155745)
,p_name=>'BLOG_PAR_GROUP_UI'
,p_message_text=>'UI'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(19033676653882936)
,p_name=>'BLOG_PAR_G_APP_DESC'
,p_message_text=>'Blog description'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(31491518632426334)
,p_name=>'BLOG_PAR_G_APP_EMAIL'
,p_message_text=>'Blog email address'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(19034220207891682)
,p_name=>'BLOG_PAR_G_APP_NAME'
,p_message_text=>'Blog title'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(24585402247704953)
,p_name=>'BLOG_PAR_G_ARCHIVE_DATE_FORMAT'
,p_message_text=>'Archive title date format'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(19034721792903276)
,p_name=>'BLOG_PAR_G_DATE_FORMAT'
,p_message_text=>'Date format'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(40622046631847902)
,p_name=>'BLOG_PAR_G_LATEST_POST_ROWS'
,p_message_text=>'The number of posts in latest post list'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(19032802687865238)
,p_name=>'BLOG_PAR_G_POST_TITLE_DATE_FORMAT'
,p_message_text=>'Posts header date format'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(19059158261254628)
,p_name=>'BLOG_PAR_G_RSS_URL'
,p_message_text=>'RSS feed URL'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(41188745372769280)
,p_name=>'BLOG_PAR_G_RSS_XSL_URL'
,p_message_text=>'RSS feed XSL transformations (XSLT) URL'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(19033812989887423)
,p_name=>'BLOG_PAR_G_SEARCH_ROWS'
,p_message_text=>'The number of Search results per report page'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(19034096614890228)
,p_name=>'BLOG_PAR_P1_REPORT_ROWS'
,p_message_text=>'The number of posts per report page displayed on the home page'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(19034454873898260)
,p_name=>'BLOG_PAR_P2_REPORT_ROWS'
,p_message_text=>'The number of  comments per report page'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7002883853109006)
,p_name=>'BLOG_POSTS_FK2'
,p_message_text=>'Posts found from this category. Move posts to other category and then delete category.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(42684822108701097)
,p_name=>'BLOG_PUB_APP_LINK_HOME'
,p_message_text=>'Home page canonical URL'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(42687215594771663)
,p_name=>'BLOG_PUB_APP_LINK_RSS'
,p_message_text=>'RSS feed'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(42685075385703287)
,p_name=>'BLOG_PUB_APP_LINK_SITEMAP'
,p_message_text=>'Sitemap'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(10038391422712576)
,p_name=>'BLOG_TAGS_UK1'
,p_message_text=>'Tag with same name already exists.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(31462883913733496)
,p_name=>'BLOG_TXT_CHANGED_BY'
,p_message_text=>'Changed by'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(31462641396734939)
,p_name=>'BLOG_TXT_CHANGED_ON'
,p_message_text=>'Changed'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(31444183113959558)
,p_name=>'BLOG_TXT_STATUS'
,p_message_text=>'Status'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(27348583930349647)
,p_name=>'BLOG_VALIDATION_ERR_DATE_FORMAT'
,p_message_text=>'Value is not valid date format.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(31492237727374134)
,p_name=>'BLOG_VALIDATION_ERR_EMAIL'
,p_message_text=>'Not valid email address.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(27348168323345190)
,p_name=>'BLOG_VALIDATION_ERR_INTEGER'
,p_message_text=>'Value must be integer between %0 and %1.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(27348379677347133)
,p_name=>'BLOG_VALIDATION_ERR_URL'
,p_message_text=>'URL must begin with http(s)://.'
);
wwv_flow_api.component_end;
end;
/
