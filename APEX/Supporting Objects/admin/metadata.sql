--------------------------------------------------------
--  Inserting into BLOG_ORDS_TEMPLATES
--------------------------------------------------------
insert into blog_ords_templates (is_active,display_seq,template_group,uri_template,etag_type,http_method,source_type,build_option,notes,etag_query,handler_source) values ('1','10','RSS','feed/rss','NONE','GET','plsql/block','BLOG_FEATURE_RSS','Blog rss feed',null,
'begin' || chr(10) ||
'  blog_xml.rss(:p_lang);' || chr(10) ||
'end;'
);
insert into blog_ords_templates (is_active,display_seq,template_group,uri_template,etag_type,http_method,source_type,build_option,notes,etag_query,handler_source) values ('1','20','SITEMAP_INDEX','sitemap/index','NONE','GET','plsql/block',null,'Blog sitemap index',null,
'begin' || chr(10) ||
'  blog_xml.sitemap_index;' || chr(10) ||
'end;'
);
insert into blog_ords_templates (is_active,display_seq,template_group,uri_template,etag_type,http_method,source_type,build_option,notes,etag_query,handler_source) values ('1','30','SITEMAP','sitemap/main','NONE','GET','plsql/block',null,'Blog main pages sitemap',null,
'begin' || chr(10) ||
'  blog_xml.sitemap_main;' || chr(10) ||
'end;'
);
insert into blog_ords_templates (is_active,display_seq,template_group,uri_template,etag_type,http_method,source_type,build_option,notes,etag_query,handler_source) values ('1','40','SITEMAP','sitemap/posts','NONE','GET','plsql/block',null,'Blog posts sitemap',null,
'begin' || chr(10) ||
'  blog_xml.sitemap_posts;' || chr(10) ||
'end;'
);
insert into blog_ords_templates (is_active,display_seq,template_group,uri_template,etag_type,http_method,source_type,build_option,notes,etag_query,handler_source) values ('1','50','SITEMAP','sitemap/categories','NONE','GET','plsql/block','BLOG_FEATURE_CATEGORY','Blog categories sitemap',null,
'begin' || chr(10) ||
'  blog_xml.sitemap_categories;' || chr(10) ||
'end;'
);
insert into blog_ords_templates (is_active,display_seq,template_group,uri_template,etag_type,http_method,source_type,build_option,notes,etag_query,handler_source) values ('1','60','SITEMAP','sitemap/archives','NONE','GET','plsql/block','BLOG_FEATURE_ARCHIVE','Blog archives sitemap',null,
'begin' || chr(10) ||
'  blog_xml.sitemap_archives;' || chr(10) ||
'end;'
);
insert into blog_ords_templates (is_active,display_seq,template_group,uri_template,etag_type,http_method,source_type,build_option,notes,etag_query,handler_source) values ('1','70','SITEMAP','sitemap/tags','NONE','GET','plsql/block',null,'Blog tags sitemap',null,
'begin' || chr(10) ||
'  blog_xml.sitemap_tags;' || chr(10) ||
'end;'
);
insert into blog_ords_templates (is_active,display_seq,template_group,uri_template,etag_type,http_method,source_type,build_option,notes,etag_query,handler_source) values ('1','80','FILES','share/:p_file_name','QUERY','GET','resource/lob',null,'Blog static files',
'select v1.row_version' || chr(10) ||
'from blog_v_files v1' || chr(10) ||
'where 1 = 1' || chr(10) ||
'  and v1.is_download = 0' || chr(10) ||
'  and v1.file_name = :p_file_name',
'select v1.mime_type' || chr(10) ||
'  ,v1.blob_content' || chr(10) ||
'from blog_v_files v1' || chr(10) ||
'where 1 = 1' || chr(10) ||
'  and v1.is_download = 0' || chr(10) ||
'  and v1.file_name = :p_file_name'
);

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
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,NOTES,POST_EXPRESSION) values ('1','10','BLOG_FEATURE_ALLOW_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS',null,null);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,NOTES,POST_EXPRESSION) values ('1','20','BLOG_FEATURE_MODERATE_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS',null,null);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,NOTES,POST_EXPRESSION) values ('1','30','BLOG_FEATURE_SUBSCRIBE_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS',null,null);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,NOTES,POST_EXPRESSION) values ('0','40','BLOG_FEATURE_POST_PAGINATION','BLOG_FEATURE_GROUP_POST',null,null);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,NOTES,POST_EXPRESSION) values ('1','50','BLOG_FEATURE_SEARCH_POSTS','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null,null);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,NOTES,POST_EXPRESSION) values ('1','60','BLOG_FEATURE_CATEGORY','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null,
'blog_ords.create_module(' || chr(10) ||
'  p_app_id => :G_PUB_APP_ID' || chr(10) ||
');'
);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,NOTES,POST_EXPRESSION) values ('1','70','BLOG_FEATURE_LATEST_POSTS','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null,null);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,NOTES,POST_EXPRESSION) values ('1','70','BLOG_FEATURE_ARCHIVE','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null,
'blog_ords.create_module(' || chr(10) ||
'  p_app_id => :G_PUB_APP_ID' || chr(10) ||
');'
);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,NOTES,POST_EXPRESSION) values ('1','90','BLOG_FEATURE_RSS','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null,
'blog_ords.create_module(' || chr(10) ||
'  p_app_id => :G_PUB_APP_ID' || chr(10) ||
');'
);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,NOTES,POST_EXPRESSION) values ('1','100','BLOG_FEATURE_LINKS','BLOG_FEATURE_GROUP_PAGE',null,null);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,NOTES,POST_EXPRESSION) values ('1','110','BLOG_FEATURE_FILES','BLOG_FEATURE_GROUP_PAGE',null,null);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,NOTES,POST_EXPRESSION) values ('1','120','BLOG_FEATURE_ABOUT','BLOG_FEATURE_GROUP_PAGE',null,null);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,NOTES,POST_EXPRESSION) values ('1','130','BLOG_FEATURE_SEARCH_LINKS','BLOG_FEATURE_GROUP_SEARCH',null,null);
Insert into BLOG_FEATURES (IS_ACTIVE,DISPLAY_SEQ,BUILD_OPTION_NAME,BUILD_OPTION_GROUP,NOTES,POST_EXPRESSION) values ('1','140','BLOG_FEATURE_SEARCH_FILES','BLOG_FEATURE_GROUP_SEARCH',null,null);

