create  PROCEDURE blog_prn_theme_files_ins
AS
  l_counter   SIMPLE_INTEGER := 0;
  l_length    SIMPLE_INTEGER := 0;
  l_blob_len  SIMPLE_INTEGER := 0;
  l_offset    SIMPLE_INTEGER := 1;
  l_byte_len  SIMPLE_INTEGER := 128;
  l_temp      VARCHAR2(32767);
BEGIN
  FOR c1 IN (
    select file_name,
      mime_type,
      file_type,
      blob_content
    from blog_file
    where file_type = 'THEME'
    order by file_name
  ) LOOP
    l_counter   := 1;
    l_length    := 0;
    l_blob_len  := 0;
    l_offset    := 1;
    l_byte_len  := 128;
    l_length    := COALESCE(sys.dbms_lob.getlength(c1.blob_content), 0);
    l_blob_len  := l_length;
    sys.dbms_output.put_line('begin');
    sys.dbms_output.put_line('blog_install.i := blog_install.e;');
    IF l_length < l_byte_len THEN
      sys.dbms_output.put_line('blog_install.i('||l_counter||') := '
        || '''' || rawtohex(l_temp) || ''';'
      );
    ELSE
      WHILE l_offset < l_length AND l_byte_len > 0
      LOOP
        
        l_temp := dbms_lob.substr(c1.blob_content,l_byte_len,l_offset);
        sys.dbms_output.put_line('blog_install.i('||l_counter||') := '
          || '''' || rawtohex(l_temp) || ''';'
        );
        l_offset := l_offset + l_byte_len;
        l_blob_len := l_blob_len - l_byte_len;
        IF l_blob_len < l_byte_len THEN
          l_byte_len := l_blob_len;
        END IF;
        l_counter := l_counter  + 1;
      END LOOP;
    END IF;
    sys.dbms_output.put_line('blog_install.b := blog_install.varchar2_to_blob(blog_install.i);');
    sys.dbms_output.put_line('insert into blog_file (file_name,mime_type,file_type,blob_content)');
    sys.dbms_output.put_line('values ('''||c1.file_name||''','''||c1.mime_type||''','''||c1.file_type||''',blog_install.b);');
    sys.dbms_output.put_line('end;');
    sys.dbms_output.put_line('/');
  END LOOP;
END blog_prn_theme_files_ins;
/