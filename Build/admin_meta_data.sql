--------------------------------------------------------
--  Inserting into BLOG_FEATURES
--------------------------------------------------------
insert into blog_features (build_option_name,build_option_group,is_active,display_seq,notes) values ('BLOG_FEATURE_ALLOW_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS','1','10',null);
insert into blog_features (build_option_name,build_option_group,is_active,display_seq,notes) values ('BLOG_FEATURE_MODERATE_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS','1','20',null);
insert into blog_features (build_option_name,build_option_group,is_active,display_seq,notes) values ('BLOG_FEATURE_POST_PAGINATION','BLOG_FEATURE_GROUP_POST','0','30',null);
insert into blog_features (build_option_name,build_option_group,is_active,display_seq,notes) values ('BLOG_FEATURE_SEARCH_POSTS','BLOG_FEATURE_GROUP_RIGHT_COLUMN','1','40',null);
insert into blog_features (build_option_name,build_option_group,is_active,display_seq,notes) values ('BLOG_FEATURE_CATEGORY','BLOG_FEATURE_GROUP_RIGHT_COLUMN','1','50',null);
insert into blog_features (build_option_name,build_option_group,is_active,display_seq,notes) values ('BLOG_FEATURE_LATEST_POSTS','BLOG_FEATURE_GROUP_RIGHT_COLUMN','1','60',null);
insert into blog_features (build_option_name,build_option_group,is_active,display_seq,notes) values ('BLOG_FEATURE_ARCHIVE','BLOG_FEATURE_GROUP_RIGHT_COLUMN','1','70',null);
insert into blog_features (build_option_name,build_option_group,is_active,display_seq,notes) values ('BLOG_FEATURE_RSS','BLOG_FEATURE_GROUP_RIGHT_COLUMN','1','80',null);
insert into blog_features (build_option_name,build_option_group,is_active,display_seq,notes) values ('BLOG_FEATURE_LINKS','BLOG_FEATURE_GROUP_PAGE','1','90',null);
insert into blog_features (build_option_name,build_option_group,is_active,display_seq,notes) values ('BLOG_FEATURE_FILES','BLOG_FEATURE_GROUP_PAGE','1','100',null);
insert into blog_features (build_option_name,build_option_group,is_active,display_seq,notes) values ('BLOG_FEATURE_ABOUT','BLOG_FEATURE_GROUP_PAGE','1','110',null);
insert into blog_features (build_option_name,build_option_group,is_active,display_seq,notes) values ('BLOG_FEATURE_SEARCH_LINKS','BLOG_FEATURE_GROUP_SEARCH','1','120',null);
insert into blog_features (build_option_name,build_option_group,is_active,display_seq,notes) values ('BLOG_FEATURE_SEARCH_FILES','BLOG_FEATURE_GROUP_SEARCH','1','130',null);

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
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('190','0','CANONICAL_URL','URL','BLOG_PAR_GROUP_SEO',apex_util.host_url( 'APEX_PATH' ),'trim( rtrim( :ATTRIBUTE_VALUE, ''/'' ) ) || ''/''');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('200','1','RSS_URL','URL','BLOG_PAR_GROUP_SEO',null,null);

--------------------------------------------------------
--  Inserting into BLOG_INIT_ITEMS
--------------------------------------------------------
insert into blog_init_items
select ai.application_id  as application_id
  ,ai.item_name           as item_name
from apex_application_items ai
join blog_settings s
  on ai.item_name = s.attribute_name
where 1 = 1
and ai.application_id = apex_application_install.get_application_id

  union all

select pi.application_id  as application_id
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
begin
  -- Create ORDS module
  blog_ords.create_module;
  blog_ords.add_files_template;
  blog_ords.create_rss_template;
  blog_ords.create_sitemap_templates;
end;
/
