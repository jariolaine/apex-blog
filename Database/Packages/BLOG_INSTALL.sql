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


create or replace package body "BLOG_INSTALL"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
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
  )
  as
  begin

    merge into blog_settings
    using dual
    on( attribute_name = p_attribute_name )
    when not matched then
      insert ( attribute_name, display_seq, is_nullable, data_type, attribute_group_message, int_min, int_max, build_option_name, build_option_status, attribute_value )
        values( p_attribute_name, p_display_seq, p_is_nullable, p_data_type, p_attribute_group_message, p_int_min, p_int_max, p_build_option_name, p_build_option_status, p_attribute_value )
    when matched then
      update set
        display_seq = p_display_seq
      , is_nullable = p_is_nullable
      , data_type = p_data_type
      , attribute_group_message = p_attribute_group_message
      , int_min = p_int_min
      , int_max = p_int_max
      , build_option_name = p_build_option_name
      , build_option_status = p_build_option_status
    ;

  end settings_merge;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure features_merge(
    p_build_option_name       in varchar2,
    p_is_active               in number,
    p_display_seq             in number,
    p_build_option_group      in varchar2,
    p_build_option_parent     in varchar2 default null,
    p_ref_build_option_name   in varchar2 default null,
    p_ref_build_option_status in varchar2 default null
  )
  as
  begin

    merge into blog_features
    using dual
    on( build_option_name = p_build_option_name )
    when not matched then
      insert ( build_option_name, is_active, display_seq, build_option_group, build_option_parent, ref_build_option_name, ref_build_option_status )
        values( p_build_option_name, p_is_active, p_display_seq, p_build_option_group, p_build_option_parent, p_ref_build_option_name, p_ref_build_option_status )
    when matched then
      update set
        is_active = p_is_active
      , display_seq = p_display_seq
      , build_option_group = p_build_option_group
      , build_option_parent = p_build_option_parent
      , ref_build_option_name = p_ref_build_option_name
      , ref_build_option_status = p_ref_build_option_status
    ;

  end features_merge;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure list_of_values_ins(
    p_is_active       in number,
    p_display_seq     in number,
    p_lov_name        in varchar2,
    p_return_value    in varchar2,
    p_display_message in varchar2
  )
  as
  begin

    insert into blog_list_of_values( is_active, display_seq, lov_name, return_value, display_message )
      values( p_is_active, p_display_seq, p_lov_name, p_return_value, p_display_message )
    ;

  end list_of_values_ins;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure init_items_ins
  as
  begin

    insert into blog_init_items(is_active, application_id, item_name)
    select
      1                 as is_active
    , ai.application_id as application_id
    , ai.item_name      as item_name
    from apex_application_items ai
    join blog_settings s
      on ai.item_name = s.attribute_name
    where 1 = 1
      and exists(
        select 1
        from blog_settings x1
        where 1 = 1
          and x1.attribute_name in( 'G_ADMIN_APP_ID', 'G_PUB_APP_ID' )
          and to_number( x1.attribute_value ) = ai.application_id
      )
    union all
    select
      1                 as is_active
    , pi.application_id as application_id
    , pi.item_name      as item_name
    from apex_application_page_items pi
    join blog_settings s
      on pi.item_name = s.attribute_name
    where 1 = 1
      and exists(
        select 1
        from blog_settings x1
        where 1 = 1
          and x1.attribute_name in( 'G_ADMIN_APP_ID', 'G_PUB_APP_ID' )
          and to_number( x1.attribute_value ) = pi.application_id
      )
    order by 2, 3
    ;

  end init_items_ins;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_INSTALL";
/