--------------------------------------------------------
--  Inserting into BLOG_SETTINGS
--------------------------------------------------------
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('10','0','APP_GROUP','STRING','INTERNAL','BLOG_040000',null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('40','0','COMMENT_WATCH_MONTHS','INTEGER','INTERNAL','1',null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('50','0','G_LATEST_POSTS','INTEGER','BLOG_PAR_GROUP_UI','5',null);
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

--------------------------------------------------------
--  Create text index preferences
--------------------------------------------------------
declare
  l_schema varchar2(256);
begin

  l_schema := sys_context( 'USERENV', 'CURRENT_SCHEMA' );

  ctx_ddl.create_preference(
     preference_name  => 'BLOG_POSTS_DS'
    ,object_name      => 'USER_DATASTORE'
  );

  ctx_ddl.set_attribute(
    preference_name   => 'BLOG_POSTS_DS'
    ,attribute_name   => 'PROCEDURE'
    ,attribute_value  => l_schema || '.BLOG_CTX.GENERATE_POST_DATASTORE'
  );

  ctx_ddl.set_attribute(
    preference_name   => 'BLOG_POSTS_DS'
    ,attribute_name   => 'OUTPUT_TYPE'
    ,attribute_value  => 'CLOB'
  );

  ctx_ddl.create_section_group(
    group_name        => 'BLOG_POSTS_SG'
    ,group_type       => 'XML_SECTION_GROUP'
  );

  ctx_ddl.add_field_section(
    group_name        => 'BLOG_POSTS_SG'
    ,section_name     => 'TITLE'
    ,tag              => 'POST_TITLE'
    ,visible          => true
  );

  ctx_ddl.add_field_section(
    group_name        => 'BLOG_POSTS_SG'
    ,section_name     => 'CATEGORY'
    ,tag              => 'POST_CATEGORY'
    ,visible          => true
  );

  ctx_ddl.add_field_section(
    group_name        => 'BLOG_POSTS_SG'
    ,section_name     => 'DESCRIPTION'
    ,tag              => 'POST_DESCRIPTION'
    ,visible          => true
  );

  ctx_ddl.add_field_section(
    group_name        => 'BLOG_POSTS_SG'
    ,section_name     => 'BODY'
    ,tag              => 'POST_BODY'
    ,visible          => true
  );

  ctx_ddl.add_field_section(
    group_name        => 'BLOG_POSTS_SG'
    ,section_name     => 'TAGS'
    ,tag              => 'POST_TAGS'
    ,visible          => true
  );

  ctx_ddl.add_sdata_section(
    group_name        => 'BLOG_POSTS_SG'
    ,section_name     => 'YEAR_MONTH'
    ,tag              => 'ARCHIVE_YEAR_MONTH'
    ,datatype         => 'NUMBER'
  );

  ctx_ddl.create_preference(
    preference_name   => 'BLOG_POSTS_LX'
    ,object_name      => 'BASIC_LEXER'
  );

  ctx_ddl.set_attribute(
    preference_name   => 'BLOG_POSTS_LX'
    ,attribute_name   => 'MIXED_CASE'
    ,attribute_value  => 'NO'
  );

  ctx_ddl.set_attribute(
    preference_name   => 'BLOG_POSTS_LX'
    ,attribute_name   => 'BASE_LETTER'
    ,attribute_value  => 'YES'
  );

  ctx_ddl.set_attribute(
    preference_name   => 'BLOG_POSTS_LX'
    ,attribute_name   => 'BASE_LETTER_TYPE'
    ,attribute_value  => 'GENERIC'
  );

end;
/

--------------------------------------------------------
--  Create text index
--------------------------------------------------------
create index blog_posts_ctx on blog_posts_uds (dummy)
indextype is ctxsys.context parameters (
  'section group  BLOG_POSTS_SG
   datastore      BLOG_POSTS_DS
   lexer          BLOG_POSTS_LX
   stoplist       ctxsys.empty_stoplist
   memory         500M
   sync           (on commit)'
);
