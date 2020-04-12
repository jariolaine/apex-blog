--------------------------------------------------------
--  DDL for View BLOG_V_TEMP_FILES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "BLOG_V_TEMP_FILES" ("SEQ_ID", "ID", "ROW_VERSION", "IS_ACTIVE", "IS_DOWNLOAD", "FILE_PATH", "FILE_NAME", "FILE_DESC", "MIME_TYPE", "BLOB_CONTENT") AS 
  select t1.seq_id
  ,t1.n002    as id
  ,t1.n003    as row_version
  ,t1.n004    as is_active
  ,t1.n005    as is_download
  ,t1.c001    as file_path
  ,t1.c002    as file_name
  ,t1.c003    as file_desc
  ,t1.c004    as mime_type
  ,t1.blob001 as blob_content
from apex_collections t1
where 1 = 1
and collection_name = 'BLOG_FILES'
with read only
;
