--  Patch 22.2.20230304
--------------------------------------------------------
--  Alter table BLOG_POST
--------------------------------------------------------
alter table blog_posts add post_txt_search char( 1 byte );
--------------------------------------------------------
--  Update table BLOG_POST
--------------------------------------------------------
alter trigger blog_posts_trg disable;

update blog_posts
  set post_txt_search = 'X'
;

begin

  for c1 in(
    select t1.id
      ,published_on + numtodsinterval( rownum / 1000000 ,'second' ) as new_published_on
    from blog_posts t1
    where 1 = 1
    and exists(
      select 1
      from blog_posts x1
      where 1 = 1
      and x1.published_on = t1.published_on
      group by x1.published_on
      having count(1) > 1
    )
    order by t1.id desc
  ) loop

    update blog_posts
      set published_on = c1.new_published_on
      where 1 = 1
        and id = c1.id
      ;

  end loop;

end;
/

alter trigger blog_posts_trg enable;
--------------------------------------------------------
--  Alter table BLOG_POST
--------------------------------------------------------
alter table blog_posts add constraint blog_posts_uk1 unique( published_on );
alter table blog_posts modify post_txt_search not null;
--------------------------------------------------------
--  Insert patch version info to BLOG_SETTINGS
--------------------------------------------------------
insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,attribute_value)
  values(10,0,'PATCH_20230304','STRING','INTERNAL','Patch 22.2.20230304')
;
