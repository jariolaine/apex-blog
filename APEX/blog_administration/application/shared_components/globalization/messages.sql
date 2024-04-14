prompt --application/shared_components/globalization/messages
begin
--   Manifest
--     MESSAGES: 402
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
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
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(55636898271377244)
,p_name=>'BLOG_APP_DESC'
,p_message_text=>'About Almost Everything'
,p_version_scn=>41110081076479
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(55636638660376194)
,p_name=>'BLOG_APP_NAME'
,p_message_text=>'My Blog'
,p_version_scn=>41110081076478
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(10038616769932485)
,p_name=>'BLOG_CATEGORIES_UK1'
,p_message_text=>'Category with same name already exists.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11497889124886694)
,p_name=>'BLOG_COMMENTS_FK1'
,p_message_text=>'There are comments in this post. Please delete the comments first.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11496972742855356)
,p_name=>'BLOG_COMMENTS_FK2'
,p_message_text=>'This comment has been replied. Please delete the reply first.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(13430707086493199)
,p_name=>'BLOG_CONFIRM_DELETE_UNUSED_CATEGORIES'
,p_message_text=>'All categories without posts will be deleted. Would you like to perform this delete action?'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(13431083050498913)
,p_name=>'BLOG_CONFIRM_DELETE_UNUSED_TAGS'
,p_message_text=>'All tags not used in posts will be deleted. Would you like to perform this delete action?'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(22951494877017022)
,p_name=>'BLOG_CONFIRM_FILE_OVERWRITE'
,p_message_text=>'Following file(s) already exists. Please confirm file overwrite.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19324753900501668)
,p_name=>'BLOG_CONFIRM_LINK_GROUP_DELETE'
,p_message_text=>'You have requested the permanent deletion of links collection. Following link(s) will be also deleted.'
,p_version_scn=>41109091843403
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(36077116368425357)
,p_name=>'BLOG_CONFIRM_RESEQUENCE_CATEGORIES'
,p_message_text=>'Resequence categories, incrementing sequence numbers by 10?'
,p_version_scn=>41102141851437
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(54693555116494509)
,p_name=>'BLOG_CONFIRM_RESEQUENCE_DYNAMIC_CONTENT'
,p_message_text=>'Resequence popup pages entries, incrementing sequence numbers by 10?'
,p_version_scn=>41109631736639
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(36077759827431234)
,p_name=>'BLOG_CONFIRM_RESEQUENCE_LINKS'
,p_message_text=>'Resequence link entries, incrementing sequence numbers by 10?'
,p_version_scn=>41102142240904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(36077521830429519)
,p_name=>'BLOG_CONFIRM_RESEQUENCE_LINK_GROUPS'
,p_message_text=>'Resequence group entries, incrementing sequence numbers by 10?'
,p_version_scn=>41102141954013
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(36077305283427470)
,p_name=>'BLOG_CONFIRM_RESEQUENCE_TAGS'
,p_message_text=>'Resequence tags, incrementing sequence numbers by 10?'
,p_version_scn=>41102141901778
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(30112367443952323)
,p_name=>'BLOG_FEATURE_ABOUT'
,p_message_text=>'About'
,p_version_scn=>41109163194294
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7073242512629817)
,p_name=>'BLOG_FEATURE_ALLOW_COMMENTS'
,p_message_text=>'Commenting to posts'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(8669649763749563)
,p_name=>'BLOG_FEATURE_ARCHIVE'
,p_message_text=>'Archives list'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(60752461687225986)
,p_name=>'BLOG_FEATURE_ARCHIVE_POST_COUNT'
,p_message_text=>'Archive post count'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(39129126425331606)
,p_name=>'BLOG_FEATURE_ATOM'
,p_message_text=>'Atom feed'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(8651520942348857)
,p_name=>'BLOG_FEATURE_CATEGORY'
,p_message_text=>'Categories list'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(61048607162603249)
,p_name=>'BLOG_FEATURE_CATEGORY_POST_COUNT'
,p_message_text=>'Category post count'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(24631921054971612)
,p_name=>'BLOG_FEATURE_FILES'
,p_message_text=>'Files'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(28287948386327902)
,p_name=>'BLOG_FEATURE_GROUP_COMMENTS'
,p_message_text=>'Comments'
,p_version_scn=>41109165078645
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(42619895282058203)
,p_name=>'BLOG_FEATURE_GROUP_MISC'
,p_message_text=>'Miscellaneous'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(28375527216531703)
,p_name=>'BLOG_FEATURE_GROUP_PAGE'
,p_message_text=>'Pages'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(28288384519293388)
,p_name=>'BLOG_FEATURE_GROUP_RIGHT_COLUMN'
,p_message_text=>'Right column'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(8674474933943719)
,p_name=>'BLOG_FEATURE_LATEST_POSTS'
,p_message_text=>'Latest posts list'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6922054863320129)
,p_name=>'BLOG_FEATURE_LINKS'
,p_message_text=>'Links'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(42619643585051305)
,p_name=>'BLOG_FEATURE_MODAL_PAGES'
,p_message_text=>'Modal pages links in blog footer'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(28283165676427890)
,p_name=>'BLOG_FEATURE_MODERATE_COMMENTS'
,p_message_text=>'Comments need to approve'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(27923224953053769)
,p_name=>'BLOG_FEATURE_POST_PAGINATION'
,p_message_text=>'Links to newer and older post'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(8651776706351892)
,p_name=>'BLOG_FEATURE_RSS'
,p_message_text=>'RSS feed link'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(38748347337001747)
,p_name=>'BLOG_FEATURE_SEARCH'
,p_message_text=>'Search'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9187375700861965)
,p_name=>'BLOG_FEATURE_SEARCH_COMMENTS'
,p_message_text=>'Search from comments'
,p_version_scn=>39901457350025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(25687100030320389)
,p_name=>'BLOG_FEATURE_SEARCH_FILES'
,p_message_text=>'Search from files'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(25687386211322835)
,p_name=>'BLOG_FEATURE_SEARCH_LINKS'
,p_message_text=>'Search from links'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(8666155895722574)
,p_name=>'BLOG_FEATURE_SEARCH_POSTS'
,p_message_text=>'Search from posts'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(26723867067879987)
,p_name=>'BLOG_FEATURE_SITEMAP'
,p_message_text=>'Generate sitemap'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(33704880398366885)
,p_name=>'BLOG_FEATURE_SUBSCRIBE_COMMENTS'
,p_message_text=>'Email notification of new comments for users'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(13259733204701586)
,p_name=>'BLOG_FEATURE_TAG_CLOUD'
,p_message_text=>'Tag Cloud'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(13260140810708853)
,p_name=>'BLOG_FEATURE_TAG_CLOUD_POST_COUNT'
,p_message_text=>'Tag post count'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(42044380079014521)
,p_name=>'BLOG_FILES_CK4'
,p_message_text=>'Files displayed in public files must have a description.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(31903383999893435)
,p_name=>'BLOG_FILES_UK1'
,p_message_text=>'File with same name already exists.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(34308574163272763)
,p_name=>'BLOG_GENERIC_ERROR'
,p_message_text=>'Ooops... We are sorry! Unexpected internal error have occurred.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19894083253206015)
,p_name=>'BLOG_HELP_BLOG_APP_DESC'
,p_message_text=>'Description of this blog.'
,p_version_scn=>41109923289318
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19893743625198161)
,p_name=>'BLOG_HELP_BLOG_APP_NAME'
,p_message_text=>'Name of this blog.'
,p_version_scn=>41109923241128
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21952495135451489)
,p_name=>'BLOG_HELP_FEATURE_ABOUT'
,p_message_text=>'Enable or disable "About" tab.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21480702253327342)
,p_name=>'BLOG_HELP_FEATURE_ALLOW_COMMENTS'
,p_message_text=>'Enable or disable commenting on blog posts.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21968614313753451)
,p_name=>'BLOG_HELP_FEATURE_ARCHIVE'
,p_message_text=>'Enable or disable archives list.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21968854038758598)
,p_name=>'BLOG_HELP_FEATURE_ARCHIVE_POST_COUNT'
,p_message_text=>'Enable or disable post count in the archive list.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(39129511024342498)
,p_name=>'BLOG_HELP_FEATURE_ATOM'
,p_message_text=>'Enable or disable atom feed.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21968269442744987)
,p_name=>'BLOG_HELP_FEATURE_CATEGORY'
,p_message_text=>'Enable or disable categories link list.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21968490295748783)
,p_name=>'BLOG_HELP_FEATURE_CATEGORY_POST_COUNT'
,p_message_text=>'Enable or disable post count in the category list.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21499163815310526)
,p_name=>'BLOG_HELP_FEATURE_FILES'
,p_message_text=>'Enable or disable the "Files" tab. If it is disabled, file search is also disabled.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21481638153374207)
,p_name=>'BLOG_HELP_FEATURE_LATEST_POSTS'
,p_message_text=>'Enable or disable the latest blog posts list.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21498914254307400)
,p_name=>'BLOG_HELP_FEATURE_LINKS'
,p_message_text=>'Enable or disable the "Links" tab. If it is disabled, link search is also disabled.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21481968660385994)
,p_name=>'BLOG_HELP_FEATURE_MODAL_PAGES'
,p_message_text=>'Enable or disable popup pages links in blog footer.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21480924593335899)
,p_name=>'BLOG_HELP_FEATURE_MODERATE_COMMENTS'
,p_message_text=>'Enable or disable comments manual approval before they are published.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21481423437369380)
,p_name=>'BLOG_HELP_FEATURE_POST_PAGINATION'
,p_message_text=>'Enable or disable links to previous and / or newer posts.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21969179471767472)
,p_name=>'BLOG_HELP_FEATURE_RSS'
,p_message_text=>'Enable or disable link to the RSS feed.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(38751545807213506)
,p_name=>'BLOG_HELP_FEATURE_SEARCH'
,p_message_text=>'Enable or disable "Search" tab.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(9187755630875345)
,p_name=>'BLOG_HELP_FEATURE_SEARCH_COMMENTS'
,p_message_text=>'Enable or disable comment search.'
,p_version_scn=>39901457471463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21500166358341864)
,p_name=>'BLOG_HELP_FEATURE_SEARCH_FILES'
,p_message_text=>'Enable or disable file search. Search is available if the "Files" tab is also enabled.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21499316517316056)
,p_name=>'BLOG_HELP_FEATURE_SEARCH_LINKS'
,p_message_text=>'Enable or disable link search. Search is available if the "Link" tab is also enabled.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21968065227738854)
,p_name=>'BLOG_HELP_FEATURE_SEARCH_POSTS'
,p_message_text=>'Enable or disable post search.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21482145994393818)
,p_name=>'BLOG_HELP_FEATURE_SITEMAP'
,p_message_text=>'Enable or disable generating sitemap index and sitemaps for public pages. See sitemap URL from this application home page.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(21481269068360471)
,p_name=>'BLOG_HELP_FEATURE_SUBSCRIBE_COMMENTS'
,p_message_text=>'When commenting on a blog post, users can enter their email address and receive an email notification when their comment is answered. The application email address must also be filled in the application settings to send the email.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(13263270037759990)
,p_name=>'BLOG_HELP_FEATURE_TAG_CLOUD'
,p_message_text=>'Enable or disable tag cloud.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(13259930374705339)
,p_name=>'BLOG_HELP_FEATURE_TAG_CLOUD_POST_COUNT'
,p_message_text=>'Enable or disable post count in the tag cloud'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(65335091944381875)
,p_name=>'BLOG_HELP_G_APP_EMAIL'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Email address from which notifications will be sent, for example',
'notification of new comments. If blank, no notifications will be sent.'))
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(65392119713598778)
,p_name=>'BLOG_HELP_G_CANONICAL_HOST'
,p_message_text=>'Protocol and host used for pages header link rel="canonical", RSS feed and sitemap. Example https://example.com. If empty, current URL protocol and host is used.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12033403413143883)
,p_name=>'BLOG_HELP_G_COMMENT_WATCH_MONTHS'
,p_message_text=>'How many months will a user receive an email notification of new replies after they last comment on a post. The value must be an integer between %0 and %1.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19895931361259762)
,p_name=>'BLOG_HELP_G_LATEST_POST_ROWS'
,p_message_text=>'The number of post displayed on the latest post list. The value must be an integer between %0 and %1. Changes to this settings only take effect in new sessions of the public application.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12338282619659168)
,p_name=>'BLOG_HELP_G_MAX_AGE_DOWNLOAD'
,p_message_text=>'Cache-Control HTTP response header max-age for files that are available for download on the "Files" page of the public application. The maximum amount of time in seconds that fetched responses are allowed to be used again by clients. The value must b'
||'e an integer between %0 and %1.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12339961160737270)
,p_name=>'BLOG_HELP_G_MAX_AGE_FILE'
,p_message_text=>'Cache-Control HTTP response header max-age for files that are not downloadable on the "Files" page of the public application. The maximum amount of time in seconds that fetched responses are allowed to be used again by clients. The value must be an i'
||'nteger between %0 and %1.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12339542583729722)
,p_name=>'BLOG_HELP_G_MAX_AGE_RSS'
,p_message_text=>'RSS feed Cache-Control HTTP response header max-age. The maximum amount of time in seconds that fetched responses are allowed to be used again by clients. The value must be an integer between %0 and %1.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12339734667736379)
,p_name=>'BLOG_HELP_G_MAX_AGE_RSS_XSL'
,p_message_text=>'RSS feed XSL Cache-Control HTTP response header max-age. The maximum amount of time in seconds that fetched responses are allowed to be used again by clients. The value must be an integer between %0 and %1.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12340277586750046)
,p_name=>'BLOG_HELP_G_MAX_AGE_SITEMAP'
,p_message_text=>'Sitemap Cache-Control HTTP response header max-age. The maximum amount of time in seconds that fetched responses are allowed to be used again by clients. The value must be an integer between %0 and %1.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(65369256313682348)
,p_name=>'BLOG_HELP_G_RSS_URL'
,p_message_text=>'Specify custom RSS feed URL. If empty, default public application RSS feed is used.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19898492601459176)
,p_name=>'BLOG_HELP_G_RSS_XSL_URL'
,p_message_text=>'RSS feed custom XSL transformations (XSLT) URL for public application default RSS feed.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19897213779441945)
,p_name=>'BLOG_HELP_P0_BLOG_APP_DATE_FORMAT'
,p_message_text=>'Public pages date format. Changes to this settings only take effect in new sessions of the public application.'
,p_version_scn=>41109922856403
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19897443841446602)
,p_name=>'BLOG_HELP_P0_BLOG_POST_DATE_FORMAT'
,p_message_text=>'Date format for blog posts header. Changes to this settings only take effect in new sessions of the public application.'
,p_version_scn=>41109922877085
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19896387769414873)
,p_name=>'BLOG_HELP_P0_BLOG_SEARCH_ROWS'
,p_message_text=>'The number of Search results per report page. The value must be an integer between %0 and %1. Changes to this settings only take effect in new sessions of the public application.'
,p_version_scn=>41109923047097
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19894253687211234)
,p_name=>'BLOG_HELP_P1_BLOG_POST_ROWS'
,p_message_text=>'The number of posts per report page displayed on the home page. The value must be an integer between %0 and %1. Changes to this settings only take effect in new sessions of the public application.'
,p_version_scn=>41109923078771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19895088592241687)
,p_name=>'BLOG_HELP_P2_BLOG_COMMENT_ROWS'
,p_message_text=>'The number of comments per report page displayed on the post page. The value must be an integer between %0 and %1. Changes to this settings only take effect in new sessions of the public application.'
,p_version_scn=>41109923207454
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(23116114610465857)
,p_name=>'BLOG_LINK_GROUPS_UK1'
,p_message_text=>'Label with same name already exists.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11806175851595252)
,p_name=>'BLOG_LOV_COMMENT_FLAG_NEW'
,p_message_text=>'New'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11806971482595261)
,p_name=>'BLOG_LOV_COMMENT_FLAG_READ'
,p_message_text=>'Read'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11806625459595261)
,p_name=>'BLOG_LOV_COMMENT_FLAG_REPLY'
,p_message_text=>'Reply'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11806336851595261)
,p_name=>'BLOG_LOV_COMMENT_FLAG_UNREAD'
,p_message_text=>'Unread'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11807801060595262)
,p_name=>'BLOG_LOV_COMMENT_STATUS_MODERATE'
,p_message_text=>'Not Approved'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37793480369575211)
,p_name=>'BLOG_LOV_LINK_STATUS_GROUP_DISABLED'
,p_message_text=>'Group is Disabled'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11810829232595266)
,p_name=>'BLOG_LOV_POST_STATUS_BLOGGER_DISABLED'
,p_message_text=>'Blogger is Disabled'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11810576248595265)
,p_name=>'BLOG_LOV_POST_STATUS_CATEGORY_DISABLED'
,p_message_text=>'Category is Disabled'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11810274491595265)
,p_name=>'BLOG_LOV_POST_STATUS_DRAFT'
,p_message_text=>'Draft'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11809630217595264)
,p_name=>'BLOG_LOV_POST_STATUS_PUBLISHED'
,p_message_text=>'Published'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11809934906595265)
,p_name=>'BLOG_LOV_POST_STATUS_SCHEDULED'
,p_message_text=>'Scheduled'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11811143035595266)
,p_name=>'BLOG_LOV_YES_NO_NO'
,p_message_text=>'No'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11811433591595266)
,p_name=>'BLOG_LOV_YES_NO_YES'
,p_message_text=>'Yes'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(40637327457556920)
,p_name=>'BLOG_MSG_BASIC_SETTINGS_INFO'
,p_message_text=>'Changes to some settings only take effect in new sessions of the public application.'
,p_version_scn=>41108684774903
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37487208542792958)
,p_name=>'BLOG_MSG_CATEGORIES_RESEQUENCED'
,p_message_text=>'Categories resequenced.'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37482135614712288)
,p_name=>'BLOG_MSG_CATEGORIES_UNUSED_DELETED'
,p_message_text=>'Unused categories deleted.'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(54693974405502152)
,p_name=>'BLOG_MSG_DYNAMIC_CONTENT_RESEQUENCED'
,p_message_text=>'Popup pages resequenced.'
,p_is_js_message=>true
,p_version_scn=>41109631952573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(38635396322275585)
,p_name=>'BLOG_MSG_ENTER_SEARCH_TERM'
,p_message_text=>'Please enter a search term in the search box.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(53082461104354836)
,p_name=>'BLOG_MSG_LINKS_RESEQUENCED'
,p_message_text=>'Links resequenced.'
,p_is_js_message=>true
,p_version_scn=>41109174558245
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(53082743703359956)
,p_name=>'BLOG_MSG_LINK_GROUPS_RESEQUENCED'
,p_message_text=>'Link groups resequenced.'
,p_is_js_message=>true
,p_version_scn=>41109174668736
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(25114336930810124)
,p_name=>'BLOG_MSG_NO_DATA_FOUND'
,p_message_text=>'No records found.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37488439234807046)
,p_name=>'BLOG_MSG_TAGS_RESEQUENCED'
,p_message_text=>'Tags resequenced.'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37481975424710084)
,p_name=>'BLOG_MSG_TAGS_UNUSED_DELETED'
,p_message_text=>'Unused tags deleted.'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7002883853109006)
,p_name=>'BLOG_POSTS_FK2'
,p_message_text=>'Posts found from this category. Move posts to other category and then delete category.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(31976065517652232)
,p_name=>'BLOG_POSTS_UK1'
,p_message_text=>'Post with same published on date and time already exists.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(38126994921169888)
,p_name=>'BLOG_POST_TAGS_UK1'
,p_message_text=>'Post have duplicate tags.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(39128954460325864)
,p_name=>'BLOG_PUB_APP_LINK_ATOM'
,p_message_text=>'Atom feed'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(42684822108701097)
,p_name=>'BLOG_PUB_APP_LINK_HOME'
,p_message_text=>'Home page canonical URL'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(42687215594771663)
,p_name=>'BLOG_PUB_APP_LINK_RSS'
,p_message_text=>'RSS feed'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(42685075385703287)
,p_name=>'BLOG_PUB_APP_LINK_SITEMAP'
,p_message_text=>'Sitemap'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19033676653882936)
,p_name=>'BLOG_SETTING_BLOG_APP_DESC'
,p_message_text=>'Blog description'
,p_version_scn=>41109715128001
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19034220207891682)
,p_name=>'BLOG_SETTING_BLOG_APP_NAME'
,p_message_text=>'Blog name'
,p_version_scn=>41109715155716
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12004799006885141)
,p_name=>'BLOG_SETTING_GROUP_COMMENTS'
,p_message_text=>'Comments'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12336445174569114)
,p_name=>'BLOG_SETTING_GROUP_FILES'
,p_message_text=>'Files'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(28322450890472128)
,p_name=>'BLOG_SETTING_GROUP_GENERAL'
,p_message_text=>'General'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(28322663848470765)
,p_name=>'BLOG_SETTING_GROUP_REPORTS'
,p_message_text=>'Reports'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(28293831052157093)
,p_name=>'BLOG_SETTING_GROUP_SEO'
,p_message_text=>'URL'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(28294042511155745)
,p_name=>'BLOG_SETTING_GROUP_UI'
,p_message_text=>'Appearance'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(31491518632426334)
,p_name=>'BLOG_SETTING_G_APP_EMAIL'
,p_message_text=>'Blog email address'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19058970469252490)
,p_name=>'BLOG_SETTING_G_CANONICAL_HOST'
,p_message_text=>'Canonical protocol and host for URLs'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12004960061893955)
,p_name=>'BLOG_SETTING_G_COMMENT_WATCH_MONTHS'
,p_message_text=>'Month(s) user email notification subscription is valid'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(40622046631847902)
,p_name=>'BLOG_SETTING_G_LATEST_POST_ROWS'
,p_message_text=>'Number of latest posts'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12336887427579011)
,p_name=>'BLOG_SETTING_G_MAX_AGE_DOWNLOAD'
,p_message_text=>'Downloads cache max age'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12337047070580585)
,p_name=>'BLOG_SETTING_G_MAX_AGE_FILE'
,p_message_text=>'Inline files cache max age'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12336626913574559)
,p_name=>'BLOG_SETTING_G_MAX_AGE_RSS'
,p_message_text=>'RSS and atom feed cache max age'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12337953363617184)
,p_name=>'BLOG_SETTING_G_MAX_AGE_RSS_XSL'
,p_message_text=>'RSS feed XSL cache max age'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(12337238231582028)
,p_name=>'BLOG_SETTING_G_MAX_AGE_SITEMAP'
,p_message_text=>'Sitemaps cache max age'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19059158261254628)
,p_name=>'BLOG_SETTING_G_RSS_URL'
,p_message_text=>'Custom RSS feed URL'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(41188745372769280)
,p_name=>'BLOG_SETTING_G_RSS_XSL_URL'
,p_message_text=>'RSS feed custom XSL'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19034721792903276)
,p_name=>'BLOG_SETTING_P0_BLOG_APP_DATE_FORMAT'
,p_message_text=>'Date format'
,p_version_scn=>41109922925114
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19032802687865238)
,p_name=>'BLOG_SETTING_P0_BLOG_POST_DATE_FORMAT'
,p_message_text=>'Posts header date format'
,p_version_scn=>41109922890008
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19033812989887423)
,p_name=>'BLOG_SETTING_P0_BLOG_SEARCH_ROWS'
,p_message_text=>'Number of search results'
,p_version_scn=>41109923035836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19034096614890228)
,p_name=>'BLOG_SETTING_P1_BLOG_POST_ROWS'
,p_message_text=>'Number of post on home page'
,p_version_scn=>41109923089414
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(19034454873898260)
,p_name=>'BLOG_SETTING_P2_BLOG_COMMENT_ROWS'
,p_message_text=>'Number of comments'
,p_version_scn=>41109923199313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(10038391422712576)
,p_name=>'BLOG_TAGS_UK1'
,p_message_text=>'Tag with same name already exists.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(31239116333152817)
,p_name=>'BLOG_TXT_COPY_TO_CLIPBOARD'
,p_message_text=>'Copy URL to Clipboard'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37792602476566104)
,p_name=>'BLOG_TXT_DISABLED'
,p_message_text=>'Disabled'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(31260830488872355)
,p_name=>'BLOG_TXT_EDIT'
,p_message_text=>'Edit'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37792871553567374)
,p_name=>'BLOG_TXT_ENABLED'
,p_message_text=>'Enabled'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(65330915785227244)
,p_name=>'BLOG_TXT_HELP'
,p_message_text=>'Help'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(38326544290801225)
,p_name=>'BLOG_TXT_OPEN_COMMENT'
,p_message_text=>'Open Comment'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(16723151198968143)
,p_name=>'BLOG_TXT_OPEN_NEW_TAB'
,p_message_text=>'Open in a new tab'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(13411744988522858)
,p_name=>'BLOG_TXT_SEQUENCE'
,p_message_text=>'Sequence'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(37919359181996088)
,p_name=>'BLOG_TXT_STATUS'
,p_message_text=>'Status'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(26356711295747260)
,p_name=>'BLOG_TXT_VIEW_POSTS'
,p_message_text=>'View Posts'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(27348583930349647)
,p_name=>'BLOG_VALIDATION_ERR_DATE_FORMAT'
,p_message_text=>'Value is not valid date format.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(31492237727374134)
,p_name=>'BLOG_VALIDATION_ERR_EMAIL'
,p_message_text=>'Not valid email address.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(27348168323345190)
,p_name=>'BLOG_VALIDATION_ERR_INTEGER'
,p_message_text=>'The value must be an integer between %0 and %1.'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
begin
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(27348379677347133)
,p_name=>'BLOG_VALIDATION_ERR_URL'
,p_message_text=>'URL must begin with http(s)://.'
,p_version_scn=>1
);
null;
wwv_flow_imp.component_end;
end;
/
