create table blog_items_init(
  application_id number not null,
  item_name varchar2(255 byte) not null,
  item_value varchar2(4000 char) not null,
  constraint blog_items_init_pk primary key( application_id, item_name )
)
/
create materialized view blog_items_init
on prebuilt table
with reduced precision
as
select application_id
  ,item_name
  ,item_value
from blog_v_items_init
/
begin
  dbms_mview.refresh('BLOG_ITEMS_INIT', 'C');
end;
/
