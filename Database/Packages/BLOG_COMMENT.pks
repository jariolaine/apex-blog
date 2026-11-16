create or replace package "BLOG_COMMENT"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION
--    This package provides procedures and functions for managing post comments,
--    including functionality for replying, flagging, email validation, and HTML content processing.
--
--  ============================================================================
--  TO DO:
--  ============================================================================
--  #1 Improve HTML validation for comment content.
--  #2 Enhance email validation logic to handle edge cases.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function plain_text(
    p_string          in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function short_text(
    p_string          in varchar2,
    p_plain_text      in boolean default true,
    p_str_length      in number default 100
  ) return varchar2;
--------------------------------------------------------------------------------
  function format_comment(
    p_comment         in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function validate_comment(
    p_comment         in varchar2,
    p_max_length      in number default 4000
  ) return varchar2;
--------------------------------------------------------------------------------
  function is_email(
    p_email           in varchar2,
    p_err_mesg        in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure flag_comment(
    p_comment_id      in varchar2,
    p_flags           in varchar2
  );
--------------------------------------------------------------------------------
  procedure unflag_comment(
    p_comment_id      in varchar2,
    p_flags           in varchar2
  );
--------------------------------------------------------------------------------
  procedure new_comment_notify(
    p_post_id         in varchar2,
    p_app_name        in varchar2,
    p_email_template  in varchar2
  );
--------------------------------------------------------------------------------
  procedure reply_notify(
    p_app_id          in varchar2,
    p_app_name        in varchar2,
    p_post_id         in varchar2,
    p_email_template  in varchar2
  );
--------------------------------------------------------------------------------
  procedure subscribe(
    p_post_id         in varchar2,
    p_email           in varchar2
  );
--------------------------------------------------------------------------------
  procedure unsubscribe(
    p_subscription_id in varchar2
  );
--------------------------------------------------------------------------------
  procedure auto_approve(
    p_comment_id      in varchar2
  );
--------------------------------------------------------------------------------
end "BLOG_COMMENT";
/
