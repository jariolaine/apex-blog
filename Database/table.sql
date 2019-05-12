drop table blog_comments
/

drop table blog_posts
/

drop table blog_post_preview
/

drop table blog_bloggers
/

drop table blog_readers
/

drop table blog_cats
/

drop table blog_files
/

drop table blog_links
/

drop table blog_links_grp
/

drop table blog_posts_tags
/

drop table blog_tags
/

drop table blog_params
/


/*
purge recyclebin
*/

-- start table creation

-- table blog_readers
create table blog_readers(
  id            number(38,0) constraint blog_readers_pk primary key  not null,
  row_version   number(38,0) not null,
  created_on    timestamp with local time zone not null,
  created_by    varchar2(64 char) not null,
  changed_on    timestamp with local time zone not null,
  changed_by    varchar2(64 char) not null,

  is_disabled   number(1,0) not null,

  reader_name   varchar2(64 char) constraint blog_readers_uk1 unique not null,
  email         varchar2(64 char) constraint blog_readers_uk2 unique,

  constraint blog_readers_ck2 check(row_version > 0),
  constraint blog_readers_ck3 check(is_disabled in(0, 1)),
  constraint blog_readers_ck4 check(reader_name = trim(reader_name)),
  constraint blog_readers_ck5 check(email = trim(lower(email)))
)
/

-- table blog_bloggers
create table blog_bloggers(
  id            number(38,0)
    constraint blog_bloggers_pk primary key
    constraint blog_bloggers_fk1 references blog_readers
    not null,
  row_version   number(38,0) not null,
  created_on    timestamp with local time zone not null,
  created_by    varchar2(64 char) not null,
  changed_on    timestamp with local time zone not null,
  changed_by    varchar2(64 char) not null,

  is_disabled   number(1,0) not null,

  is_admin      number(1,0) not null,

  display_seq   number(10,0) not null,

  blogger_name  varchar2(64 char) constraint blog_bloggers_uk1 unique not null,
  username      varchar2(64 char) constraint blog_bloggers_uk2 unique not null,
  passwd        varchar2(4000 char) not null,
  email         varchar2(64 char),
  bio           varchar2(4000 char),

  constraint blog_bloggers_ck1 check(row_version > 0),
  constraint blog_bloggers_ck2 check(is_disabled in(0, 1)),
  constraint blog_bloggers_ck3 check(is_admin in(0, 1)),
  constraint blog_bloggers_ck4 check(display_seq > 0),

  constraint blog_bloggers_ck5 check(username = trim(upper(username))),
  constraint blog_bloggers_ck6 check(email = trim(lower(email)))
)
/

-- table blog_cats
create table blog_cats(
  id            number(38,0) constraint blog_cats_pk primary key not null,
  row_version   number(38,0) not null,
  created_on    timestamp with local time zone not null,
  created_by    varchar2(64 char) not null,
  changed_on    timestamp with local time zone not null,
  changed_by    varchar2(64 char) not null,

  is_disabled   number(1,0) not null,

  display_seq   number(10,0) not null,

  title         varchar2(128 char) not null,
  title_unique  varchar2(128 char) generated always as (upper(title))
    constraint blog_cats_uk1 unique
    not null,

  constraint blog_cats_ck1 check(row_version > 0),
  constraint blog_cats_ck2 check(is_disabled in(0, 1)),
  constraint blog_cats_ck3 check(display_seq > 0)
)
/

-- table blog_posts
create table blog_posts(
  id              number(38,0) constraint blog_posts_pk primary key not null,
  row_version     number(38,0) not null,
  created_on      timestamp with local time zone not null,
  created_by      varchar2(64 char) not null,
  changed_on      timestamp with local time zone not null,
  changed_by      varchar2(64 char) not null,

  is_disabled     number(1,0) not null,

  blogger_id      number(38,0) constraint blog_posts_fk1 references blog_bloggers not null,
  category_id     number(38,0) constraint blog_posts_fk2 references blog_cats not null,

  title           varchar2(128 char) not null,
  post_desc       varchar2(1024 char) not null,
	body_html       clob not null,
  first_paragraph varchar2(4000) not null,
  valid_from      timestamp with local time zone not null,

  body_length     number(38,0) not null,
  year_month      number(6,0) not null,

  constraint blog_posts_ck1 check (row_version > 0),
  constraint blog_posts_ck2 check (is_disabled in(0, 1)),
  constraint blog_posts_ck3 check (body_length > 0),
  constraint blog_posts_ck4 check (year_month > 0)
)
/

