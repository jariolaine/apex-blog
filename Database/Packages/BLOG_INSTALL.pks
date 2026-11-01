create or replace package "BLOG_INSTALL"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--  DESCRIPTION
--    Procedures and functions for application install
--
--  CHANGE LOG
--  ============================================================================
--  DATE         MODIFIED BY    DESCRIPTION
--  -----------  -------------  ------------------------------------------------
--  10.05.2025   Jari Laine     Created package.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure settings_merge(
    p_attribute_name          in varchar2,
    p_display_seq             in number,
    p_is_nullable             in number,
    p_data_type               in varchar2,
    p_attribute_group_message in varchar2,
    p_int_min                 in number   default null,
    p_int_max                 in number   default null,
    p_build_option_name       in varchar2 default null,
    p_build_option_status     in varchar2 default null,
    p_attribute_value         in varchar2 default null
  );
--------------------------------------------------------------------------------
  procedure features_merge(
    p_build_option_name       in varchar2,
    p_is_active               in number,
    p_display_seq             in number,
    p_build_option_group      in varchar2,
    p_build_option_parent     in varchar2 default null,
    p_ref_build_option_name   in varchar2 default null,
    p_ref_build_option_status in varchar2 default null
  );
--------------------------------------------------------------------------------
  procedure list_of_values_ins(
    p_is_active               in number,
    p_display_seq             in number,
    p_lov_name                in varchar2,
    p_return_value            in varchar2,
    p_display_message         in varchar2
  );
--------------------------------------------------------------------------------
  procedure init_items_ins;
--------------------------------------------------------------------------------
end "BLOG_INSTALL";
/
