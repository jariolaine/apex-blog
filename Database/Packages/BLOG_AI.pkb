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
    param_t( 'lang_ai_static_id' ) := 'BLOG_LANGUAGE_AI';
    param_t( 'gen_ai_static_id' ) := 'BLOG_OPEN_AI_API';
    param_t( 'gen_ai_credential_static_id' ) := 'BLOG_OPEN_AI_API_KEY';
    param_t( 'lang_ai_build_option' ) := 'BLOG_FEATURE_LANGUAGE_AI';
    param_t( 'gen_ai_build_option' ) := 'BLOG_FEATURE_GENERATIVE_AI';
    param_t( 'lang_ai_compartment_param_name') := 'G_OCI_LANG_AI_COMPARTMENT_OCID';

    -- Debug parameters
    apex_debug.info( 'Language AI remote server static id: %s', param_t( 'lang_ai_static_id' ) );
    apex_debug.info( 'Generative AI service static id: %s', param_t( 'gen_ai_static_id' ) );
    apex_debug.info( 'Generative AI credential static id: %s', param_t( 'gen_ai_credential_static_id' ) );
    apex_debug.info( 'Language AI build option name: %s', param_t( 'lang_ai_build_option' ) );
    apex_debug.info( 'Generative AI build option name: %s', param_t( 'gen_ai_build_option' ) );
    apex_debug.info( 'Language AI compartment parameter name : %s', param_t( 'lang_ai_compartment_param_name' ) );

  end init_params;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_param_value(
    p_param_name in varchar2
  ) return varchar2
  as
  begin
    return param_t( p_param_name );
  end get_param_value;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure set_lang_ai(
    p_compartment_id  in varchar2,
    p_base_url        in varchar2,
    p_build_status    in varchar2
  )
  as
    l_attributes  apex_t_varchar2;
    l_base_url    varchar2(2000);
  begin

    apex_debug.info( 'Set build option %s status: %s', param_t( 'lang_ai_build_option' ), p_build_status );
    -- Set build option status for the language AI feature
    blog_admin.update_feature(
      p_build_option_name => param_t( 'lang_ai_build_option' )
    , p_build_status      => p_build_status
    );

    -- If build option status is INCLUDE
    if p_build_status = apex_application_admin.c_build_option_status_include
    then

      apex_debug.info( 'Set compartment OCID: %s', p_compartment_id );
      -- Set attribute name and value
      apex_string.plist_push( l_attributes, param_t( 'lang_ai_compartment_param_name' ), p_compartment_id );

      -- Update attribute
      blog_admin.set_attribute_value(
        p_attribute_list => l_attributes
      );

      l_base_url := rtrim( p_base_url, '/' ) || '/';

      apex_debug.info( 'Set remote server %s: %s', param_t( 'lang_ai_static_id' ), l_base_url );
      -- Set remote server URL
      apex_application_admin.set_remote_server(
        p_static_id => param_t( 'lang_ai_static_id' )
      , p_base_url  => l_base_url
      );

    end if;

  end set_lang_ai;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure set_gen_ai(
    p_build_status    in varchar2,
    p_api_key         in varchar2,
    p_base_url        in varchar2,
    p_ai_model_name   in varchar2,
    p_ai_http_headers in varchar2,
    p_ai_attributes   in varchar2
  )
  as
    l_base_url varchar2(2000);
  begin

    apex_debug.info( 'Set build option %s status: %s', param_t( 'gen_ai_build_option' ), p_build_status );
    -- Set build option status for the generative AI feature
    blog_admin.update_feature(
      p_build_option_name => param_t( 'gen_ai_build_option' )
    , p_build_status      => p_build_status
    );

    if p_build_status = apex_application_admin.c_build_option_status_include
    then
      -- Update credential if new API key is provided
      if p_api_key is not null
      then
        apex_credential.set_persistent_credentials(
          p_credential_static_id  => param_t( 'gen_ai_credential_static_id' )
        , p_key   => 'Authorization'
        , p_value =>
            apex_string.format(
              p_message => 'Bearer %s'
            , p0 => p_api_key
            )
        );
      end if;

      l_base_url := rtrim( p_base_url, '/' ) || '/';
      -- Update remote server
      apex_application_admin.set_remote_server(
        p_static_id       => param_t( 'gen_ai_static_id' )
      , p_base_url        => l_base_url
      , p_ai_model_name   => p_ai_model_name
      , p_ai_http_headers => p_ai_http_headers
      , p_ai_attributes   => p_ai_attributes
      );

    end if;

  end set_gen_ai;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure merge_sentiment(
    p_language  in varchar2,
    p_documents in clob
  )
  as
    l_comment_id      number;
    l_comment_id_str  varchar2( 2000 );
    l_sentiment_json  clob;
    l_json_documents  json_array_t;
    l_json_document   json_object_t;

    fk_check_failed   exception;
    pragma exception_init( fk_check_failed, -2291 );
  begin

    apex_debug.debug( 'Input JSON document: %s', p_documents );

    -- Skip when response payload is missing
    if p_documents is null
    then
      apex_debug.warn( 'Input JSON document is null, nothing to merge' );
      return;
    end if;

    -- Parse JSON document
    l_json_document := json_object_t.parse( p_documents );

    -- Skip when parsed payload has no documents array
    if not l_json_document.has( 'documents' )
    then
      apex_debug.warn( 'JSON document has no documents, nothing to merge' );
      return;
    end if;

    -- Retrieve the "documents" array
    l_json_documents := l_json_document.get_array( 'documents' );

    -- Loop through each document in the array
    for i in 0 .. l_json_documents.get_size() - 1 loop

      l_json_document := json_object_t( l_json_documents.get(i) );

      -- Extract document key (comment id) and skip when it is missing or not an integer
      l_comment_id_str :=
        case
          when l_json_document.has( 'key' )
            then l_json_document.get_string( 'key' )
        end;

      if l_comment_id_str is null
      or not regexp_like( l_comment_id_str, '^[0-9]+$' )
      then
        apex_debug.warn(
          p_message => 'Skip sentiment analyze result at position %s, invalid comment key'
        , p1        => blog_util.int_to_vc2( i )
        );
        continue;
      end if;

      l_comment_id := to_number( l_comment_id_str );
      l_sentiment_json := l_json_document.stringify();

      -- Merge sentiment data into the database. The comment may have been
      -- deleted after the analyze call, so only apply while it still exists
      begin
        merge into blog_comment_sentiments t1
        using (
          select l_comment_id as comment_id
            from dual
           where exists (
             select 1
               from blog_comments c
              where c.id = l_comment_id
           )
        ) src
        on ( t1.comment_id = src.comment_id )
        when not matched then
          insert( comment_id, original_language, sentiment_json )
          values( src.comment_id, p_language, l_sentiment_json )
        when matched then
          update set sentiment_json = l_sentiment_json
        ;
      -- skip rows changed concurrently after the existence check
      exception
        when dup_val_on_index then
          apex_debug.warn(
            p_message => 'Skip sentiment analyze result at position %s, comment %s changed concurrently'
          , p1        => blog_util.int_to_vc2( i )
          , p2        => blog_util.int_to_vc2( l_comment_id )
          );
        when fk_check_failed then
          apex_debug.warn(
            p_message => 'Skip sentiment analyze result at position %s, comment %s no longer exists'
          , p1        => blog_util.int_to_vc2( i )
          , p2        => blog_util.int_to_vc2( l_comment_id )
          );
      end;

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
    l_languages       json_array_t;
    l_json_documents  json_array_t;
    l_json_document   json_object_t;
  begin

    apex_debug.debug( 'Input JSON document: %s', p_documents );

    p_lang_code := 'en'; -- Default language code

    -- Keep default language code when response payload is missing
    if p_documents is null
    then
      apex_debug.warn( 'Input JSON document is null, defaulting to en' );
      return;
    end if;

    -- Parse JSON document
    l_json_document := json_object_t.parse( p_documents );

    -- Keep default language code when parsed payload has no documents array
    if not l_json_document.has( 'documents' )
    then
      apex_debug.warn( 'JSON document has no documents, defaulting to en' );
      return;
    end if;

    -- Retrieve the "documents" array
    l_json_documents := l_json_document.get_array( 'documents' );

    if l_json_documents.get_size() = 0
    then
      apex_debug.warn( 'No languages detected in response, defaulting to en' );
      return;
    end if;

    -- Extract the first document
    l_json_document := json_object_t( l_json_documents.get(0) );

    -- Keep default language code when document has no languages array
    if not l_json_document.has( 'languages' )
    then
      apex_debug.warn( 'Document has no languages, defaulting to en' );
      return;
    end if;

    -- Retrieve the "languages" array
    l_languages := l_json_document.get_array( 'languages' );

    -- Loop through languages to find the highest score
    for i in 0 .. l_languages.get_size() - 1 loop

      l_json_document := json_object_t( l_languages.get(i) );

      -- Skip language when code or score is missing
      if not ( l_json_document.has( 'code' ) and l_json_document.has( 'score' ) )
      then
        apex_debug.warn(
          p_message => 'Skip language entry at position %s, missing code or score'
        , p1        => blog_util.int_to_vc2( i )
        );
        continue;
      end if;

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

    apex_debug.debug( 'Input JSON: %s', p_documents );

    p_translation := null; -- Default no translation

    -- Keep translation null when response payload is missing
    if p_documents is null
    then
      apex_debug.warn( 'Input JSON document is null, no translation available' );
      return;
    end if;

    -- Parse JSON document
    l_json_document := json_object_t.parse( p_documents );

    -- Keep translation null when parsed payload has no documents array
    if not l_json_document.has( 'documents' )
    then
      apex_debug.warn( 'JSON document has no documents, no translation available' );
      return;
    end if;

    -- Retrieve the "documents" array
    l_json_documents := l_json_document.get_array( 'documents' );

    if l_json_documents.get_size() = 0 then
      apex_debug.warn( 'Response has no translated text' );
      return;
    end if;

    -- Extract the first document
    l_json_document := json_object_t( l_json_documents.get(0) );

    -- Keep translation null when document has no translated text
    if not l_json_document.has( 'translatedText' )
    then
      apex_debug.warn( 'Document has no translated text' );
      return;
    end if;

    -- Extract the translated text
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