-- table blog_post_preview
create table blog_post_preview(
  id              number(38,0)
    constraint blog_post_preview_pk primary key not null,
  created_on      timestamp with local time zone default localtimestamp not null,
  post_title      varchar2(128 char),
  category_title  varchar2(128 char),
  body_html       clob,
  tags            varchar2(4000)
)
/

-- table blog_comments
create table blog_comments(
  id          number(38,0) constraint blog_comments_pk primary key not null,
  row_version number(38,0) not null,
  created_on  timestamp with local time zone not null,
  created_by  varchar2(64 char) not null,
  changed_on  timestamp with local time zone not null,
  changed_by  varchar2(64 char) not null,

  is_disabled number(1,0) not null,

  reader_id   number(38,0) constraint blog_comments_fk1 references blog_readers not null,
  post_id     number(38,0) constraint blog_comments_fk2 references blog_posts not null,
  parent_id   number(38,0) constraint blog_commentS_fk3 references blog_comments,

  body_html   varchar2(4000 char) not null,

  constraint blog_comment_ck1 check(row_version > 0),
  constraint blog_comment_ck2 check(is_disabled in(0, 1))
)
/


-- table blog_params
create table blog_params(
  id          number(38,0) constraint blog_params_pk primary key not null,
  row_version number(38,0) not null,
  created_on  timestamp with local time zone not null,
  created_by  varchar2(64 char) not null,
  changed_on  timestamp with local time zone not null,
  changed_by  varchar2(64 char) not null,

  is_nullable number(1,0) not null,

  display_seq number(10,0) not null,

  param_name      varchar2(64 char) constraint blog_params_uk1 unique not null,
  --param_label     varchar2(256 char) not null,
  data_type       varchar2(64 char) not null,
  group_name      varchar2(64 char) not null,
  --help_text       varchar2(4000 char),
  param_value     varchar2(4000 char),
  parent_name     varchar2(64 char) constraint blog_params_fk1 references blog_params

  validation_exp  varchar2(4000 char),
  process_exp     varchar2(4000 char),

  constraint blog_params_ck01 check(row_version > 0),
  constraint blog_params_ck02 check(is_nullable in(0, 1)),
  constraint blog_params_ck03 check(display_seq > 0),

  constraint blog_params_ck04 check(param_name = trim(regexp_replace(upper(param_name), '\s+', ''))),
  constraint blog_params_ck05 check(data_type in('BOOLEAN', 'INTEGER', 'STRING', 'TEXT')),
  constraint blog_params_ck06 check(group_name in('UI', 'SEO', 'RSS', 'COMMENTS', 'INTERNAL')),

  constraint blog_params_ck07 check (
    (is_nullable = 1) or
    (is_nullable = 0 and param_value is not null)
  ),

  constraint blog_params_ck08 check(
    (data_type != 'BOOLEAN') or
    (data_type = 'BOOLEAN' and is_nullable = 0 and round(to_number(param_name)) in(0, 1))
  ),

  constraint blog_params_ck09 check (
    (data_type != 'INTEGER') or
    (data_type = 'INTEGER' and param_value = round(to_number(param_value)))
  ),

  constraint blog_params_ck10 check (
    (data_type != 'STRING') or
    (data_type = 'STRING' and param_value = trim(replace(regexp_replace(param_value, '\s+', ' '),'  ', ' ')))
  )

)
/

-- table blog_links_grp
create table blog_links_grp(
  id            number(38,0) constraint blog_links_grp_pk primary key not null,
  row_version   number(38,0) not null,
  created_on    timestamp with local time zone not null,
  created_by    varchar2(64 char) not null,
  changed_on    timestamp with local time zone not null,
  changed_by    varchar2(64 char) not null,

  is_disabled   number(1,0) not null,

  display_seq   number(10,0) not null,

  title         varchar2(128 char) not null,
  title_unique  varchar2(128 char) as (upper(title)) constraint blog_links_grp_uk1 unique not null,

  constraint blog_links_grp_ck1 check(row_version > 0),
  constraint blog_links_grp_ck2 check(is_disabled in(0, 1)),
  constraint blog_links_grp_ck3 check(display_seq > 0)
)
/

