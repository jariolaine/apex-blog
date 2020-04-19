CREATE OR REPLACE package  "BLOG_ERR"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Error handling
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 23.04.2019 - Created
--
--  TO DO: (search from body TODO#x)
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
  function apex_error_handler (
    p_error           in apex_error.t_error
  ) return apex_error.t_error_result;
--------------------------------------------------------------------------------
end "BLOG_ERR";

/


CREATE OR REPLACE package body "BLOG_ERR"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private variables and constants
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function apex_error_handler(
    p_error in apex_error.t_error
  ) return apex_error.t_error_result
  as
    l_genereric_error constant varchar2(255) := 'BLOG_GENERIC_ERROR';

    l_result          apex_error.t_error_result;
    l_reference_id    pls_integer;
    l_constraint_name varchar2(255);
    l_err_msg         varchar2(32700);

  begin

    -- This function must be used to ensure initialization is compatible
    -- with future changes to t_error_result.
    l_result :=
      apex_error.init_error_result(
        p_error => p_error
      );

    -- log error to application debug information
    apex_debug.error(
       p_message => 'Error id: %0 | session: %1 | user: %2 | %3 | %4 | %5 | %6 | %7 | %8 | %9'
      ,p0 => v('APP_SESSION')
      ,p1 => sys_context( 'APEX$SESSION', 'APP_SESSION' )
      ,p2 => sys_context( 'APEX$SESSION', 'APP_USER' )
      ,p3 => p_error.apex_error_code
      ,p4 => l_result.message
      ,p5 => l_result.additional_info
      ,p6 => p_error.ora_sqlcode
      ,p7 => p_error.ora_sqlerrm
      ,p8 => sqlcode
      ,p9 => apex_error.extract_constraint_name(
            p_error => p_error
          )
    );

    -- If it's an internal error raised by APEX, like an invalid statement or
    -- code which can't be executed, the error text might contain security sensitive
    -- information. To avoid this security problem we can rewrite the error to
    -- a generic error message and log the original error message for further
    -- investigation by the help desk.
    if p_error.is_internal_error then

      -- Access Denied errors raised by application or page authorization should
      -- still show up with the original error message as some others listed below
      /*
      if not p_error.apex_error_code like 'APEX.SESSION_STATE.%'
      and not p_error.apex_error_code = 'WWV_FLOW.FIND_ITEM_ID_ERR'
      and not p_error.apex_error_code = 'APEX.SESSION.EXPIRED'
      and not p_error.apex_error_code = 'APEX.PAGE.DUPLICATE_SUBMIT'
      and not p_error.apex_error_code = 'APEX.AUTHORIZATION.ACCESS_DENIED'
      and not p_error.apex_error_code = 'APEX.AJAX_SERVER_ERROR'
      --and not p_error.apex_error_code = 'APEX.SESSION_STATE.RESTRICTED_CHAR.WEB_SAFE'
      --and not p_error.apex_error_code = 'APEX.SESSION_STATE.RESTRICTED_CHAR.US_ONLY'
      then
      */
      if not p_error.is_common_runtime_error then

        -- Change the message to the generic error message which doesn't expose
        -- any sensitive information.

        l_result.message := apex_lang.message(l_genereric_error);
        l_result.additional_info := null;

      end if;

    else
      -- Always show the error as inline error
      -- Note: If you have created manual tabular forms (using the package
      --       apex_item/htmldb_item in the SQL statement) you should still
      --       use "On error page" on that pages to avoid loosing entered data

      l_result.display_location := case
        when l_result.display_location = apex_error.c_on_error_page
        then apex_error.c_inline_in_notification
        else l_result.display_location
        end
      ;

      -- If it's a constraint violation like
      --
      --   -) ORA-02292 ORA-02291 ORA-02290 ORA-02091 ORA-00001: unique constraint violated
      --   -) : transaction rolled back (-> can hide a deferred constraint)
      --   -) : check constraint violated
      --   -) : integrity constraint violated - parent key not found
      --   -) : integrity constraint violated - child record found
      --
      -- we try to get a friendly error message from our constraint lookup configuration.
      -- If we don't find the constraint in our lookup table we fallback to
      -- the original ORA error message.

      if p_error.ora_sqlcode in (-1, -2091, -2290, -2291, -2292) then

        l_constraint_name :=
          apex_error.extract_constraint_name(
            p_error => p_error
          );

        l_err_msg := apex_lang.message(l_constraint_name);

        -- not every constraint has to be in our lookup table
        if not l_err_msg = l_constraint_name then
          l_result.message := l_err_msg;
          l_result.additional_info := null;
        end if;

      end if;

      -- If an ORA error has been raised, for example a raise_application_error(-20xxx, '...')
      -- in a table trigger or in a PL/SQL package called by a process and we
      -- haven't found the error in our lookup table, then we just want to see
      -- the actual error text and not the full error stack with all the ORA error numbers.
      if p_error.ora_sqlcode is not null
      and l_result.message = p_error.message
      then

        l_result.message :=
          apex_error.get_first_ora_error_text (
            p_error => p_error
          );

      end if;

      -- If no associated page item/tabular form column has been set, we can use
      -- apex_error.auto_set_associated_item to automatically guess the affected
      -- error field by examine the ORA error for constraint names or column names.
      if l_result.page_item_name is null
      and l_result.column_alias is null then

        apex_error.auto_set_associated_item (
           p_error => p_error
          ,p_error_result => l_result
        );

      end if;

    end if;

    return l_result;

  end apex_error_handler;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_ERR";

/
