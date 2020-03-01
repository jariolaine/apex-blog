CREATE OR REPLACE package "BLOG_FILE" 
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Procedure and functions for files
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 08.01.2020 - Created
--
--  TO DO: (search from body TODO#x)
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global variables and constants
-- none
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------- 
  procedure download (
    p_file_name   in varchar2
  );
-------------------------------------------------------------------------------- 
end "BLOG_FILE";

/


CREATE OR REPLACE package body "BLOG_FILE" as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------  
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------  
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------  
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure download(
    p_file_name   in varchar2
  )
  as
    l_file        blog_v_files%rowtype;  
    c_date_lang   constant varchar2(255) := 'NLS_DATE_LANGUAGE=ENGLISH';
    c_date_format constant varchar2(255) := 'Dy, DD Mon YYYY HH24:MI:SS "GMT"';
  begin
    
    select *
    into l_file
    from blog_v_files
    where file_name = p_file_name
    ;

    sys.owa_util.mime_header(coalesce (l_file.mime_type, 'application/octet'), false, l_file.file_charset);
    
    sys.htp.p('cache-control: public, max-age=60');
    
    sys.htp.p('last-modified: ' || to_char(sys_extract_utc(l_file.changed_on), c_date_format, c_date_lang));
    sys.htp.p('content-length: ' || l_file.file_size);
    
    sys.owa_util.http_header_close;
    
    sys.wpg_docload.download_file(l_file.blob_content);
    
  end download;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_FILE";
/
