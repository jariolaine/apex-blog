REM INSERTING into BLOG_SETTINGS
set define off;
-- Defaults
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('10','0','APP_GROUP','STRING','INTERNAL','BLOG_040000',null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('140','0','G_DATE_FORMAT','DATE_FORMAT','BLOG_PAR_GROUP_UI','fmDD Mon YYYY',null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('150','0','G_POST_TITLE_DATE_FORMAT','DATE_FORMAT','BLOG_PAR_GROUP_UI','fmDay"," Month DD"," YYYY',null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('160','0','G_ARCHIVE_DATE_FORMAT','DATE_FORMAT','BLOG_PAR_GROUP_UI','fmMonth, YYYY',null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('160','0','P1_REPORT_ROWS','INTEGER','BLOG_PAR_GROUP_REPORTS','10',null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('170','0','P2_REPORT_ROWS','INTEGER','BLOG_PAR_GROUP_REPORTS','10',null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('180','0','G_SEARCH_ROWS','INTEGER','BLOG_PAR_GROUP_REPORTS','10',null);

-- Modify on export
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('100','0','G_APP_NAME','STRING','BLOG_PAR_GROUP_GENERAL','My Blog',null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('110','0','G_APP_DESC','STRING','BLOG_PAR_GROUP_GENERAL','About almost everything',null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('120','1','APP_EMAIL','EMAIL','BLOG_PAR_GROUP_GENERAL',null,null);
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('190','0','CANONICAL_URL','URL','BLOG_PAR_GROUP_SEO',apex_util.host_url( 'APEX_PATH' ),'trim( rtrim( :ATTRIBUTE_VALUE, ''/'' ) ) || ''/''');
insert into blog_settings (display_seq,is_nullable,attribute_name,data_type,group_name,attribute_value,post_expression) values ('200','1','RSS_URL','URL','BLOG_PAR_GROUP_SEO',null,null);

begin
  dbms_mview.refresh('BLOG_ITEMS_INIT', 'C');
end;
/
