--------------------------------------------------------
--  DDL for Table BUILD_SETTINGS
--------------------------------------------------------
CREATE TABLE BUILD_SETTINGS(
  ATTRIBUTE_NAME VARCHAR2(256 CHAR) NOT NULL ENABLE,
	VALUE_SOURCE VARCHAR2(4000 BYTE) NOT NULL ENABLE,
	VALUE_TYPE VARCHAR2(32 BYTE) NOT NULL ENABLE
);

ALTER TABLE BUILD_SETTINGS ADD
  CONSTRAINT BUILD_SETTINGS_PK PRIMARY KEY (ATTRIBUTE_NAME)
;

--------------------------------------------------------
--  Insert to BUILD_SETTINGS
--------------------------------------------------------
SET DEFINE OFF;
Insert into BUILD_SETTINGS (ATTRIBUTE_NAME,VALUE_SOURCE,VALUE_TYPE) values ('P0_BLOG_POST_DATE_FORMAT','fmDay, Month DD, YYYY','STRING');
Insert into BUILD_SETTINGS (ATTRIBUTE_NAME,VALUE_SOURCE,VALUE_TYPE) values ('P0_BLOG_APP_DESC','About Almost Everything','STRING');
Insert into BUILD_SETTINGS (ATTRIBUTE_NAME,VALUE_SOURCE,VALUE_TYPE) values ('P0_BLOG_SEARCH_ROWS','10','STRING');
Insert into BUILD_SETTINGS (ATTRIBUTE_NAME,VALUE_SOURCE,VALUE_TYPE) values ('P1_BLOG_POST_ROWS','5','STRING');
Insert into BUILD_SETTINGS (ATTRIBUTE_NAME,VALUE_SOURCE,VALUE_TYPE) values ('P0_BLOG_APP_NAME','My Blog','STRING');
Insert into BUILD_SETTINGS (ATTRIBUTE_NAME,VALUE_SOURCE,VALUE_TYPE) values ('P2_BLOG_COMMENT_ROWS','10','STRING');
Insert into BUILD_SETTINGS (ATTRIBUTE_NAME,VALUE_SOURCE,VALUE_TYPE) values ('P0_BLOG_APP_DATE_FORMAT','fmDD Mon YYYY','STRING');
Insert into BUILD_SETTINGS (ATTRIBUTE_NAME,VALUE_SOURCE,VALUE_TYPE) values ('G_APP_VERSION','Provided explicitly by VERSION.txt','BUILD_PARAMETER');
Insert into BUILD_SETTINGS (ATTRIBUTE_NAME,VALUE_SOURCE,VALUE_TYPE) values ('G_LATEST_POST_ROWS','5','STRING');
Insert into BUILD_SETTINGS (ATTRIBUTE_NAME,VALUE_SOURCE,VALUE_TYPE) values ('G_COMMENT_WATCH_MONTHS','1','STRING');
Insert into BUILD_SETTINGS (ATTRIBUTE_NAME,VALUE_SOURCE,VALUE_TYPE) values ('G_PUB_APP_ID','blog_util.int_to_vc2(apex_application_install.get_application_id)','COLUMN_EXPRESSION');
Insert into BUILD_SETTINGS (ATTRIBUTE_NAME,VALUE_SOURCE,VALUE_TYPE) values ('G_ADMIN_APP_ID','blog_util.int_to_vc2(apex_application_install.get_application_id)','COLUMN_EXPRESSION');
Insert into BUILD_SETTINGS (ATTRIBUTE_NAME,VALUE_SOURCE,VALUE_TYPE) values ('G_MAX_AGE_RSS','3600','STRING');
Insert into BUILD_SETTINGS (ATTRIBUTE_NAME,VALUE_SOURCE,VALUE_TYPE) values ('G_MAX_AGE_DOWNLOAD','14400','STRING');
Insert into BUILD_SETTINGS (ATTRIBUTE_NAME,VALUE_SOURCE,VALUE_TYPE) values ('G_MAX_AGE_FILE','604800','STRING');
Insert into BUILD_SETTINGS (ATTRIBUTE_NAME,VALUE_SOURCE,VALUE_TYPE) values ('G_MAX_AGE_SITEMAP','3600','STRING');
Insert into BUILD_SETTINGS (ATTRIBUTE_NAME,VALUE_SOURCE,VALUE_TYPE) values ('G_MAX_AGE_RSS_XSL','604800','STRING');
Insert into BUILD_SETTINGS (ATTRIBUTE_NAME,VALUE_SOURCE,VALUE_TYPE) values ('README','# APEX Blog

![Oracle_Database 19c](https://img.shields.io/badge/Oracle_Database-19c-red)
![Oracle Application Express #APEX_VERSION#](https://img.shields.io/badge/APEX-#APEX_VERSION#-blue)

Blog application built with Oracle Application Express (APEX).

## Install

### System Requirements

* Oracle database version 19c or later
* Oracle Application Express version #APEX_VERSION# or later

### Needed Privileges

Ensure target schema associated to your APEX workspace has following system
privileges and roles:

- CREATE INDEXTYPE
- CREATE PROCEDURE
- CREATE SEQUENCE
- CREATE TABLE
- CREATE TRIGGER
- CREATE VIEW
- CTXAPP

APEX workspace administrator privileges are required to create a user group for
authorization.

### Download

Download [latest version](https://github.com/jariolaine/apex-blog/releases/latest/download/apex-blog-latest.zip)
and extract zip archive.

### Import Applications

1. Access your target APEX workspace
2. Select the Application Builder
3. Import and install *blog-administration-latest.sql* and select install
  supporting objects.
4. Import and install *blog-public-pages-latest.sql* and select install
  supporting objects.

### Post Install

Create a workspace user group named "Bloggers". Add APEX users to the group who
are authorized to use the blog admin application.

See how to create a workspace group in the APEX documentation
[*Using Groups to Manage Application Express Users*](https://docs.oracle.com/en/database/oracle/apex/#APEX_VERSION#/aeadm/managing-users-in-a-workspace.html#GUID-0FD7B406-8A83-40C0-A3E7-EF19BBDEA5A4).

## Upgrade

Existing application version must be Release v22.2.1.20230117 or later.

Before starting the upgrade, backup the application parsing schema data and
objects.

### Import Applications

1. Access your target APEX workspace
2. Select the Application Builder
3. Import and install *blog-administration-latest.sql* and select upgrade
   supporting objects.
4. Import and install *blog-public-pages-latest.sql* and select upgrade
   supporting objects.

## License

This code is released under [MIT license](LICENSE.txt) by Jari Laine.
','STRING');
Insert into BUILD_SETTINGS (ATTRIBUTE_NAME,VALUE_SOURCE,VALUE_TYPE) values ('LICENSE','The MIT License (MIT)

Copyright (c) 2021, #YEAR#, Jari Laine

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
','STRING');
Insert into BUILD_SETTINGS (ATTRIBUTE_NAME,VALUE_SOURCE,VALUE_TYPE) values ('MANIFEST','{
  "customApps": [{
    "internalName": "APEX_BLOG_ADMIN",
    "name": "APEX Blog Administration",
    "description": "Blog application administration pages.",
    "author": "Jari Laine",
    "version": "#APP_VERSION#",
    "icon": "https://raw.githubusercontent.com/jariolaine/apex-blog/master/Web_Server/icons/app-icon-192.png",
    "url": "https://github.com/jariolaine/apex-blog/tree/master",
    "source": "https://github.com/jariolaine/apex-blog/releases/latest/download/blog_administration-latest.sql",
    "zip": "https://github.com/jariolaine/apex-blog/releases/latest/download/blog_administration-latest.zip",
    "license": "https://raw.githubusercontent.com/jariolaine/apex-blog/master/LICENSE.txt"
  },
  {
    "internalName": "APEX_BLOG_PUBLIC",
    "name": "APEX Blog",
    "description": "Blog application public pages. Please install first APEX Blog Administration application.",
    "author": "Jari Laine",
    "version": "#APP_VERSION#",
    "icon": "https://raw.githubusercontent.com/jariolaine/apex-blog/master/Web_Server/icons/app-icon-192.png",
    "url": "https://github.com/jariolaine/apex-blog/tree/master",
    "source": "https://github.com/jariolaine/apex-blog/releases/latest/download/blog_public_pages-latest.sql",
    "zip": "https://github.com/jariolaine/apex-blog/releases/latest/download/blog_public_pages-latest.zip",
    "license": "https://raw.githubusercontent.com/jariolaine/apex-blog/master/LICENSE.txt"
  }]
}
','STRING');
Insert into BUILD_SETTINGS (ATTRIBUTE_NAME,VALUE_SOURCE,VALUE_TYPE) values ('POSTUPDATE_SQL','--  Postupgrade
-- Update version info
update blog_settings
  set attribute_value = ''#APP_VERSION#''
where 1 = 1
  and attribute_name = ''G_APP_VERSION''
;
','STRING');