-- table blog_links
create table blog_links(
  id            number(38,0) constraint blog_links_pk primary key not null,
  row_version   number(38,0) not null,
  created_on    timestamp with local time zone not null,
  created_by    varchar2(64 char) not null,
  changed_on    timestamp with local time zone not null,
  changed_by    varchar2(64 char) not null,

  is_disabled   number(1,0) not null,

  display_seq   number(10,0) not null,

  link_grp_id   number constraint blog_links_fk1 references blog_links_grp not null,
  title         varchar2(128 char) not null,
  link_desc     varchar2(4000 char) not null,
  link_url      varchar2(256 char) not null,

  constraint blog_links_ck1 check(row_version > 0),
  constraint blog_links_ck2 check(is_disabled in(0, 1)),
  constraint blog_links_ck3 check(display_seq > 0)
)
/

-- table blog_tags
create table blog_tags(
  id          number(38,0) constraint blog_tags_pk primary key not null,
  row_version number(38,0) not null,
  created_on  timestamp with local time zone not null,
  created_by  varchar2(64 char) not null,
  changed_on  timestamp with local time zone not null,
  changed_by  varchar2(64 char) not null,

  is_disabled number(1,0) not null,

  tag         varchar2(64 char) constraint blog_tags_uk1 unique not null,

  constraint blog_tags_ck1 check(row_version > 0),
  constraint blog_tags_ck2 check(is_disabled in(0, 1)),

)
/

-- table blog_posts_tags
create table blog_posts_tags(
  id          number(38,0) constraint blog_posts_tags_pk primary key not null,
  row_version number(38,0) not null,
  created_on  timestamp with local time zone not null,
  created_by  varchar2(64 char) not null,
  changed_on  timestamp with local time zone not null,
  changed_by  varchar2(64 char) not null,

  is_disabled number(1,0) not null,

  display_seq number(10,0) not null,

  post_id     number(38,0) constraint blog_posts_tags_fk1 references blog_post on delete cascade not null,
  tag_id      number(38,0) constraint blog_posts_tags_fk2 references blog_tags not null,

  constraint blog_posts_tags_uk1 unique(tag_id, post_id),

  constraint blog_posts_tags_ck1 check(row_version > 0),
  constraint blog_posts_tags_ck2 check(is_disabled in(0, 1)),
  constraint blog_posts_tags_ck3 check(display_seq > 0)
)
/

-- table blog_files
create table blog_files(
   id            number(38,0) constraint blog_files_pk primary key not null
  ,row_version   number(38,0) not null
  ,created_on    timestamp with local time zone not null
  ,created_by    varchar2(64 char) not null
  ,changed_on    timestamp with local time zone not null
  ,changed_by    varchar2(64 char) not null

  ,is_disabled   number(1,0) not null
  ,is_download   number(1,0) not null

  ,file_path     varchar2(1024 char) not null
  ,file_name     varchar2(256 char) constraint blog_files_uk1 unique not null
  ,mime_type     varchar2(256 char) not null
  ,blob_content  blob not null

  ,file_size     number(38,0) not null
  ,etag          varchar2(64 char) not null
  ,modified      varchar2(32 char) not null

  ,file_charset  varchar2(256 char)
  ,file_desc     varchar2(4000 char)

  ,constraint blog_files_ck1 check(row_version > 0)
  ,constraint blog_files_ck2 check(is_disabled in(0, 1))
  ,constraint blog_files_ck3 check(is_download in(0, 1))
  ,constraint blog_files_ck4 check(file_size > 0)
)
/

-- table blog_items_init
create table blog_items_init(
  application_id  number not null enable
  ,item_name      varchar2(255 byte) not null enable
  ,item_value     varchar2(4000 byte) not null enable
  ,constraint blog_items_init_pk
    primary key(application_id, item_name)
)
/

-- end table creation
