--------------------------------------------------------
--  DDL for View BLOG_V_VERSION
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_VERSION" ("APPLICATION_VERSION", "APPLICATION_DATE") AS
select
  attribute_value                             as application_version
  ,to_number( substr( attribute_value, -8 ) ) as application_date
from blog_settings
where 1 = 1
and attribute_name = 'G_APP_VERSION'
/
