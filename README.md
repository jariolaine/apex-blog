# APEX Blog
![Oracle_Database 19c](https://img.shields.io/badge/Oracle_Database-19c-red)
![Oracle Application Express 22.2](https://img.shields.io/badge/APEX-22.2-blue)


Blog application built with Oracle Application Express (APEX).

## Install

### Note for APEX 23.1
Supporting object install and upgrade will fail on APEX 23.1.0 due to bug 35410651 in APEX.
Workaround is run scripts using e.g. SQL Developer or other SQL client.

### System Requirements
* Oracle database version 19c or later
* Oracle Application Express version 22.2 or later

### Needed Privileges
Ensure target schema associated to your APEX workspace has following system privileges and roles:
* CREATE INDEXTYPE
* CREATE PROCEDURE
* CREATE SEQUENCE
* CREATE TABLE
* CREATE TRIGGER
* CREATE TYPE
* CREATE VIEW
* CTXAPP

APEX workspace administrator privileges are required to create a user group for authorization.

### Import Applications
1. Access your target APEX workspace
2. Select the Application Builder
3. Import and install *blog_administration.sql* and select install supporting objects.
4. Import and install *blog_public_pages.sql* and select install supporting objects.

### Post Install
Create a "Bloggers" workspace user group. Add APEX users to the group who are authorized to use the blog admin application. See [Using Groups to Manage Application Express Users](https://docs.oracle.com/en/database/oracle/apex/22.2/aeadm/managing-users-in-a-workspace.html#GUID-0FD7B406-8A83-40C0-A3E7-EF19BBDEA5A4)

## Upgrade
Existing application version must be Release v4.4.20220326 or later.

Before starting the upgrade, backup the application parsing schema data and objects.

### Import Applications
1. Access your target APEX workspace
2. Select the Application Builder
3. Import and install *blog_administration.sql* and select upgrade supporting objects.
4. Import and install *blog_public_pages.sql* and select upgrade supporting objects.

# License
This code is released under [MIT license](https://raw.githubusercontent.com/jariolaine/apex-blog/master/LICENSE.txt) by Jari Laine.
