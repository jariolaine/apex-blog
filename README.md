# APEX Blog
![](https://img.shields.io/badge/Oracle_Database-19c-blue.svg)
![](https://img.shields.io/badge/APEX-21.1-success.svg)


Blog application built with Oracle Application Express (APEX).

## Install

### System Requirements
* Oracle database version 19c or later
* Oracle Application Express version 21.1 or later

### Needed Privileges
Ensure target schema associated to your APEX workspace has following system privileges and roles:
* CREATE INDEXTYPE
* CREATE PROCEDURE
* CREATE SEQUENCE
* CREATE TABLE
* CREATE TRIGGER
* CREATE VIEW
* CREATE JOB
* CTXAPP

APEX workspace administrator privileges are required to create a user group for authorization.

### Import Applications
1. Access your target APEX workspace
2. Select the Application Builder
3. Import and install *blog_administration.sql* and select install supporting objects.
4. Import and install *blog_public_pages.sql* and select install supporting objects.

### Post Install
Create a "Bloggers" workspace user group. Add APEX users to the group who are authorized to use the blog admin application. See [Using Groups to Manage Application Express Users](https://docs.oracle.com/en/database/oracle/application-express/21.1/aeadm/managing-users-in-a-workspace.html#GUID-0FD7B406-8A83-40C0-A3E7-EF19BBDEA5A4)

# License

This code is released under [MIT license](https://github.com/jariolaine/apex-blog/blob/master/LICENSE) by Jari Laine.
