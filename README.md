# APEX Blog

Blog application built with Oracle Application Express (APEX).

## Install

### System Requirements
* Oracle database version 18c or higher
* Oracle Application Express version 20.1 or higher

### Needed Privileges
Ensure target schema associated to your APEX workspace is registered to ORDS, has following system privileges and roles:
* CREATE INDEXTYPE
* CREATE PROCEDURE
* CREATE SEQUENCE
* CREATE TABLE
* CREATE TRIGGER
* CREATE VIEW
* CREATE JOB
* CTXAPP

### Import Applications
1. Access your target APEX workspace
2. Select the Application Builder
3. Import and install *blog_administration.sql* and select install supporting objects.
4. Import and install *blog_public_pages.sql* and select install supporting objects.

### Post Install
Create group "Bloggers" to workspace and add APEX users to group. See [Using Groups to Manage Application Express Users](https://docs.oracle.com/en/database/oracle/application-express/19.2/aeadm/managing-users-in-a-workspace.html#GUID-0FD7B406-8A83-40C0-A3E7-EF19BBDEA5A4)

# License

This code is released under [MIT license](https://github.com/jariolaine/apex-blog/blob/master/LICENSE) by Jari Laine.
