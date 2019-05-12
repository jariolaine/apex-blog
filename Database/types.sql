drop type blog_t_tag_ids
/

drop type blog_t_tag_id
/

create or replace type blog_t_tag_id
authid definer
as
object (
  tag_id number(38,0)
)
/

create or replace type blog_t_tag_ids
as
table of blog_t_tag_id
/
