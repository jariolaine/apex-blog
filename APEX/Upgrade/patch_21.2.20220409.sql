--------------------------------------------------------
--  Drop constraint BLOG_COMMENT_FLAGS_CK2
--------------------------------------------------------
alter table blog_comment_flags drop
  constraint blog_comment_flags_ck2;

--------------------------------------------------------
--  Update table BLOG_COMMENT_FLAGS
--------------------------------------------------------
update blog_comment_flags
  set flag = 'UNREAD'
where 1 = 1
and flag = 'NEW'
;

--------------------------------------------------------
--  Add constraint BLOG_COMMENT_FLAGS_CK2
--------------------------------------------------------
alter table blog_comment_flags add
  constraint blog_comment_flags_ck2 check (flag in( 'UNREAD', 'MODERATE' ));

--------------------------------------------------------
--  Alter table BLOG_COMMENT_SUBSCRIBERS add column IS_ACTIVE
--------------------------------------------------------
alter table blog_comment_subscribers add is_active number(1,0);

--------------------------------------------------------
--  Update table BLOG_COMMENT_SUBSCRIBERS
--------------------------------------------------------
update blog_comment_subscribers
  set is_active = 1
;

--------------------------------------------------------
--  Alter table BLOG_COMMENT_SUBSCRIBERS add constraints
--------------------------------------------------------
alter table blog_comment_subscribers modify is_active not null;

alter table blog_comment_subscribers add
  constraint blog_comment_subscribers_ck2 check ( is_active in( 0, 1 ) );

--------------------------------------------------------
--  Delete from BLOG_INIT_ITEMS
--------------------------------------------------------
delete from blog_init_items
;

--------------------------------------------------------
--  Update blog_settings
--------------------------------------------------------
update blog_settings
  set attribute_name = 'G_APP_DATE_FORMAT'
where 1 = 1
and attribute_name = 'G_DATE_FORMAT'
;

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
and ai.application_id = blog_util.get_attribute_value( 'G_PUB_APP_ID' )
  union all
select 1              as is_active
  ,pi.application_id  as application_id
  ,pi.item_name       as item_namee
from apex_application_page_items pi
join blog_settings s
  on pi.item_name = s.attribute_name
where 1 = 1
and pi.application_id = blog_util.get_attribute_value( 'G_PUB_APP_ID' )
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

--------------------------------------------------------
--  Delete from BLOG_FEATURES
--------------------------------------------------------
delete from blog_features
;
--------------------------------------------------------
--  Inserting into BLOG_FEATURES
--------------------------------------------------------
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','10','BLOG_FEATURE_ALLOW_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS',null,'BLOG_HELP_FEATURE_ALLOW_COMMENTS');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','20','BLOG_FEATURE_MODERATE_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS','BLOG_FEATURE_ALLOW_COMMENTS','BLOG_HELP_FEATURE_MODERATE_COMMENTS');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','30','BLOG_FEATURE_SUBSCRIBE_COMMENTS','BLOG_FEATURE_GROUP_COMMENTS','BLOG_FEATURE_ALLOW_COMMENTS','BLOG_HELP_FEATURE_SUBSCRIBE_COMMENTS');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','50','BLOG_FEATURE_POST_PAGINATION','BLOG_FEATURE_GROUP_MISC',null,'BLOG_HELP_FEATURE_POST_PAGINATION');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','60','BLOG_FEATURE_SEARCH_POSTS','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null,'BLOG_HELP_FEATURE_SEARCH_POSTS');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','70','BLOG_FEATURE_LATEST_POSTS','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null,'BLOG_HELP_FEATURE_LATEST_POSTS');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','100','BLOG_FEATURE_CATEGORY','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null,'BLOG_HELP_FEATURE_CATEGORY');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','110','BLOG_FEATURE_CATEGORY_POST_COUNT','BLOG_FEATURE_GROUP_RIGHT_COLUMN','BLOG_FEATURE_CATEGORY','BLOG_HELP_FEATURE_CATEGORY_POST_COUNT');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','150','BLOG_FEATURE_ARCHIVE','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null,'BLOG_HELP_FEATURE_ARCHIVE');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','160','BLOG_FEATURE_ARCHIVE_POST_COUNT','BLOG_FEATURE_GROUP_RIGHT_COLUMN','BLOG_FEATURE_ARCHIVE','BLOG_HELP_FEATURE_ARCHIVE_POST_COUNT');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','200','BLOG_FEATURE_RSS','BLOG_FEATURE_GROUP_RIGHT_COLUMN',null,'BLOG_HELP_FEATURE_RSS');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','210','BLOG_FEATURE_LINKS','BLOG_FEATURE_GROUP_PAGE',null,'BLOG_HELP_FEATURE_LINKS');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','220','BLOG_FEATURE_SEARCH_LINKS','BLOG_FEATURE_GROUP_PAGE','BLOG_FEATURE_LINKS','BLOG_HELP_FEATURE_SEARCH_LINKS');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','230','BLOG_FEATURE_FILES','BLOG_FEATURE_GROUP_PAGE',null,'BLOG_HELP_FEATURE_FILES');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','240','BLOG_FEATURE_SEARCH_FILES','BLOG_FEATURE_GROUP_PAGE','BLOG_FEATURE_FILES','BLOG_HELP_FEATURE_SEARCH_FILES');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','250','BLOG_FEATURE_ABOUT','BLOG_FEATURE_GROUP_PAGE',null,'BLOG_HELP_FEATURE_ABOUT');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','260','BLOG_FEATURE_MODAL_PAGES','BLOG_FEATURE_GROUP_MISC',null,'BLOG_HELP_FEATURE_MODAL_PAGES');
insert into blog_features (is_active,display_seq,build_option_name,build_option_group,build_option_parent,help_message) values ('1','270','BLOG_FEATURE_SITEMAP','BLOG_FEATURE_GROUP_MISC',null,'BLOG_HELP_FEATURE_SITEMAP');

