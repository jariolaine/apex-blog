CREATE OR REPLACE package "BLOG_AUTH" 
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Authentication and authorization
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 23.04.2019 - Created
--
--  TO DO: (search from body TODO#x)
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
  function login(
    p_username  in varchar2,
    p_password  in varchar2
  ) return boolean;
--------------------------------------------------------------------------------
  function get_blogger_id(
    p_username  in varchar2
  ) return number;
--------------------------------------------------------------------------------
  function check_password(
    p_id        in number,
    p_username  in varchar2,
    p_password  in varchar2
  ) return boolean;
--------------------------------------------------------------------------------
  procedure set_password (
    p_id            in number,
    p_username      in varchar2,
    p_old_password  in varchar2,
    p_new_password  in varchar2
  );
--------------------------------------------------------------------------------
end "BLOG_AUTH";
/


CREATE OR REPLACE PACKAGE BODY "BLOG_AUTH" 
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------  

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------  
  function pw_hash (
    p_id        in number,
    p_username  in varchar2,
    p_password  in varchar2
  ) return varchar2
  as
  -- This function should be wrapped, as the hash algorhythm for password is exposed.
    l_password varchar2(4000);
  begin
    l_password := apex_util.get_hash(
      apex_t_varchar2 (
         p_password
        ,p_username
        ,p_id
      )
      ,false
    );
    return l_password;
  end pw_hash;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------  
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function login(
    p_username in varchar2,
    p_password in varchar2
  ) return boolean
  as
  
    l_id number;
  
    auth_success            constant integer      := 0;
    auth_unknown_user       constant integer      := 1;
    auth_account_locked     constant integer      := 2;
    auth_account_expired    constant integer      := 3;
    auth_password_incorrect constant integer      := 4;
    auth_password_first_use constant integer      := 5;
    auth_attempts_exceeded  constant integer      := 6;
    auth_internal_error     constant integer      := 7;
    
  begin
    -- First, check to see if the user is in the user table and have password
    l_id := blog_auth.get_blogger_id( p_username );
    if l_id is null
    then 
      -- if user not exists set authentication status and return false
      apex_util.set_authentication_result(auth_unknown_user);
      return false;
    end if;
    -- user exists. check if password is valid
    if
      blog_auth.check_password(
         p_id       => l_id
        ,p_username => p_username
        ,p_password => p_password
      )
    then
      -- password is valid. set authentication status and return true 
      apex_util.set_authentication_result(auth_success);
      return true;
    end if;
    -- password is not valid. set authentication status and return false
    apex_util.set_authentication_result(auth_password_incorrect);
    return false;
  end login;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_blogger_id(
    p_username  in varchar2
  ) return number
  as
    l_id number;
  begin
    -- get blogger id
    select id
      into l_id
      from blog_bloggers
     where username = p_username
    ;
    return l_id;
  end get_blogger_id;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function check_password(
    p_id        in number,
    p_username  in varchar2,
    p_password  in varchar2
  ) return boolean
  as
    l_password        varchar2(4000);
    l_stored_password varchar2(4000);
  begin
    -- First, check to see if the user is in the user table and have password
    begin
      select passwd
      into l_stored_password
      from blog_bloggers
      where 1 = 1
      and username = p_username
      and id = p_id
      ;
    exception when no_data_found then
      return false;
    end;
    -- Apply the custom hash function to the password
    l_password := pw_hash( p_id, p_username, p_password );
    -- Compare them to see if they are the same and return either TRUE or FALSE
    if l_password = l_stored_password then
      return true;
    end if;
    return false;
  end check_password;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure set_password (
    p_id            in number,
    p_username      in varchar2,
    p_old_password  in varchar2,
    p_new_password  in varchar2
  )
  as
    l_old_passwd varchar2(4000);
    l_new_passwd varchar2(4000);
  begin
    l_old_passwd := pw_hash( p_id, p_username, p_old_password );
    l_new_passwd := pw_hash( p_id, p_username, p_new_password );
    -- update password if it changed
    for c1 in(
      select id
      from blog_bloggers
      where 1 = 1
      and id = p_id 
      and username = p_username
      and passwd = l_old_passwd
      and passwd != l_new_passwd
    ) loop
      update blog_bloggers
      set passwd = l_new_passwd
      where id = c1.id
      ;
    end loop;
  end set_password;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_AUTH";
/
