--------------------------------------------------------
--  DDL for View BLOG_V_FILES
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_FILES" ("FILE_ID", "CREATED_ON", "CHANGED_ON", "IS_DOWNLOAD", "FILE_NAME", "MIME_TYPE", "BLOB_CONTENT", "FILE_SIZE", "FILE_CHARSET", "FILE_DESC") AS
  select t1.id as file_id
  ,t1.created_on
  ,t1.changed_on
  ,t1.is_download
  ,t1.file_name
  ,t1.mime_type
  ,t1.blob_content
  ,t1.file_size
  ,t1.file_charset
  ,t1.file_desc
from blog_files t1
where 1 = 1
and t1.is_active = 1
with read only
/
