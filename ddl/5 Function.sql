CREATE OR REPLACE FUNCTION  "BLOG_SGID" RETURN NUMBER
AUTHID DEFINER
AS
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--    DESCRIPTION
--      Functions get surrogate primary key for APEX Bloging Platform new records
--
--    MODIFIED   (DD.MM.YYYY)
--    Jari Laine 06.01.2015 - Created
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
BEGIN
  RETURN TO_NUMBER(TO_CHAR(SYS_EXTRACT_UTC(SYSTIMESTAMP), 'YYYYMMDDHH24MISS') || LPAD(blog_seq.nextval,4,0));
END "BLOG_SGID";
/
begin
execute immediate '
CREATE OR REPLACE FUNCTION "BLOG_PW_HASH" (
  p_username IN VARCHAR2,
  p_password IN VARCHAR2
) RETURN VARCHAR2
AUTHID DEFINER
AS
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--    DESCRIPTION
--      Functions for APEX Bloging Platform admin application password hash
--      This function should be wrapped, as the hash algorhythm for password is exposed.
--
--    MODIFIED   (DD.MM.YYYY)
--    Jari Laine 06.01.2015 - Created
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  l_password VARCHAR2(4000);
  l_salt     VARCHAR2(256) := ''' || sys.dbms_random.string('A',40) || ''';
BEGIN
  l_password  :=
        substr(l_salt, 8, 13)
    ||  sys.utl_raw.cast_to_raw(p_password)
    ||  substr(l_salt, 4, 10)
    ||  substr(l_salt, 22, 28)
    ||  sys.utl_raw.cast_to_raw(p_username)
    ||  substr(l_salt, 18, 26)
  ;
  l_password := sys.utl_raw.cast_to_raw(l_password);
  l_password := sys.dbms_obfuscation_toolkit.md5(input_string => l_password);
  RETURN l_password;
END "BLOG_PW_HASH";
';
end;
/