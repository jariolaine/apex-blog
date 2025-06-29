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
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure set_lang_ai(
    p_compartment_id  in varchar2,
    p_base_url        in varchar2,
    p_build_status    in varchar2
  );
--------------------------------------------------------------------------------
  procedure set_gen_ai(
    p_build_status    in varchar2
  );
--------------------------------------------------------------------------------
  procedure gen_ai_chat(
    p_post            in varchar2,
    p_system_prompt   in varchar2
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


create or replace package body "BLOG_AI"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

  type str_t is table of varchar2( 2000 ) index by varchar2( 60 );
  param_t str_t;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure init_params
  as
  begin

    -- set valus for session
    param_t( 'lang_ai_build_option' ) := 'BLOG_FEATURE_LANGUAGE_AI';
    param_t( 'lang_ai_static_id' ) := 'BLOG_LANGUAGE_AI';
    param_t( 'lang_ai_compartment_param_name') := 'G_OCI_LANG_AI_COMPARTMENT_OCID';
    param_t( 'lang_ai_compartment_ocid' ) := blog_util.get_attribute_value( param_t( 'lang_ai_compartment_param_name' ) );
    param_t( 'gen_ai_static_id' ) := 'BLOG_OPEN_AI_API';
    param_t( 'gen_ai_build_option' ) := 'BLOG_FEATURE_GENERATIVE_AI';
    param_t( 'gen_ai_generate_prompt' ) := apex_lang.get_message( 'BLOG_AI_GENERATE_PROMPT' );
    param_t( 'gen_ai_generate_msg' ) := 'BLOG_AI_GENERATE_MESSAGE';

    -- Debug parameters
    apex_debug.info( 'Language AI build option name: %s', param_t( 'lang_ai_build_option' ) );
    apex_debug.info( 'Language AI remote server static id: %s', param_t( 'lang_ai_static_id' ) );
    apex_debug.info( 'Language AI comparment parameter name : %s', param_t( 'lang_ai_compartment_param_name' ) );
    apex_debug.info( 'Language AI comparment OCID : %s', param_t( 'lang_ai_compartment_ocid') );
    apex_debug.info( 'Generative AI service static id: %s', param_t( 'gen_ai_static_id' ) );
    apex_debug.info( 'Generative AI build option name: %s', param_t( 'gen_ai_build_option' ) );
    apex_debug.info( 'Generative AI generate prompt: %s', param_t( 'gen_ai_generate_prompt' ) );
    apex_debug.info( 'Generative AI generate message: %s', param_t( 'gen_ai_generate_msg' ) );

  end init_params;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure get_sentiments
  as
    l_compartnet_id varchar2(256);
    l_document      clob;
    l_params        apex_exec.t_parameters;
  begin

    -- Loop through comments that have not yet been analyzed
    for c1 in (
      with q1 as(
        select
          id
        , v1.body_html
        , mod( rownum, floor( count(1) over() / 5 ) ) as batch_group
        from blog_v_all_comments v1
        where 1 = 1
          and sentiment is null
      )
      select
        json_arrayagg(
          json_object(
            'key'   is blog_util.int_to_vc2( q1.id ),
            'text'  is blog_comm.plain_text( q1.body_html )
          ) returning clob
        ) as document
      from q1
      group by
        q1.batch_group
    ) loop

      -- Set attributes for the language AI request
      apex_exec.add_parameter( l_params, 'compartmentId', param_t( 'lang_ai_compartment_ocid') );
      apex_exec.add_parameter( l_params, 'documents', c1.document );
      apex_exec.add_parameter( l_params, 'level', 'SENTENCE' );
      apex_exec.add_parameter( l_params, 'languageCode', 'en' );
      apex_exec.add_parameter( l_params, 'batchDocumentService', 'batchDetectLanguageSentiments' );

      -- Call language AI to analyze sentiment
      apex_exec.execute_rest_source(
        p_static_id           => param_t( 'lang_ai_module_static_id' ),
        p_operation_static_id => 'batch_document',
        p_parameters          => l_params
      );

      -- Retrieve response body
      l_document := apex_exec.get_parameter_clob( l_params, 'response_body' );

      -- Insert response JSON into the database
      merge_sentiment(
        p_language  => 'en'
      , p_documents => l_document
      );

      dbms_session.sleep( 1 );

    end loop;

  end get_sentiments;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure set_lang_ai(
    p_compartment_id  in varchar2,
    p_base_url        in varchar2,
    p_build_status    in varchar2
  )
  as
    l_attributes apex_t_varchar2;
  begin

    apex_debug.info( 'Set buid option %s status: %s', param_t( 'lang_ai_build_option' ), p_build_status );
    -- Set build option status for the language AI feature
    blog_cm.update_feature(
      p_build_option_name => param_t( 'lang_ai_build_option' )
    , p_build_status      => p_build_status
    );

    apex_debug.info( 'Set remote server %s: %s', param_t( 'lang_ai_static_id' ), rtrim( p_base_url, '/' ) || '/' );
    -- Set remote server URL
    apex_application_admin.set_remote_server(
      p_static_id => param_t( 'lang_ai_static_id' )
    , p_base_url  => rtrim( p_base_url, '/' ) || '/'
    );

    if p_build_status = apex_application_admin.c_build_option_status_include then
      apex_debug.info( 'Set compartment OCID: %s', p_compartment_id );
      -- Set attribute name and value
      apex_string.plist_push( l_attributes, param_t( 'lang_ai_compartment_param_name' ), p_compartment_id );
      -- Update attribute
      blog_cm.set_attribute_value(
        p_attribute_list => l_attributes
      );
    end if;

  end set_lang_ai;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure set_gen_ai(
    p_build_status in varchar2
  )
  as
    l_attributes apex_t_varchar2;
  begin
    apex_debug.info( 'Set buid option %s status: %s', param_t( 'gen_ai_build_option' ), p_build_status );
    -- Set build option status for the generative AI feature
    blog_cm.update_feature(
      p_build_option_name => param_t( 'gen_ai_build_option' )
    , p_build_status      => p_build_status
    );
  end set_gen_ai;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure gen_ai_chat(
    p_post          in varchar2,
    p_system_prompt in varchar2
  )
  as
    l_messages  apex_ai.t_chat_messages := apex_ai.c_chat_messages;
    l_response  clob;
  begin

    -- Prepare user message for AI chat
    l_messages(1).chat_role := 'user';
    l_messages(1).message :=
      apex_lang.get_message(
        p_name    => param_t( 'gen_ai_generate_msg' )
      , p_params  =>
          apex_t_varchar2 (
            'post'
          , substr( apex_escape.striphtml( p_post ), 1, 32000 )
          )
      )
    ;

    -- Generate AI response using AI service
    l_response :=
      apex_ai.chat(
        p_service_static_id => param_t( 'gen_ai_static_id' )
      , p_messages          => l_messages
      , p_prompt            => param_t( 'gen_ai_generate_prompt' )
      , p_system_prompt     =>
          apex_lang.get_message(
            p_name => p_system_prompt
          )
      );

    apex_debug.info( 'AI generated content: %s', l_response );

    -- Write HTTP JSON header and response
    apex_plugin_util.print_json_http_header;
    apex_json.open_object;
    apex_json.write( 'response', l_response );
    apex_json.close_all;

  end gen_ai_chat;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure merge_sentiment(
    p_language  in varchar2,
    p_documents in clob
  )
  as
    l_comment_id      number;
    l_sentiment_json  varchar2(32700);
    l_json_documents  json_array_t;
    l_json_document   json_object_t;
  begin

    apex_debug.info( 'Input JSON document: %s', p_documents );

    -- Parse JSON document
    l_json_document := json_object_t.parse( p_documents );
    -- Retrieve the "documents" array
    l_json_documents := l_json_document.get_array( 'documents' );

    -- Loop through each document in the array
    for i in 0 .. l_json_documents.get_size() - 1 loop
      -- Extract document details
      l_json_document := json_object_t( l_json_documents.get(i) );
      l_comment_id := to_number( l_json_document.get_string( 'key' ) );
      l_sentiment_json := l_json_document.stringify();

      -- Merge sentiment data into the database
      merge into blog_comment_sentiments t1
      using dual on ( t1.comment_id = l_comment_id )
      when not matched then
        insert( comment_id, original_language, sentiment_json )
        values( l_comment_id, p_language, l_sentiment_json )
      when matched then
        update set sentiment_json = l_sentiment_json;
    end loop;

  end merge_sentiment;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure get_lang_code(
    p_documents in clob,
    p_lang_code out nocopy varchar2
  )
  as
    l_temp_score      number;
    l_score           number := -999;
    l_json_documents  json_array_t;
    l_json_document   json_object_t;
  begin

    apex_debug.info( 'Input JSON document: %s', p_documents );

    p_lang_code := 'en'; -- Default language code

    -- Parse JSON document
    l_json_document := json_object_t.parse( p_documents );
    -- Retrieve the "documents" array
    l_json_documents := l_json_document.get_array( 'documents' );
    -- Extract the first document
    l_json_document := json_object_t( l_json_documents.get(0) );
    -- Retrieve the "languages" array
    l_json_documents := l_json_document.get_array( 'languages' );

    -- Loop through languages to find the highest score
    for i in 0 .. l_json_documents.get_size() - 1 loop
      l_json_document := json_object_t( l_json_documents.get(i) );
      l_temp_score := l_json_document.get_number( 'score' );
      if l_temp_score > l_score then
        l_score := l_temp_score;
        p_lang_code := l_json_document.get_string( 'code' );
      end if;
    end loop;

  end get_lang_code;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure get_translation(
    p_documents   in clob,
    p_translation out nocopy clob
  )
  as
    l_json_documents  json_array_t;
    l_json_document   json_object_t;
  begin

    apex_debug.info( 'Input JSON: %s', p_documents );

    -- Parse JSON document
    l_json_document := json_object_t.parse( p_documents );
    -- Retrieve the "documents" array
    l_json_documents := l_json_document.get_array( 'documents' );
    -- Extract the translated text from the first document
    l_json_document := json_object_t( l_json_documents.get(0) );
    p_translation := l_json_document.get_string( 'translatedText' );

  end get_translation;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Package initialization
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
begin
  -- initialize parameters
  apex_debug.info( '----- Initialize package BLOG_AI -----' );
  init_params;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_AI";
/