--------------------------------------------------------
--  Update blog_settings
--------------------------------------------------------
update blog_settings set display_seq = 10 ,is_nullable = 0 ,data_type = 'STRING' ,attribute_group_message = 'INTERNAL' ,post_expression = null where attribute_name = 'G_ADMIN_APP_ID';
update blog_settings set display_seq = 20 ,is_nullable = 0 ,data_type = 'STRING' ,attribute_group_message = 'INTERNAL' ,post_expression = null where attribute_name = 'G_PUB_APP_ID';
update blog_settings set display_seq = 30 ,is_nullable = 0 ,data_type = 'STRING' ,attribute_group_message = 'INTERNAL' ,post_expression = null where attribute_name = 'G_APP_VERSION';
update blog_settings set display_seq = 70 ,is_nullable = 0 ,data_type = 'INTEGER' ,attribute_group_message = 'INTERNAL' ,post_expression = null where attribute_name = 'G_COMMENT_WATCH_MONTHS';
update blog_settings set display_seq = 130 ,is_nullable = 0 ,data_type = 'STRING' ,attribute_group_message = 'BLOG_SETTING_GROUP_GENERAL' ,post_expression = null where attribute_name = 'G_APP_NAME';
update blog_settings set display_seq = 140 ,is_nullable = 0 ,data_type = 'STRING' ,attribute_group_message = 'BLOG_SETTING_GROUP_GENERAL' ,post_expression = null where attribute_name = 'G_APP_DESC';
update blog_settings set display_seq = 150 ,is_nullable = 1 ,data_type = 'EMAIL' ,attribute_group_message = 'BLOG_SETTING_GROUP_GENERAL' ,post_expression = null where attribute_name = 'G_APP_EMAIL';
update blog_settings set display_seq = 160 ,is_nullable = 0 ,data_type = 'DATE_FORMAT' ,attribute_group_message = 'BLOG_SETTING_GROUP_UI' ,post_expression = null where attribute_name = 'G_APP_DATE_FORMAT';
update blog_settings set display_seq = 170 ,is_nullable = 0 ,data_type = 'DATE_FORMAT' ,attribute_group_message = 'BLOG_SETTING_GROUP_UI' ,post_expression = null where attribute_name = 'G_POST_TITLE_DATE_FORMAT';
update blog_settings set display_seq = 200 ,is_nullable = 0 ,data_type = 'INTEGER' ,attribute_group_message = 'BLOG_SETTING_GROUP_REPORTS' ,post_expression = null where attribute_name = 'P1_REPORT_ROWS';
update blog_settings set display_seq = 210 ,is_nullable = 0 ,data_type = 'INTEGER' ,attribute_group_message = 'BLOG_SETTING_GROUP_REPORTS' ,post_expression = null where attribute_name = 'P2_REPORT_ROWS';
update blog_settings set display_seq = 230 ,is_nullable = 0 ,data_type = 'INTEGER' ,attribute_group_message = 'BLOG_SETTING_GROUP_REPORTS' ,post_expression = null where attribute_name = 'G_LATEST_POST_ROWS';
update blog_settings set display_seq = 240 ,is_nullable = 0 ,data_type = 'INTEGER' ,attribute_group_message = 'BLOG_SETTING_GROUP_REPORTS' ,post_expression = null where attribute_name = 'G_SEARCH_ROWS';
update blog_settings set display_seq = 300 ,is_nullable = 0 ,data_type = 'URL' ,attribute_group_message = 'BLOG_SETTING_GROUP_SEO' ,post_expression = q'[trim( rtrim( :ATTRIBUTE_VALUE, '/' ) )]' where attribute_name = 'G_CANONICAL_URL';
update blog_settings set display_seq = 310 ,is_nullable = 1 ,data_type = 'URL' ,attribute_group_message = 'BLOG_SETTING_GROUP_SEO' ,post_expression = null where attribute_name = 'G_RSS_URL';
update blog_settings set display_seq = 320 ,is_nullable = 1 ,data_type = 'URL' ,attribute_group_message = 'BLOG_SETTING_GROUP_SEO' ,post_expression = null where attribute_name = 'G_RSS_XSL_URL';

--------------------------------------------------------
--  Update application version
--------------------------------------------------------
update blog_settings
set attribute_value = 'Release 21.2.20220409'
where 1 = 1
and attribute_name = 'G_APP_VERSION'
;

commit;
