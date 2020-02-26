--------------------------------------------------------
--  DDL for View BLOG_V_TEMP_FILES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "BLOG_V_TEMP_FILES" ("SEQ_ID", "ID", "ROW_VERSION", "IS_ACTIVE", "IS_DOWNLOAD", "FILE_PATH", "FILE_NAME", "MIME_TYPE", "BLOB_CONTENT", "FILE_DESC") AS 
  select t2.seq_id
  ,t2.n002 as id
  ,t2.n003 as row_version
  ,t2.n004 as is_active
  ,t2.n005 as is_download
  ,t2.c001 as file_path
  ,t2.c002 as file_name
  ,t1.mime_type
  ,t1.blob_content
  ,t2.c003 as file_desc
from apex_application_temp_files t1
join apex_collections t2 on t1.id = t2.n001
  and collection_name = 'BLOG_FILES'
where 1 = 1  
with read only
;
