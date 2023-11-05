--------------------------------------------------------
--  DDL for View BLOG_V_VERSION
--------------------------------------------------------
create or replace force view blog_v_version as
select
  attribute_value                             as application_version
  ,to_number( substr( attribute_value, -8 ) ) as application_date
from blog_settings
where 1 = 1
and attribute_name = 'G_APP_VERSION'
with read only
/
