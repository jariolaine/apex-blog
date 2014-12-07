CREATE OR REPLACE FUNCTION  "BLOG_SGID" RETURN NUMBER AS 
BEGIN
  RETURN TO_NUMBER(TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') || LPAD(blog_seq.nextval,4,0));
END "BLOG_SGID";
/
CREATE OR REPLACE FUNCTION  "BLOG_PW_HASH" (
  p_username IN VARCHAR2,
  p_password IN VARCHAR2
) RETURN VARCHAR2
AUTHID DEFINER
AS
/* This function should be wrapped, as the hash algorhythm for password is exposed. */
  l_password VARCHAR2(4000);
  l_salt     VARCHAR2(255) := 'EVQELZY27PVLWPHMRN8B0CRRMAXBR8';
BEGIN
  l_password  :=
        SUBSTR(l_salt, 8, 13)
    ||  p_password
    ||  SUBSTR(l_salt, 4, 10)
	||  SUBSTR(l_salt, 22, 28)
    ||  p_username
    ||  SUBSTR(l_salt, 18, 26)
  ;
  l_password := utl_raw.cast_to_raw(l_password);
  l_password := dbms_obfuscation_toolkit.md5(input_string => l_password);
  RETURN l_password;
END "BLOG_PW_HASH";
/
