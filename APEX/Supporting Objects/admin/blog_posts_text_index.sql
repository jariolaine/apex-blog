--------------------------------------------------------
--  Create text index preferences
--------------------------------------------------------
declare
  l_schema varchar2(256);
begin

  l_schema := sys_context( 'USERENV', 'CURRENT_SCHEMA' );

  ctx_ddl.create_preference(
     preference_name  => 'BLOG_POST_UDS_DS'
    ,object_name      => 'USER_DATASTORE'
  );

  ctx_ddl.set_attribute(
    preference_name   => 'BLOG_POST_UDS_DS'
    ,attribute_name   => 'PROCEDURE'
    ,attribute_value  => l_schema || '.BLOG_CTX.GENERATE_POST_DATASTORE'
  );

  ctx_ddl.set_attribute(
    preference_name   => 'BLOG_POST_UDS_DS'
    ,attribute_name   => 'OUTPUT_TYPE'
    ,attribute_value  => 'CLOB'
  );

  ctx_ddl.create_section_group(
    group_name        => 'BLOG_POST_UDS_SG'
    ,group_type       => 'XML_SECTION_GROUP'
  );

  ctx_ddl.add_field_section(
    group_name        => 'BLOG_POST_UDS_SG'
    ,section_name     => 'TITLE'
    ,tag              => 'POST_TITLE'
    ,visible          => true
  );

  ctx_ddl.add_field_section(
    group_name        => 'BLOG_POST_UDS_SG'
    ,section_name     => 'CATEGORY'
    ,tag              => 'POST_CATEGORY'
    ,visible          => true
  );

  ctx_ddl.add_field_section(
    group_name        => 'BLOG_POST_UDS_SG'
    ,section_name     => 'DESCRIPTION'
    ,tag              => 'POST_DESCRIPTION'
    ,visible          => true
  );

  ctx_ddl.add_field_section(
    group_name        => 'BLOG_POST_UDS_SG'
    ,section_name     => 'BODY'
    ,tag              => 'POST_BODY'
    ,visible          => true
  );

  ctx_ddl.add_field_section(
    group_name        => 'BLOG_POST_UDS_SG'
    ,section_name     => 'TAGS'
    ,tag              => 'POST_TAGS'
    ,visible          => true
  );


  ctx_ddl.create_preference(
    preference_name   => 'BLOG_POST_UDS_LX'
    ,object_name      => 'BASIC_LEXER'
  );

  ctx_ddl.set_attribute(
    preference_name   => 'BLOG_POST_UDS_LX'
    ,attribute_name   => 'MIXED_CASE'
    ,attribute_value  => 'NO'
  );

  ctx_ddl.set_attribute(
    preference_name   => 'BLOG_POST_UDS_LX'
    ,attribute_name   => 'BASE_LETTER'
    ,attribute_value  => 'YES'
  );

  ctx_ddl.set_attribute(
    preference_name   => 'BLOG_POST_UDS_LX'
    ,attribute_name   => 'BASE_LETTER_TYPE'
    ,attribute_value  => 'GENERIC'
  );

end;
/

--------------------------------------------------------
--  Create text index
--------------------------------------------------------
create index blog_post_uds_ctx on blog_post_uds (dummy)
indextype is ctxsys.context parameters (
  'section group  BLOG_POST_UDS_SG
   datastore      BLOG_POST_UDS_DS
   lexer          BLOG_POST_UDS_LX
   stoplist       ctxsys.empty_stoplist
   sync           (on commit)'
);
