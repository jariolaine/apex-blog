--------------------------------------------------------
--  Inserting into BLOG_ORDS_TEMPLATES
--------------------------------------------------------
Insert into BLOG_ORDS_TEMPLATES (IS_ACTIVE,URI_TEMPLATE,HTTP_METHOD,SOURCE_TYPE,HANDLER_SOURCE,BUILD_OPTION,NOTES,TEMPLATE_GROUP) values ('1','feed/rss','GET','plsql/block','begin
  blog_xml.rss(:p_lang);
end;','BLOG_FEATURE_RSS','Blog rss feed','RSS');
Insert into BLOG_ORDS_TEMPLATES (IS_ACTIVE,URI_TEMPLATE,HTTP_METHOD,SOURCE_TYPE,HANDLER_SOURCE,BUILD_OPTION,NOTES,TEMPLATE_GROUP) values ('1','share/:p_file_name','GET','resource/lob','select v1.mime_type
  ,v1.blob_content
from blog_v_files v1
where 1 = 1
  and v1.is_download = 0
  and v1.file_name = :p_file_name',null,'Blog static files','FILES');
Insert into BLOG_ORDS_TEMPLATES (IS_ACTIVE,URI_TEMPLATE,HTTP_METHOD,SOURCE_TYPE,HANDLER_SOURCE,BUILD_OPTION,NOTES,TEMPLATE_GROUP) values ('1','sitemap/archives','GET','plsql/block','begin
  blog_xml.sitemap_archives;
end;','BLOG_FEATURE_ARCHIVE','Blog archives sitemap','SITEMAP');
Insert into BLOG_ORDS_TEMPLATES (IS_ACTIVE,URI_TEMPLATE,HTTP_METHOD,SOURCE_TYPE,HANDLER_SOURCE,BUILD_OPTION,NOTES,TEMPLATE_GROUP) values ('1','sitemap/categories','GET','plsql/block','begin
  blog_xml.sitemap_categories;
end;','BLOG_FEATURE_CATEGORY','Blog categories sitemap','SITEMAP');
Insert into BLOG_ORDS_TEMPLATES (IS_ACTIVE,URI_TEMPLATE,HTTP_METHOD,SOURCE_TYPE,HANDLER_SOURCE,BUILD_OPTION,NOTES,TEMPLATE_GROUP) values ('1','sitemap/index','GET','plsql/block','begin
  blog_xml.sitemap_index;
end;',null,'Blog sitemap index','SITEMAP');
Insert into BLOG_ORDS_TEMPLATES (IS_ACTIVE,URI_TEMPLATE,HTTP_METHOD,SOURCE_TYPE,HANDLER_SOURCE,BUILD_OPTION,NOTES,TEMPLATE_GROUP) values ('1','sitemap/main','GET','plsql/block','begin
  blog_xml.sitemap_main;
end;',null,'Blog main pages sitemap','SITEMAP');
Insert into BLOG_ORDS_TEMPLATES (IS_ACTIVE,URI_TEMPLATE,HTTP_METHOD,SOURCE_TYPE,HANDLER_SOURCE,BUILD_OPTION,NOTES,TEMPLATE_GROUP) values ('1','sitemap/posts','GET','plsql/block','begin
  blog_xml.sitemap_posts;
end;',null,'Blog posts sitemap','SITEMAP');
Insert into BLOG_ORDS_TEMPLATES (IS_ACTIVE,URI_TEMPLATE,HTTP_METHOD,SOURCE_TYPE,HANDLER_SOURCE,BUILD_OPTION,NOTES,TEMPLATE_GROUP) values ('1','sitemap/tags','GET','plsql/block','begin
  blog_xml.sitemap_tags;
end;',null,'Blog tags sitemap','SITEMAP');

--------------------------------------------------------
--  Inserting into BLOG_PAGES
--------------------------------------------------------
insert into blog_pages (is_active,display_seq,page_title,page_alias,build_option,page_type) values ('1','10','Home','HOME',null,'TAB');
insert into blog_pages (is_active,display_seq,page_title,page_alias,build_option,page_type) values ('1','20','Links','LINKS','BLOG_FEATURE_LINKS','TAB');
insert into blog_pages (is_active,display_seq,page_title,page_alias,build_option,page_type) values ('1','30','Files','REPOSITORY','BLOG_FEATURE_FILES','TAB');
insert into blog_pages (is_active,display_seq,page_title,page_alias,build_option,page_type) values ('1','40','About','ABOUT','BLOG_FEATURE_ABOUT','TAB');

--------------------------------------------------------
--  Inserting into BLOG_FEATURES
--------------------------------------------------------
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,POST_EXPRESSION,NOTES) values ('1','10','BLOG_FEATURE_ALLOW_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS',null,null);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,POST_EXPRESSION,NOTES) values ('1','20','BLOG_FEATURE_MODERATE_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS',null,null);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,POST_EXPRESSION,NOTES) values ('1','30','BLOG_FEATURE_SUBSCRIBE_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS',null,null);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,POST_EXPRESSION,NOTES) values ('0','40','BLOG_FEATURE_POST_PAGINATION','BLOG_FEATURE_GROUP_POST',null,null);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,POST_EXPRESSION,NOTES) values ('1','50','BLOG_FEATURE_SEARCH_POSTS','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null,null);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,POST_EXPRESSION,NOTES) values ('1','60','BLOG_FEATURE_CATEGORY','BLOG_FEATURE_GROUP_RIGHT_COLUMN','begin
  blog_ords.create_module(
    p_app_id => :G_PUB_APP_ID
  );
end;',null);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,POST_EXPRESSION,NOTES) values ('1','70','BLOG_FEATURE_LATEST_POSTS','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null,null);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,POST_EXPRESSION,NOTES) values ('1','70','BLOG_FEATURE_ARCHIVE','BLOG_FEATURE_GROUP_RIGHT_COLUMN','begin
  blog_ords.create_module(
    p_app_id => :G_PUB_APP_ID
  );
end;',null);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,POST_EXPRESSION,NOTES) values ('1','90','BLOG_FEATURE_RSS','BLOG_FEATURE_GROUP_RIGHT_COLUMN','begin
  blog_ords.create_module(
    p_app_id => :G_PUB_APP_ID
  );
end;',null);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,POST_EXPRESSION,NOTES) values ('1','100','BLOG_FEATURE_LINKS','BLOG_FEATURE_GROUP_PAGE',null,null);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,POST_EXPRESSION,NOTES) values ('1','110','BLOG_FEATURE_FILES','BLOG_FEATURE_GROUP_PAGE',null,null);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,POST_EXPRESSION,NOTES) values ('1','120','BLOG_FEATURE_ABOUT','BLOG_FEATURE_GROUP_PAGE',null,null);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,POST_EXPRESSION,NOTES) values ('1','130','BLOG_FEATURE_SEARCH_LINKS','BLOG_FEATURE_GROUP_SEARCH',null,null);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,POST_EXPRESSION,NOTES) values ('1','140','BLOG_FEATURE_SEARCH_FILES','BLOG_FEATURE_GROUP_SEARCH',null,null);

--------------------------------------------------------
--  Inserting into BLOG_SETTINGS
--------------------------------------------------------
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('10','0','APP_GROUP','STRING','INTERNAL','BLOG_040000',null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('140','0','G_DATE_FORMAT','DATE_FORMAT','BLOG_PAR_GROUP_UI','fmDD Mon YYYY',null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('150','0','G_POST_TITLE_DATE_FORMAT','DATE_FORMAT','BLOG_PAR_GROUP_UI','fmDay"," Month DD"," YYYY',null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('160','0','G_ARCHIVE_DATE_FORMAT','DATE_FORMAT','BLOG_PAR_GROUP_UI','fmMonth, YYYY',null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('160','0','P1_REPORT_ROWS','INTEGER','BLOG_PAR_GROUP_REPORTS','10',null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('170','0','P2_REPORT_ROWS','INTEGER','BLOG_PAR_GROUP_REPORTS','10',null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('180','0','G_SEARCH_ROWS','INTEGER','BLOG_PAR_GROUP_REPORTS','10',null);

-- Modify on export
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('20','0','G_PUB_APP_ID','STRING','INTERNAL',0,null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('30','0','G_ADMIN_APP_ID','STRING','INTERNAL',to_char(apex_application_install.get_application_id, 'fm99999999999999999999999999999999999999'),null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('100','0','G_APP_NAME','STRING','BLOG_PAR_GROUP_GENERAL','My Blog',null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('110','0','G_APP_DESC','STRING','BLOG_PAR_GROUP_GENERAL','About Almost Everything',null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('120','1','APP_EMAIL','EMAIL','BLOG_PAR_GROUP_GENERAL',null,null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('190','0','CANONICAL_URL','URL','BLOG_PAR_GROUP_SEO',apex_util.host_url( 'SCRIPT' ),'trim( rtrim( :ATTRIBUTE_VALUE, ''/'' ) ) || ''/''');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('200','1','RSS_URL','URL','BLOG_PAR_GROUP_SEO',null,null);

--------------------------------------------------------
--  Inserting into BLOG_INIT_ITEMS
--------------------------------------------------------
insert into blog_init_items(is_active, application_id, item_name)
select 1 as is_active
  ,ai.application_id  as application_id
  ,ai.item_name           as item_name
from apex_application_items ai
join blog_settings s
  on ai.item_name = s.attribute_name
where 1 = 1
and ai.application_id = apex_application_install.get_application_id
  union all
select 1 as is_active
  ,pi.application_id  as application_id
  ,pi.item_name           as item_namee
from apex_application_page_items pi
join blog_settings s
  on pi.item_name = s.attribute_name
where 1 = 1
and pi.application_id = apex_application_install.get_application_id
;

--------------------------------------------------------
--  Create ORDS module
--------------------------------------------------------
declare
  l_rss_url varchar2(32700);
begin

  -- Create ORDS module
  blog_ords.create_module(
    p_app_id => apex_application_install.get_application_id
  );

  -- get RSS feed URL
  l_rss_url := blog_ords.get_module_path( 'YES' ) || 'feed/rss';

  -- update RSS feed URL to settings
  update blog_settings
    set attribute_value = l_rss_url
    where 1 = 1
      and attribute_name = 'RSS_URL'
  ;

end;
/
