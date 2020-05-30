prompt --application/pages/page_groups
begin
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(8700188054171688)
,p_group_name=>'General'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(8697986188142973)
,p_group_name=>'Posts'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(20718112665951240)
,p_group_name=>'Tabs'
);
end;
/
