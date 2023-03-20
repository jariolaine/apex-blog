--------------------------------------------------------
--  Inserting into BLOG_SETTINGS
--------------------------------------------------------
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,int_min,int_max,attribute_value) values('10','0','G_APP_VERSION','STRING','INTERNAL',null,null,'Release 22.2.4.20230320');
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,int_min,int_max,attribute_value) values('20','0','G_PUB_APP_ID','STRING','INTERNAL',null,null,blog_util.int_to_vc2(apex_application_install.get_application_id));
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,int_min,int_max,attribute_value) values('110','0','G_APP_NAME','STRING','BLOG_SETTING_GROUP_GENERAL',null,null,'My Blog');
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,int_min,int_max,attribute_value) values('120','0','G_APP_DESC','STRING','BLOG_SETTING_GROUP_GENERAL',null,null,'About Almost Everything');
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,int_min,int_max,attribute_value) values('130','1','G_APP_EMAIL','EMAIL','BLOG_SETTING_GROUP_GENERAL',null,null,null);
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,int_min,int_max,attribute_value) values('210','0','G_APP_DATE_FORMAT','DATE_FORMAT','BLOG_SETTING_GROUP_UI',null,null,'fmDD Mon YYYY');
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,int_min,int_max,attribute_value) values('220','0','G_POST_TITLE_DATE_FORMAT','DATE_FORMAT','BLOG_SETTING_GROUP_UI',null,null,'fmDay, Month DD, YYYY');
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,int_min,int_max,attribute_value) values('310','0','P1_REPORT_ROWS','INTEGER','BLOG_SETTING_GROUP_REPORTS','1','50','5');
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,int_min,int_max,attribute_value) values('320','0','P2_REPORT_ROWS','INTEGER','BLOG_SETTING_GROUP_REPORTS','1','50','10');
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,int_min,int_max,attribute_value) values('330','0','G_LATEST_POST_ROWS','INTEGER','BLOG_SETTING_GROUP_REPORTS','1','20','5');
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,int_min,int_max,attribute_value) values('340','0','G_SEARCH_ROWS','INTEGER','BLOG_SETTING_GROUP_REPORTS','1','50','10');
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,int_min,int_max,attribute_value) values('410','0','G_COMMENT_WATCH_MONTHS','INTEGER','BLOG_SETTING_GROUP_COMMENTS','1','6','1');
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,int_min,int_max,attribute_value) values('510','0','G_MAX_AGE_RSS','INTEGER','BLOG_SETTING_GROUP_FILES','0','31536000','3600');
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,int_min,int_max,attribute_value) values('520','0','G_MAX_AGE_RSS_XSL','INTEGER','BLOG_SETTING_GROUP_FILES','0','31536000','604800');
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,int_min,int_max,attribute_value) values('530','0','G_MAX_AGE_DOWNLOAD','INTEGER','BLOG_SETTING_GROUP_FILES','0','31536000','14400');
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,int_min,int_max,attribute_value) values('540','0','G_MAX_AGE_FILE','INTEGER','BLOG_SETTING_GROUP_FILES','0','31536000','604800');
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,int_min,int_max,attribute_value) values('550','0','G_MAX_AGE_SITEMAP','INTEGER','BLOG_SETTING_GROUP_FILES','0','31536000','3600');
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,int_min,int_max,attribute_value) values('610','1','G_CANONICAL_HOST','URL','BLOG_SETTING_GROUP_SEO',null,null,null);
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,int_min,int_max,attribute_value) values('620','1','G_RSS_URL','URL','BLOG_SETTING_GROUP_SEO',null,null,null);
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,int_min,int_max,attribute_value) values('630','1','G_RSS_XSL_URL','URL','BLOG_SETTING_GROUP_SEO',null,null,null);
--------------------------------------------------------
--  Inserting into BLOG_FEATURES
--------------------------------------------------------
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','100','BLOG_FEATURE_LINKS','BLOG_FEATURE_GROUP_PAGE',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','110','BLOG_FEATURE_SEARCH_LINKS','BLOG_FEATURE_GROUP_PAGE','BLOG_FEATURE_LINKS');
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','120','BLOG_FEATURE_FILES','BLOG_FEATURE_GROUP_PAGE',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','130','BLOG_FEATURE_SEARCH_FILES','BLOG_FEATURE_GROUP_PAGE','BLOG_FEATURE_FILES');
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','140','BLOG_FEATURE_ABOUT','BLOG_FEATURE_GROUP_PAGE',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','210','BLOG_FEATURE_SEARCH_POSTS','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','220','BLOG_FEATURE_LATEST_POSTS','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','230','BLOG_FEATURE_CATEGORY','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','240','BLOG_FEATURE_CATEGORY_POST_COUNT','BLOG_FEATURE_GROUP_RIGHT_COLUMN','BLOG_FEATURE_CATEGORY');
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','250','BLOG_FEATURE_ARCHIVE','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','260','BLOG_FEATURE_ARCHIVE_POST_COUNT','BLOG_FEATURE_GROUP_RIGHT_COLUMN','BLOG_FEATURE_ARCHIVE');
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','270','BLOG_FEATURE_TAG_CLOUD','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','280','BLOG_FEATURE_TAG_CLOUD_POST_COUNT','BLOG_FEATURE_GROUP_RIGHT_COLUMN','BLOG_FEATURE_TAG_CLOUD');
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','290','BLOG_FEATURE_RSS','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','310','BLOG_FEATURE_ALLOW_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','320','BLOG_FEATURE_MODERATE_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS','BLOG_FEATURE_ALLOW_COMMENTS');
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','330','BLOG_FEATURE_SUBSCRIBE_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS','BLOG_FEATURE_ALLOW_COMMENTS');
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','410','BLOG_FEATURE_POST_PAGINATION','BLOG_FEATURE_GROUP_MISC',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','420','BLOG_FEATURE_MODAL_PAGES','BLOG_FEATURE_GROUP_MISC',null);
insert into blog_features(is_active,display_seq,build_option_name,build_option_group,build_option_parent) values('1','430','BLOG_FEATURE_SITEMAP','BLOG_FEATURE_GROUP_MISC',null);
--------------------------------------------------------
--  Inserting into BLOG_LIST_OF_VALUES
--------------------------------------------------------
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','10','COMMENT_FLAG','NEW','BLOG_LOV_COMMENT_FLAG_NEW');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','20','COMMENT_FLAG','UNREAD','BLOG_LOV_COMMENT_FLAG_UNREAD');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','30','COMMENT_FLAG','REPLY','BLOG_LOV_COMMENT_FLAG_REPLY');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','40','COMMENT_FLAG','READ','BLOG_LOV_COMMENT_FLAG_READ');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','10','COMMENT_STATUS','ENABLED','BLOG_LOV_COMMENT_STATUS_ENABLED');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','20','COMMENT_STATUS','DISABLED','BLOG_LOV_COMMENT_STATUS_DISABLED');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','30','COMMENT_STATUS','MODERATE','BLOG_LOV_COMMENT_STATUS_MODERATE');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','10','IS_ACTIVE','1','BLOG_LOV_IS_ACTIVE_ENABLED');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','20','IS_ACTIVE','0','BLOG_LOV_IS_ACTIVE_DISABLED');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','10','LINK_STATUS','ENABLED','BLOG_LOV_LINK_STATUS_ENABLED');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','20','LINK_STATUS','DISABLED','BLOG_LOV_LINK_STATUS_DISABLED');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','30','LINK_STATUS','GROUP_DISABLED','BLOG_LOV_LINK_STATUS_LABEL_DISABLED');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','10','POST_STATUS','PUBLISHED','BLOG_LOV_POST_STATUS_PUBLISHED');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','20','POST_STATUS','SCHEDULED','BLOG_LOV_POST_STATUS_SCHEDULED');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','30','POST_STATUS','DRAFT','BLOG_LOV_POST_STATUS_DRAFT');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','40','POST_STATUS','CATEGORY_DISABLED','BLOG_LOV_POST_STATUS_CATEGORY_DISABLED');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','50','POST_STATUS','BLOGGER_DISABLED','BLOG_LOV_POST_STATUS_BLOGGER_DISABLED');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','10','YES_NO','0','BLOG_LOV_YES_NO_NO');
insert into blog_list_of_values(is_active,display_seq,lov_name,return_value,display_message) values('1','20','YES_NO','1','BLOG_LOV_YES_NO_YES');
--------------------------------------------------------
--  Inserting into BLOG_INIT_ITEMS
--------------------------------------------------------
insert into blog_init_items(is_active, application_id, item_name)
select 1              as is_active
  ,ai.application_id  as application_id
  ,ai.item_name       as item_name
from apex_application_items ai
join blog_settings s
  on ai.item_name = s.attribute_name
where 1 = 1
  and ai.application_id = apex_application_install.get_application_id
  union all
select 1              as is_active
  ,pi.application_id  as application_id
  ,pi.item_name       as item_namee
from apex_application_page_items pi
join blog_settings s
  on pi.item_name = s.attribute_name
where 1 = 1
  and pi.application_id = apex_application_install.get_application_id
  union all
select 1              as is_active
  ,ai.application_id  as application_id
  ,ai.item_name       as item_name
from apex_application_items ai
join blog_settings s
  on ai.item_name = s.attribute_name
where 1 = 1
  and ai.application_id = blog_util.get_attribute_value( 'G_ADMIN_APP_ID' )
  union all
select 1              as is_active
  ,pi.application_id  as application_id
  ,pi.item_name       as item_namee
from apex_application_page_items pi
join blog_settings s
  on pi.item_name = s.attribute_name
where 1 = 1
  and pi.application_id = blog_util.get_attribute_value( 'G_ADMIN_APP_ID' )
;
