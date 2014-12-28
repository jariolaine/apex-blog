*  DbSWH APEX blogging platform
*  Date: 07.12.2014
*  Dual licensed under the MIT and GPL licenses:
*  http://www.opensource.org/licenses/mit-license.php
*  http://www.gnu.org/licenses/gpl.html
*
*  Requires:
*  Oracle Application Express 4.2 or higher

Change log:
2.9.0.1 / 07.12.2014
- Applications completly rewritten
- EPG support removed

0.0.3b / 27.06.2012
- Blog Reader default Build Status changed to Run and Build Application

0.0.2b / 25.11.2011
- Changes to CSS
- Twitter and Google+ buttons
- Materialized view BLOG_MESG changed to be view -> Now application can be installed to 11G XE database
- Included calls to APEX_UTIL.SET_AUTHENTICATION_RESULT to function BLOG_AUTH

0.0.1b / 16.11.2011
- First public version


#Installation#

1. Ensure you are running Oracle APEX version 4.2 or higher
2. Unzip and extract all files
3. Access your target Workspace
4. Select the Application Builder
5. Import and install both applications (blog_reader.sql and blog_admin.sql) to workspace.
   When installing blog_reader.sql, install also supporting objects.
6. Run blog admin application and login using user/password admin/admin.

If blog reader application default alias BLOG is reserved in your instance:
1. Edit blog reader Application Definition and change Application Alias.
2. Navigate to SQL Workshop > SQL Commands and run:
~~~~~~
begin
  blog_install.blog_install.update_param_data;
end;
/
~~~~~~

By default blog theme files are served from database.
It is recommended to place all theme files from folder "server" to web server.
Then change blog preference "Theme location" to web server virtual folder.

