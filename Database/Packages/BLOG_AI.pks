create or replace package "BLOG_AI"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION
--    Procedures and functions for AI-related functionalities
--
--  CHANGE LOG
--  ============================================================================
--  DATE         MODIFIED BY    DESCRIPTION
--  -----------  -------------  ------------------------------------------------
--  15.08.2025   Jari Laine     Created package.
--  30.06.2025   Jari Laine     New function get_param_value
--                              Changes to procedures:
--                                - set_gen_ai
--                                - init_params
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_param_value(
    p_param_name      in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  procedure set_lang_ai(
    p_compartment_id  in varchar2,
    p_base_url        in varchar2,
    p_build_status    in varchar2
  );
--------------------------------------------------------------------------------
  procedure set_gen_ai(
    p_build_status    in varchar2,
    p_api_key         in varchar2,
    p_base_url        in varchar2,
    p_ai_model_name   in varchar2,
    p_ai_http_headers in varchar2,
    p_ai_attributes   in varchar2
  );
--------------------------------------------------------------------------------
-- Called from:
--  Public app page 1001 and admin app 62
  procedure merge_sentiment(
    p_language        in varchar2,
    p_documents       in clob
  );
--------------------------------------------------------------------------------
  procedure get_lang_code(
    p_documents       in clob,
    p_lang_code       out nocopy varchar2
  );
--------------------------------------------------------------------------------
  procedure get_translation(
    p_documents       in clob,
    p_translation     out nocopy clob
  );
--------------------------------------------------------------------------------
end "BLOG_AI";
/
