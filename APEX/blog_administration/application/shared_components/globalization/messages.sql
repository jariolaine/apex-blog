prompt --application/shared_components/globalization/messages
begin
--   Manifest
--     MESSAGES: 402
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114713972251085912)
,p_name=>'BLOG_AI_GENERATE_MESSAGE'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Consider the following blog post: """',
'%0',
'"""'))
,p_version_scn=>41488269480870
,p_updated_on=>wwv_flow_imp.dz('20241208084326Z')
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114714175154071839)
,p_name=>'BLOG_AI_GENERATE_PROMPT'
,p_message_text=>'Please generate'
,p_version_scn=>41472737989694
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114759969887623339)
,p_name=>'BLOG_AI_SYSTEM_PROMPT_POST_ASSISTANT'
,p_message_text=>'You are an advanced AI assistant specializing in writing engaging, informative, and well-structured blog posts tailored to a specific audience. Your goal is to produce content that is easy to read, factually accurate, and optimized for search engines'
||' (SEO). Use a tone that aligns with the intended audience, whether professional, casual, or conversational. Typically aim for 800-1500 words unless a specific length is requested. Generate only blog post content. Do not include title or description f'
||'or post as those are generated separately.'
,p_version_scn=>41487403313950
,p_updated_on=>wwv_flow_imp.dz('20241128172206Z')
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114729050811462675)
,p_name=>'BLOG_AI_SYSTEM_PROMPT_POST_CATEGORY'
,p_message_text=>'Generate a blog post category that is appropriate for SEO, ensuring it aligns with commonly searched phrases and terms relevant to the provided topic. The category should be concise, descriptive, and structured to improve content discoverability. It '
||'should capture the main theme or purpose of the blog while resonating with user search behavior and keyword trends. Please keep it down 2 words. Use only same language as blog post. Category should be plain text. Do not use any other kind formatting.'
||' Do not respond anything other than the generated category.'
,p_version_scn=>41492169726229
,p_updated_on=>wwv_flow_imp.dz('20250119040219Z')
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114737699878309742)
,p_name=>'BLOG_AI_SYSTEM_PROMPT_POST_DESCRIPTION'
,p_message_text=>'Generate a compelling and concise blog post summary based on the provided content topic or details. The summary should be 1-2 sentences long, summarize the main points of the blog post, and engage readers by highlighting the value or benefits of read'
||'ing the post. Use clear and engaging language, incorporating relevant keywords to optimize for SEO and attract the target audience. Use only same language as blog post. The response must be plain text only, without any enclosures such as quotation ma'
||'rks, brackets, or other symbols. Do not use any other kind formatting. Do not respond anything other than the generated summary.'
,p_version_scn=>41492171445566
,p_updated_on=>wwv_flow_imp.dz('20250119042443Z')
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114713268320200448)
,p_name=>'BLOG_AI_SYSTEM_PROMPT_POST_TAGS'
,p_message_text=>'Generate a list of relevant, SEO-friendly tags for a blog post based on the provided content details or keywords. Tags should be short (1-2 words), directly related to the topic, and optimized for discoverability. Include a mix of specific and genera'
||'l terms to help categorize the post effectively and improve its visibility on search engines and within the website''s taxonomy. Please keep it down to 6 tags. Use only same language as blog post.Tags should be plain text and separated by comma charac'
||'ter. Do not use any other kind formatting. Make the tags lowercase and sorted alphabetically. Do not respond anything other than the generated tags.'
,p_version_scn=>41492169759678
,p_updated_on=>wwv_flow_imp.dz('20250119040251Z')
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(115273145443553656)
,p_name=>'BLOG_AI_SYSTEM_PROMPT_POST_TITLE'
,p_message_text=>'Generate a creative, engaging, and SEO-friendly blog post title based on the provided description, topic, or keywords. The title should be concise (preferably under 60 characters), appealing to the target audience, and accurately reflect the content'''
||'s tone and purpose. Ensure the title is attention-grabbing and optimized for search engines, while avoiding clickbait. If specific keywords or themes are mentioned, incorporate them naturally into the title. Use only same language as blog post. The r'
||'esponse must be plain text only, without any enclosures such as quotation marks, brackets, or other symbols. Do not use any other kind formatting. Do not respond anything other than the generated title.'
,p_version_scn=>41492171423204
,p_updated_on=>wwv_flow_imp.dz('20250119042418Z')
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(96828359556875329)
,p_name=>'BLOG_BTN_TITLE_AI_ASSISTANT'
,p_message_text=>'Chat with AI assistant'
,p_version_scn=>41492187023739
,p_created_on=>wwv_flow_imp.dz('20250119075357Z')
,p_updated_on=>wwv_flow_imp.dz('20250119075503Z')
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(115281400076268370)
,p_name=>'BLOG_BTN_TITLE_GEN_AI_POST_CATEGORY'
,p_message_text=>'Generate Category Using AI'
,p_version_scn=>41472799375206
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(115278929881341737)
,p_name=>'BLOG_BTN_TITLE_GEN_AI_POST_DESCRIPTION'
,p_message_text=>'Generate Summary Using AI'
,p_version_scn=>41487541679930
,p_updated_on=>wwv_flow_imp.dz('20241130065753Z')
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(115281560485265815)
,p_name=>'BLOG_BTN_TITLE_GEN_AI_POST_TAGS'
,p_message_text=>'Generate Tags Using AI'
,p_version_scn=>41472799400227
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(115278522185355671)
,p_name=>'BLOG_BTN_TITLE_GEN_AI_POST_TITLE'
,p_message_text=>'Generate Title Using AI'
,p_version_scn=>41472798130596
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(116081148577353530)
,p_name=>'BLOG_BTN_TITLE_RECORD'
,p_message_text=>'Speech to Post'
,p_version_scn=>41472951061894
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(92484739411764576)
,p_name=>'BLOG_CATEGORIES_UK1'
,p_message_text=>'Category with same name already exists.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(93944011766718785)
,p_name=>'BLOG_COMMENTS_FK1'
,p_message_text=>'There are comments in this post. Please delete the comments first.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(93943095384687447)
,p_name=>'BLOG_COMMENTS_FK2'
,p_message_text=>'This comment has been replied. Please delete the reply first.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(95876829728325290)
,p_name=>'BLOG_CONFIRM_DELETE_UNUSED_CATEGORIES'
,p_message_text=>'All categories without posts will be deleted. Would you like to perform this delete action?'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(95877205692331004)
,p_name=>'BLOG_CONFIRM_DELETE_UNUSED_TAGS'
,p_message_text=>'All tags not used in posts will be deleted. Would you like to perform this delete action?'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(105397617518849113)
,p_name=>'BLOG_CONFIRM_FILE_OVERWRITE'
,p_message_text=>'Following file(s) already exists. Please confirm file overwrite.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101770876542333759)
,p_name=>'BLOG_CONFIRM_LINK_GROUP_DELETE'
,p_message_text=>'You have requested the permanent deletion of links collection. Following link(s) will be also deleted.'
,p_version_scn=>41109091843403
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(118523239010257448)
,p_name=>'BLOG_CONFIRM_RESEQUENCE_CATEGORIES'
,p_message_text=>'Resequence categories, incrementing sequence numbers by 10?'
,p_version_scn=>41102141851437
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137139677758326600)
,p_name=>'BLOG_CONFIRM_RESEQUENCE_DYNAMIC_CONTENT'
,p_message_text=>'Resequence popup pages entries, incrementing sequence numbers by 10?'
,p_version_scn=>41109631736639
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(118523882469263325)
,p_name=>'BLOG_CONFIRM_RESEQUENCE_LINKS'
,p_message_text=>'Resequence link entries, incrementing sequence numbers by 10?'
,p_version_scn=>41102142240904
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(118523644472261610)
,p_name=>'BLOG_CONFIRM_RESEQUENCE_LINK_GROUPS'
,p_message_text=>'Resequence group entries, incrementing sequence numbers by 10?'
,p_version_scn=>41102141954013
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(118523427925259561)
,p_name=>'BLOG_CONFIRM_RESEQUENCE_TAGS'
,p_message_text=>'Resequence tags, incrementing sequence numbers by 10?'
,p_version_scn=>41102141901778
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112558490085784414)
,p_name=>'BLOG_FEATURE_ABOUT'
,p_message_text=>'About'
,p_version_scn=>41109163194294
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(89519365154461908)
,p_name=>'BLOG_FEATURE_ALLOW_COMMENTS'
,p_message_text=>'Commenting to posts'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(91115772405581654)
,p_name=>'BLOG_FEATURE_ARCHIVE'
,p_message_text=>'Archives list'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143198584329058077)
,p_name=>'BLOG_FEATURE_ARCHIVE_POST_COUNT'
,p_message_text=>'Archive post count'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(121575249067163697)
,p_name=>'BLOG_FEATURE_ATOM'
,p_message_text=>'Atom feed'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(91097643584180948)
,p_name=>'BLOG_FEATURE_CATEGORY'
,p_message_text=>'Categories list'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143494729804435340)
,p_name=>'BLOG_FEATURE_CATEGORY_POST_COUNT'
,p_message_text=>'Category post count'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(113967025001696688)
,p_name=>'BLOG_FEATURE_COMMENT_VERIFY'
,p_message_text=>'Comment verify question'
,p_version_scn=>41472703509738
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(107078043696803703)
,p_name=>'BLOG_FEATURE_FILES'
,p_message_text=>'Files'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(110734071028159993)
,p_name=>'BLOG_FEATURE_GROUP_COMMENTS'
,p_message_text=>'Comments'
,p_version_scn=>41109165078645
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(125066017923890294)
,p_name=>'BLOG_FEATURE_GROUP_MISC'
,p_message_text=>'Miscellaneous'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(110821649858363794)
,p_name=>'BLOG_FEATURE_GROUP_PAGE'
,p_message_text=>'Pages'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(117319878262419938)
,p_name=>'BLOG_FEATURE_GROUP_POST'
,p_message_text=>'Post Page'
,p_version_scn=>41473037804326
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(110734507161125479)
,p_name=>'BLOG_FEATURE_GROUP_RIGHT_COLUMN'
,p_message_text=>'Right column'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(91120597575775810)
,p_name=>'BLOG_FEATURE_LATEST_POSTS'
,p_message_text=>'Latest posts list'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(89368177505152220)
,p_name=>'BLOG_FEATURE_LINKS'
,p_message_text=>'Links'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(125065766226883396)
,p_name=>'BLOG_FEATURE_MODAL_PAGES'
,p_message_text=>'Modal pages links in blog footer'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(110729288318259981)
,p_name=>'BLOG_FEATURE_MODERATE_COMMENTS'
,p_message_text=>'Comment must be approved'
,p_version_scn=>42197090890002
,p_updated_on=>wwv_flow_imp.dz('20250409135642Z')
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(123417219226626152)
,p_name=>'BLOG_FEATURE_MODERATE_COMMENTS_AI'
,p_message_text=>'AI approve comments'
,p_version_scn=>42197091039764
,p_created_on=>wwv_flow_imp.dz('20250409135903Z')
,p_updated_on=>wwv_flow_imp.dz('20250409135931Z')
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(110369347594885860)
,p_name=>'BLOG_FEATURE_POST_PAGINATION'
,p_message_text=>'Links to newer and older post'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(91097899348183983)
,p_name=>'BLOG_FEATURE_RSS'
,p_message_text=>'RSS feed link'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(121194469978833838)
,p_name=>'BLOG_FEATURE_SEARCH'
,p_message_text=>'Search'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(91633498342694056)
,p_name=>'BLOG_FEATURE_SEARCH_COMMENTS'
,p_message_text=>'Search from comments'
,p_version_scn=>39901457350025
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(108133222672152480)
,p_name=>'BLOG_FEATURE_SEARCH_FILES'
,p_message_text=>'Search from files'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(108133508853154926)
,p_name=>'BLOG_FEATURE_SEARCH_LINKS'
,p_message_text=>'Search from links'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(91112278537554665)
,p_name=>'BLOG_FEATURE_SEARCH_POSTS'
,p_message_text=>'Search from posts'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(109169989709712078)
,p_name=>'BLOG_FEATURE_SITEMAP'
,p_message_text=>'Generate sitemap'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(116151003040198976)
,p_name=>'BLOG_FEATURE_SUBSCRIBE_COMMENTS'
,p_message_text=>'Email notification of new comments for users'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(95705855846533677)
,p_name=>'BLOG_FEATURE_TAG_CLOUD'
,p_message_text=>'Tag Cloud'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(95706263452540944)
,p_name=>'BLOG_FEATURE_TAG_CLOUD_POST_COUNT'
,p_message_text=>'Tag post count'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(124490502720846612)
,p_name=>'BLOG_FILES_CK4'
,p_message_text=>'The shared file must have a description.'
,p_version_scn=>41472003899725
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114349506641725526)
,p_name=>'BLOG_FILES_UK1'
,p_message_text=>'File with same name already exists.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(116754696805104854)
,p_name=>'BLOG_GENERIC_ERROR'
,p_message_text=>'Ooops... We are sorry! Unexpected internal error have occurred.'
,p_is_js_message=>true
,p_version_scn=>41375322891288
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(104398617777283580)
,p_name=>'BLOG_HELP_FEATURE_ABOUT'
,p_message_text=>'Enable or disable "About" page.'
,p_version_scn=>41473009433051
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(103926824895159433)
,p_name=>'BLOG_HELP_FEATURE_ALLOW_COMMENTS'
,p_message_text=>'Enable or disable commenting on blog posts.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(104414736955585542)
,p_name=>'BLOG_HELP_FEATURE_ARCHIVE'
,p_message_text=>'Enable or disable archives list.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(104414976680590689)
,p_name=>'BLOG_HELP_FEATURE_ARCHIVE_POST_COUNT'
,p_message_text=>'Enable or disable post count in the archive list.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(121575633666174589)
,p_name=>'BLOG_HELP_FEATURE_ATOM'
,p_message_text=>'Enable or disable atom feed.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(104414392084577078)
,p_name=>'BLOG_HELP_FEATURE_CATEGORY'
,p_message_text=>'Enable or disable categories link list.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(104414612937580874)
,p_name=>'BLOG_HELP_FEATURE_CATEGORY_POST_COUNT'
,p_message_text=>'Enable or disable post count in the category list.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(113967265073693915)
,p_name=>'BLOG_HELP_FEATURE_COMMENT_VERIFY'
,p_message_text=>'Enable or disable comment verify question. Enabling this feature may prevent some spam bots entering comments. '
,p_version_scn=>41472703682667
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(103945286457142617)
,p_name=>'BLOG_HELP_FEATURE_FILES'
,p_message_text=>'Enable or disable the "Files" page. If it is disabled, file search is also disabled.'
,p_version_scn=>41473009357388
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(103927760795206298)
,p_name=>'BLOG_HELP_FEATURE_LATEST_POSTS'
,p_message_text=>'Enable or disable the latest blog posts list.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(103945036896139491)
,p_name=>'BLOG_HELP_FEATURE_LINKS'
,p_message_text=>'Enable or disable the "Links" page. If it is disabled, link search is also disabled.'
,p_version_scn=>41473009380186
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(103928091302218085)
,p_name=>'BLOG_HELP_FEATURE_MODAL_PAGES'
,p_message_text=>'Enable or disable popup pages links in blog footer.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(103927047235167990)
,p_name=>'BLOG_HELP_FEATURE_MODERATE_COMMENTS'
,p_message_text=>'Enable or disable comments approval before they are published.'
,p_version_scn=>42197090906029
,p_updated_on=>wwv_flow_imp.dz('20250409135700Z')
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(123419821720744097)
,p_name=>'BLOG_HELP_FEATURE_MODERATE_COMMENTS_AI'
,p_message_text=>'Enable or disable AI-powered moderation to automatically approve comments.'
,p_version_scn=>42197092462622
,p_created_on=>wwv_flow_imp.dz('20250409141842Z')
,p_updated_on=>wwv_flow_imp.dz('20250409141842Z')
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(103927546079201471)
,p_name=>'BLOG_HELP_FEATURE_POST_PAGINATION'
,p_message_text=>'Enable or disable links to previous and / or newer posts.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(104415302113599563)
,p_name=>'BLOG_HELP_FEATURE_RSS'
,p_message_text=>'Enable or disable link to the RSS feed.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(121197668449045597)
,p_name=>'BLOG_HELP_FEATURE_SEARCH'
,p_message_text=>'Enable or disable "Search" page.'
,p_version_scn=>41473009390327
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(91633878272707436)
,p_name=>'BLOG_HELP_FEATURE_SEARCH_COMMENTS'
,p_message_text=>'Enable or disable comment search.'
,p_version_scn=>39901457471463
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(103946289000173955)
,p_name=>'BLOG_HELP_FEATURE_SEARCH_FILES'
,p_message_text=>'Enable or disable file search. Search is available if the "Files" page is also enabled.'
,p_version_scn=>41473009404141
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(103945439159148147)
,p_name=>'BLOG_HELP_FEATURE_SEARCH_LINKS'
,p_message_text=>'Enable or disable link search. Search is available if the "Link" page is also enabled.'
,p_version_scn=>41473009416282
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(104414187869570945)
,p_name=>'BLOG_HELP_FEATURE_SEARCH_POSTS'
,p_message_text=>'Enable or disable post search.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(103928268636225909)
,p_name=>'BLOG_HELP_FEATURE_SITEMAP'
,p_message_text=>'Enable or disable generating sitemap index and sitemaps for public pages. See sitemap URL from this application home page.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(103927391710192562)
,p_name=>'BLOG_HELP_FEATURE_SUBSCRIBE_COMMENTS'
,p_message_text=>'When commenting on a blog post, users can enter their email address and receive an email notification when their comment is answered. The application email address must also be filled in the application settings to send the email.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(95709392679592081)
,p_name=>'BLOG_HELP_FEATURE_TAG_CLOUD'
,p_message_text=>'Enable or disable tag cloud.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(95706053016537430)
,p_name=>'BLOG_HELP_FEATURE_TAG_CLOUD_POST_COUNT'
,p_message_text=>'Enable or disable post count in the tag cloud'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147781214586213966)
,p_name=>'BLOG_HELP_G_APP_EMAIL'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Email address from which notifications will be sent, for example',
'notification of new comments. If blank, no notifications will be sent.'))
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147838242355430869)
,p_name=>'BLOG_HELP_G_CANONICAL_HOST'
,p_message_text=>'Protocol and host used for pages header link rel="canonical", RSS feed and sitemap. Example https://example.com. If empty, current URL protocol and host is used.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94479526054975974)
,p_name=>'BLOG_HELP_G_COMMENT_WATCH_MONTHS'
,p_message_text=>'How many months will a user receive an email notification of new replies after they last comment on a post. The value must be an integer between %0 and %1.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(102342054003091853)
,p_name=>'BLOG_HELP_G_LATEST_POST_ROWS'
,p_message_text=>'The number of post displayed on the latest post list. The value must be an integer between %0 and %1. Changes to this settings only take effect in new sessions of the public application.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94784405261491259)
,p_name=>'BLOG_HELP_G_MAX_AGE_DOWNLOAD'
,p_message_text=>'Cache-Control HTTP response header max-age for files that are available for download on the "Files" page of the public application. The maximum amount of time in seconds that fetched responses are allowed to be used again by clients. The value must b'
||'e an integer between %0 and %1.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94786083802569361)
,p_name=>'BLOG_HELP_G_MAX_AGE_FILE'
,p_message_text=>'Cache-Control HTTP response header max-age for files that are not downloadable on the "Files" page of the public application. The maximum amount of time in seconds that fetched responses are allowed to be used again by clients. The value must be an i'
||'nteger between %0 and %1.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94785665225561813)
,p_name=>'BLOG_HELP_G_MAX_AGE_RSS'
,p_message_text=>'RSS feed Cache-Control HTTP response header max-age. The maximum amount of time in seconds that fetched responses are allowed to be used again by clients. The value must be an integer between %0 and %1.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94785857309568470)
,p_name=>'BLOG_HELP_G_MAX_AGE_RSS_XSL'
,p_message_text=>'RSS feed XSL Cache-Control HTTP response header max-age. The maximum amount of time in seconds that fetched responses are allowed to be used again by clients. The value must be an integer between %0 and %1.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94786400228582137)
,p_name=>'BLOG_HELP_G_MAX_AGE_SITEMAP'
,p_message_text=>'Sitemap Cache-Control HTTP response header max-age. The maximum amount of time in seconds that fetched responses are allowed to be used again by clients. The value must be an integer between %0 and %1.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147815378955514439)
,p_name=>'BLOG_HELP_G_RSS_URL'
,p_message_text=>'Specify custom RSS feed URL. If empty, default public application RSS feed is used.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(102344615243291267)
,p_name=>'BLOG_HELP_G_RSS_XSL_URL'
,p_message_text=>'RSS feed custom XSL transformations (XSLT) URL for public application default RSS feed.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(102343336421274036)
,p_name=>'BLOG_HELP_P0_BLOG_APP_DATE_FORMAT'
,p_message_text=>'Public pages date format. Changes to this settings only take effect in new sessions of the public application.'
,p_version_scn=>41109922856403
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(102340205895038106)
,p_name=>'BLOG_HELP_P0_BLOG_APP_DESC'
,p_message_text=>'Description of this blog. Changes to this settings only take effect in new sessions of the public application.'
,p_version_scn=>41472050546460
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(102339866267030252)
,p_name=>'BLOG_HELP_P0_BLOG_APP_NAME'
,p_message_text=>'Name of this blog. Changes to this settings only take effect in new sessions of the public application.'
,p_version_scn=>41472050562693
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(102343566483278693)
,p_name=>'BLOG_HELP_P0_BLOG_POST_DATE_FORMAT'
,p_message_text=>'Date format for blog posts header. Changes to this settings only take effect in new sessions of the public application.'
,p_version_scn=>41109922877085
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(102342510411246964)
,p_name=>'BLOG_HELP_P0_BLOG_SEARCH_ROWS'
,p_message_text=>'The number of Search results per report page. The value must be an integer between %0 and %1. Changes to this settings only take effect in new sessions of the public application.'
,p_version_scn=>41109923047097
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(102340376329043325)
,p_name=>'BLOG_HELP_P1_BLOG_POST_ROWS'
,p_message_text=>'The number of posts per report page displayed on the home page. The value must be an integer between %0 and %1. Changes to this settings only take effect in new sessions of the public application.'
,p_version_scn=>41109923078771
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(102341211234073778)
,p_name=>'BLOG_HELP_P2_BLOG_COMMENT_ROWS'
,p_message_text=>'The number of comments per report page displayed on the post page. The value must be an integer between %0 and %1. Changes to this settings only take effect in new sessions of the public application.'
,p_version_scn=>41109923207454
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(105562237252297948)
,p_name=>'BLOG_LINK_GROUPS_UK1'
,p_message_text=>'Label with same name already exists.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94252298493427343)
,p_name=>'BLOG_LOV_COMMENT_FLAG_NEW'
,p_message_text=>'New'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94253094124427352)
,p_name=>'BLOG_LOV_COMMENT_FLAG_READ'
,p_message_text=>'Read'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94252748101427352)
,p_name=>'BLOG_LOV_COMMENT_FLAG_REPLY'
,p_message_text=>'Reply'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94252459493427352)
,p_name=>'BLOG_LOV_COMMENT_FLAG_UNREAD'
,p_message_text=>'Unread'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94253923702427353)
,p_name=>'BLOG_LOV_COMMENT_STATUS_MODERATE'
,p_message_text=>'Not Approved'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(120239603011407302)
,p_name=>'BLOG_LOV_LINK_STATUS_GROUP_DISABLED'
,p_message_text=>'Group is Disabled'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94256951874427357)
,p_name=>'BLOG_LOV_POST_STATUS_BLOGGER_DISABLED'
,p_message_text=>'Blogger is Disabled'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94256698890427356)
,p_name=>'BLOG_LOV_POST_STATUS_CATEGORY_DISABLED'
,p_message_text=>'Category is Disabled'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94256397133427356)
,p_name=>'BLOG_LOV_POST_STATUS_DRAFT'
,p_message_text=>'Draft'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94255752859427355)
,p_name=>'BLOG_LOV_POST_STATUS_PUBLISHED'
,p_message_text=>'Published'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94256057548427356)
,p_name=>'BLOG_LOV_POST_STATUS_SCHEDULED'
,p_message_text=>'Scheduled'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94257265677427357)
,p_name=>'BLOG_LOV_YES_NO_NO'
,p_message_text=>'No'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94257556233427357)
,p_name=>'BLOG_LOV_YES_NO_YES'
,p_message_text=>'Yes'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(116082546348300193)
,p_name=>'BLOG_MSG_AI_ASSISTANT_WELCOME'
,p_message_text=>'Hello. How can I help you?'
,p_version_scn=>41492175695932
,p_updated_on=>wwv_flow_imp.dz('20250119052726Z')
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(96779563275994327)
,p_name=>'BLOG_MSG_AI_NO_POST_FOR_CONTEXT'
,p_message_text=>'AI cannot generate text without context. Please create and provide a blog post as context before proceeding.'
,p_is_js_message=>true
,p_version_scn=>41492175676132
,p_created_on=>wwv_flow_imp.dz('20250119052707Z')
,p_updated_on=>wwv_flow_imp.dz('20250119052707Z')
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(97836253034375514)
,p_name=>'BLOG_MSG_APEX_AUTH_INFO'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>You can enable or disable APEX authentication for this administrative service.</p>',
''))
,p_version_scn=>41492324432992
,p_created_on=>wwv_flow_imp.dz('20250120155039Z')
,p_updated_on=>wwv_flow_imp.dz('20250120155039Z')
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(123083450099389011)
,p_name=>'BLOG_MSG_BASIC_SETTINGS_INFO'
,p_message_text=>'Changes to some settings only take effect in new sessions of the public application. See settings help for details.'
,p_version_scn=>41376315341026
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(119933331184625049)
,p_name=>'BLOG_MSG_CATEGORIES_RESEQUENCED'
,p_message_text=>'Categories resequenced.'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(119928258256544379)
,p_name=>'BLOG_MSG_CATEGORIES_UNUSED_DELETED'
,p_message_text=>'Unused categories deleted.'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(137140097047334243)
,p_name=>'BLOG_MSG_DYNAMIC_CONTENT_RESEQUENCED'
,p_message_text=>'Popup pages resequenced.'
,p_is_js_message=>true
,p_version_scn=>41109631952573
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(105681450650302803)
,p_name=>'BLOG_MSG_FILE_SYNC_INFO'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Select the file synchronization action.',
'If the file exists, you will be prompted to confirm the overwrite.</p>',
'<p>',
'Note that files in the <strong>disabled</strong> status are not copied from the local file repository to the object storage.',
'</p>'))
,p_version_scn=>41472007471879
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(117547023012538519)
,p_name=>'BLOG_MSG_GENERATIVE_AI_INFO'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>To use generative AI, the system administrator must configure <i>Blog Open AI</i> <strong>Generative AI Service</strong>.</p>',
'<p>When Generative AI is enabled, it enables generate for post e.g. title, description, category and tags.</p>',
'<p><strong>NOTE:</strong> Existing credential information is not displayed. To update the credential, provide a value for API key.</p>'))
,p_version_scn=>41492472284501
,p_updated_on=>wwv_flow_imp.dz('20250122021329Z')
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(97799466120992477)
,p_name=>'BLOG_MSG_GOOGLE_AUTH_INFO'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>You can enable or disable Google authentication for this administrative service.</p>',
'<p><strong>NOTE:</strong> Existing credential information is not displayed. To update the credential, provide a value for both Client ID and Client Secret.</p>'))
,p_version_scn=>41492324701198
,p_created_on=>wwv_flow_imp.dz('20250120144648Z')
,p_updated_on=>wwv_flow_imp.dz('20250120155432Z')
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114671136958398625)
,p_name=>'BLOG_MSG_LANGUAGE_AI_INFO'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>To use language AI, the system administrator must configure <i>Blog Language AI</i> <strong>remote server</strong> endpoint URL.</p>',
'<p>When language AI is enabled, the sentiment of all new comments is analyzed. You can see the analysis result when opening a comment.</p>'))
,p_version_scn=>41492475102959
,p_updated_on=>wwv_flow_imp.dz('20250122025658Z')
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(135528583746186927)
,p_name=>'BLOG_MSG_LINKS_RESEQUENCED'
,p_message_text=>'Links resequenced.'
,p_is_js_message=>true
,p_version_scn=>41109174558245
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(135528866345192047)
,p_name=>'BLOG_MSG_LINK_GROUPS_RESEQUENCED'
,p_message_text=>'Link groups resequenced.'
,p_is_js_message=>true
,p_version_scn=>41109174668736
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(107560459572642215)
,p_name=>'BLOG_MSG_NO_DATA_FOUND'
,p_message_text=>'No records found.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(111293808854717846)
,p_name=>'BLOG_MSG_OBJECT_STORAGE_INFO'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>To use object storage, the system administrator must configure <i>Blog Object Storage</i> <strong>remote server</strong> endpoint URL.</p>',
'<p>Once object storage is enabled, go to <strong>Synchronize Files</strong> and sync files between local file repository and object storage.</p>',
'<p>When object storage is enabled, new files are no longer saved to the local file repository. You can use synchronization to retrieve files from object storage to the local file repository.</p>'))
,p_version_scn=>41492475116731
,p_updated_on=>wwv_flow_imp.dz('20250122025710Z')
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(98654830965007071)
,p_name=>'BLOG_MSG_OCI_API_KEY_INFO'
,p_message_text=>'<p><strong>NOTE:</strong> Existing credential information is not displayed. To update the credential, provide a value for all fields.</p>'
,p_version_scn=>41492475122142
,p_created_on=>wwv_flow_imp.dz('20250122025554Z')
,p_updated_on=>wwv_flow_imp.dz('20250122025716Z')
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101201752243216937)
,p_name=>'BLOG_MSG_SELECTED_FILES_DELETED'
,p_message_text=>'File(s) deleted.'
,p_is_js_message=>true
,p_version_scn=>41375259667492
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(119934561876639137)
,p_name=>'BLOG_MSG_TAGS_RESEQUENCED'
,p_message_text=>'Tags resequenced.'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(119928098066542175)
,p_name=>'BLOG_MSG_TAGS_UNUSED_DELETED'
,p_message_text=>'Unused tags deleted.'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(89449006494941097)
,p_name=>'BLOG_POSTS_FK2'
,p_message_text=>'Posts found from this category. Move posts to other category and then delete category.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(114422188159484323)
,p_name=>'BLOG_POSTS_UK1'
,p_message_text=>'Post with same published on date and time already exists.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(120573117563001979)
,p_name=>'BLOG_POST_TAGS_UK1'
,p_message_text=>'Post have duplicate tags.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(121575077102157955)
,p_name=>'BLOG_PUB_APP_LINK_ATOM'
,p_message_text=>'Atom feed'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(125130944750533188)
,p_name=>'BLOG_PUB_APP_LINK_HOME'
,p_message_text=>'Home page canonical URL'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(125133338236603754)
,p_name=>'BLOG_PUB_APP_LINK_RSS'
,p_message_text=>'RSS feed'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(125131198027535378)
,p_name=>'BLOG_PUB_APP_LINK_SITEMAP'
,p_message_text=>'Sitemap'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94450921648717232)
,p_name=>'BLOG_SETTING_GROUP_COMMENTS'
,p_message_text=>'Comments'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94782567816401205)
,p_name=>'BLOG_SETTING_GROUP_FILE_REPO'
,p_message_text=>'File Repository'
,p_version_scn=>41375084538508
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(110768573532304219)
,p_name=>'BLOG_SETTING_GROUP_GENERAL'
,p_message_text=>'General'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(110768786490302856)
,p_name=>'BLOG_SETTING_GROUP_REPORTS'
,p_message_text=>'Reports'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(100270340491055682)
,p_name=>'BLOG_SETTING_GROUP_RSS'
,p_message_text=>'RSS & Atom'
,p_version_scn=>41375112066655
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(110739953693989184)
,p_name=>'BLOG_SETTING_GROUP_SEO'
,p_message_text=>'URL'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(100270672535050833)
,p_name=>'BLOG_SETTING_GROUP_SITEMAP'
,p_message_text=>'Sitemap'
,p_version_scn=>41375112081234
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(110740165152987836)
,p_name=>'BLOG_SETTING_GROUP_UI'
,p_message_text=>'Appearance'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(113937641274258425)
,p_name=>'BLOG_SETTING_G_APP_EMAIL'
,p_message_text=>'Blog email address'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101505093111084581)
,p_name=>'BLOG_SETTING_G_CANONICAL_HOST'
,p_message_text=>'Canonical protocol and host for URLs'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94451082703726046)
,p_name=>'BLOG_SETTING_G_COMMENT_WATCH_MONTHS'
,p_message_text=>'Month(s) user email notification subscription is valid'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(123068169273679993)
,p_name=>'BLOG_SETTING_G_LATEST_POST_ROWS'
,p_message_text=>'Number of latest posts'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94783010069411102)
,p_name=>'BLOG_SETTING_G_MAX_AGE_DOWNLOAD'
,p_message_text=>'Downloads cache max age'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94783169712412676)
,p_name=>'BLOG_SETTING_G_MAX_AGE_FILE'
,p_message_text=>'Inline files cache max age'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94782749555406650)
,p_name=>'BLOG_SETTING_G_MAX_AGE_RSS'
,p_message_text=>'RSS and atom feed cache max age'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94784076005449275)
,p_name=>'BLOG_SETTING_G_MAX_AGE_RSS_XSL'
,p_message_text=>'RSS feed XSL cache max age'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(94783360873414119)
,p_name=>'BLOG_SETTING_G_MAX_AGE_SITEMAP'
,p_message_text=>'Sitemaps cache max age'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101505280903086719)
,p_name=>'BLOG_SETTING_G_RSS_URL'
,p_message_text=>'Custom RSS feed URL'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(123634868014601371)
,p_name=>'BLOG_SETTING_G_RSS_XSL_URL'
,p_message_text=>'RSS feed custom XSL'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101480844434735367)
,p_name=>'BLOG_SETTING_P0_BLOG_APP_DATE_FORMAT'
,p_message_text=>'Date format'
,p_version_scn=>41109922925114
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101479799295715027)
,p_name=>'BLOG_SETTING_P0_BLOG_APP_DESC'
,p_message_text=>'Blog description'
,p_version_scn=>41471114169542
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101480342849723773)
,p_name=>'BLOG_SETTING_P0_BLOG_APP_NAME'
,p_message_text=>'Blog name'
,p_version_scn=>41471114140089
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101478925329697329)
,p_name=>'BLOG_SETTING_P0_BLOG_POST_DATE_FORMAT'
,p_message_text=>'Posts header date format'
,p_version_scn=>41109922890008
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101479935631719514)
,p_name=>'BLOG_SETTING_P0_BLOG_SEARCH_ROWS'
,p_message_text=>'Number of search results'
,p_version_scn=>41109923035836
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101480219256722319)
,p_name=>'BLOG_SETTING_P1_BLOG_POST_ROWS'
,p_message_text=>'Number of post on home page'
,p_version_scn=>41109923089414
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101480577515730351)
,p_name=>'BLOG_SETTING_P2_BLOG_COMMENT_ROWS'
,p_message_text=>'Number of comments'
,p_version_scn=>41109923199313
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(92484514064544667)
,p_name=>'BLOG_TAGS_UK1'
,p_message_text=>'Tag with same name already exists.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(113529139887852845)
,p_name=>'BLOG_TXT_COMMENT_FLAG'
,p_message_text=>'Type'
,p_version_scn=>41472587796764
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(113685238974984908)
,p_name=>'BLOG_TXT_COPY_TO_CLIPBOARD'
,p_message_text=>'Copy URL to Clipboard'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(120238725118398195)
,p_name=>'BLOG_TXT_DISABLED'
,p_message_text=>'Disabled'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(102870561392857543)
,p_name=>'BLOG_TXT_DOWNLOAD'
,p_message_text=>'Download'
,p_is_js_message=>true
,p_version_scn=>41375616078672
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(113706953130704446)
,p_name=>'BLOG_TXT_EDIT'
,p_message_text=>'Edit'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(120238994195399465)
,p_name=>'BLOG_TXT_ENABLED'
,p_message_text=>'Enabled'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(147777038427059335)
,p_name=>'BLOG_TXT_HELP'
,p_message_text=>'Help'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(120772666932633316)
,p_name=>'BLOG_TXT_OPEN_COMMENT'
,p_message_text=>'Open Comment'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(99169273840800234)
,p_name=>'BLOG_TXT_OPEN_NEW_TAB'
,p_message_text=>'Open in a new tab'
,p_is_js_message=>true
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101142093360071537)
,p_name=>'BLOG_TXT_SELECT_ROW'
,p_message_text=>'Select Row'
,p_version_scn=>41375229940008
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(113529530028843829)
,p_name=>'BLOG_TXT_SENTIMENT'
,p_message_text=>'Sentiment'
,p_version_scn=>41472587914961
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(95857867630354949)
,p_name=>'BLOG_TXT_SEQUENCE'
,p_message_text=>'Sequence'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(120365481823828179)
,p_name=>'BLOG_TXT_STATUS'
,p_message_text=>'Status'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(108802833937579351)
,p_name=>'BLOG_TXT_VIEW_POSTS'
,p_message_text=>'View Posts'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(109794706572181738)
,p_name=>'BLOG_VALIDATION_ERR_DATE_FORMAT'
,p_message_text=>'Value is not valid date format.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(113938360369206225)
,p_name=>'BLOG_VALIDATION_ERR_EMAIL'
,p_message_text=>'Not valid email address.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(109794290965177281)
,p_name=>'BLOG_VALIDATION_ERR_INTEGER'
,p_message_text=>'The value must be an integer between %0 and %1.'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(109794502319179224)
,p_name=>'BLOG_VALIDATION_ERR_URL'
,p_message_text=>'URL must begin with http(s)://.'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
