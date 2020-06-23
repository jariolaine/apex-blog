prompt --application/shared_components/logic/application_items
begin
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(6966805581190300)
,p_name=>'G_APP_DESC'
,p_protection_level=>'I'
,p_item_comment=>'Application description'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(6966581773188245)
,p_name=>'G_APP_NAME'
,p_protection_level=>'I'
,p_item_comment=>'Application name'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(24541154547469283)
,p_name=>'G_ARCHIVE_DATE_FORMAT'
,p_protection_level=>'I'
,p_item_comment=>'Archive date format. Used e.g. archive report.'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(6966958999192709)
,p_name=>'G_DATE_FORMAT'
,p_protection_level=>'I'
,p_item_comment=>'Date format used e.g. on reports'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(40620483198781581)
,p_name=>'G_LATEST_POSTS'
,p_protection_level=>'I'
,p_item_comment=>'Latest post display count'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(7029499271806601)
,p_name=>'G_POST_TITLE_DATE_FORMAT'
,p_protection_level=>'I'
,p_item_comment=>'Post title date format. Used e.g. in posts reports.'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(6967171655194779)
,p_name=>'G_SEARCH_ROWS'
,p_protection_level=>'I'
,p_item_comment=>'Search report rows to display per report page'
);
end;
/
