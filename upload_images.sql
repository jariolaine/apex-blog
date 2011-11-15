timing START "Load Images to XDB"

SET serveroutput ON
DECLARE

  file_list        CONSTANT VARCHAR2(30) := 'file_list.xml'; -- File list
  upload_directory CONSTANT VARCHAR2(30) := 'BLOG_IMAGES';   -- Source directory
  subfolder        CONSTANT VARCHAR2(30) := 'blog';          -- Target subfolder
  path_separator   CONSTANT VARCHAR2(1)  := '/';
  charset_id       CONSTANT INTEGER      := nls_charset_id('AL32UTF8');
  
  repository_path  VARCHAR2(256);
  source_path      VARCHAR2(256);
  target_name      VARCHAR2(256);
  resource_path    VARCHAR2(256);
  
  content_bfile    BFILE;
  create_result    BOOLEAN;
  
  file_list_xml    xmltype;
  text_node        dbms_xmldom.domnode;
  file_node        dbms_xmldom.domnode;
  file_list_dom    dbms_xmldom.domdocument;
  file_none_list   dbms_xmldom.domnodelist;

BEGIN

  /* Construct OS source folder path string */
  source_path := '&source_path';
  source_path := source_path || path_separator || subfolder;
  
  /* Create database directory. If directory exists replace path */
  EXECUTE IMMEDIATE 'CREATE OR REPLACE directory ' || upload_directory || ' AS ''' || source_path || '''';
  
  /* Check XDB Apex image folder name */
  IF wwv_flow_utilities.db_version_is_at_least('11') THEN
    repository_path := 'images';
  ELSE
    repository_path := 'i';
  END IF;

  /* Construct Apex images XDB folder path string */
  repository_path := path_separator || repository_path || path_separator;
  
  /* Check that Apex images folder exists in XDB */
  IF NOT dbms_xdb.existsresource(repository_path) THEN
    RAISE_APPLICATION_ERROR (-20100, 'Apex image folder not found from XDB.');
  END IF;
  
  /* Construct XDB target folder path string */
  repository_path := repository_path || subfolder;
  
  /* Drop old target subfolder from XDB if exists */
  IF dbms_xdb.existsresource(repository_path) THEN
    dbms_xdb.deleteresource(repository_path, DBMS_XDB.DELETE_RECURSIVE);
  END IF;
  
  /* Create new subfolder to XDB */
  create_result := dbms_xdb.createfolder(repository_path);
  
  /* Get file list XML */
  content_bfile  := bfilename(upload_directory, file_list);
  file_list_xml  := xmltype(content_bfile, charset_id);
  file_list_dom  := dbms_xmldom.newdomdocument(file_list_xml);
  file_none_list := dbms_xmldom.getelementsbytagname(file_list_dom , 'directory');
  
  /* Loop file list and create needed directories */
  FOR c1 IN 0 .. (dbms_xmldom.getlength(file_none_list) - 1)
  LOOP

    file_node     := dbms_xmldom.item(file_none_list, c1);
    text_node     := dbms_xmldom.getfirstchild(file_node);
    resource_path := dbms_xmldom.getnodevalue(text_node);
    resource_path := repository_path || resource_path;

    /* Create directory to XDB */
    create_result := dbms_xdb.createfolder(resource_path);

    /* Raise error if directory creation fails */
    IF NOT create_result THEN
      RAISE_APPLICATION_ERROR (-20101, 'Failed to create directory: ' || resource_path);
    END IF;

  END LOOP;
  
  file_none_list := dbms_xmldom.getelementsbytagname(file_list_dom , 'file');
  
  /* Loop file list and upload files from source directory */
  FOR c1 IN 0 .. (dbms_xmldom.getlength(file_none_list) - 1)
  LOOP
  
    file_node     := dbms_xmldom.item(file_none_list, c1);
    text_node     := dbms_xmldom.getfirstchild(file_node);
    target_name   := dbms_xmldom.getnodevalue(text_node);
    resource_path := repository_path || target_name;
    
    BEGIN

      content_bfile := bfilename(upload_directory, target_name);

      /* Create file to XDB */
      create_result := dbms_xdb.createresource(resource_path, content_bfile, charset_id);

      /* Raise error if file creation fails */
      IF NOT create_result THEN
        RAISE_APPLICATION_ERROR (-20102, 'Failed to create file: ' || resource_path);
      END IF;

    EXCEPTION
    WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR (-20103, 'Source file not found: ' || target_name);
    END;
    
  END LOOP;
  
  COMMIT;
  
  /* Cleanup. Drop database directory */
  EXECUTE IMMEDIATE 'drop directory ' || upload_directory;
  
END;
/
timing STOP
