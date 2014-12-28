FACEBOOK LIKE BUTTON, 1.1
=========================
The Like button lets a user share your content with friends on Facebook.
When the user clicks the Like button on your site, a story appears in the
user's friends' News Feed with a link back to your website.


TABLE OF CONTENTS
=================

* Installation and Update
* How to use
* Additional Details
* FAQ
* Uninstall
* Credits, License and Terms of Use
* Support
* Change Log


INSTALLATION AND UPDATE
=======================
1. Ensure you are running Oracle APEX version 4.0 or higher
2. Unzip and extract all files
2. Access your target Workspace
3. Select the Application Builder
4. Select the Application where you wish to import the plug-in 
   (plug-ins belong to an application, not a workspace)
5. Access Shared Components > Plug-Ins
6. Click [Import >]
7. Browse and locate the installer file, item_type_plugin_com_oracle_apex_facebook_like_button
8. Complete the wizard

If the plug-in already exists in that application, you will need to confirm that you 
want to replace it.  Also, once imported, this plug-in can be installed into additional
applications within the same workspace.  Simply navigate to the Export Repository 
(Export > Export Repository), click Install, and then select the target application.
Once the install file is no longer needed, it can be removed from the Export Repository.


HOW TO USE
==========
1. Install the plug-in (see INSTALLATION AND UPDATE)
2. Create a new page item
3. Pick "Plug-Ins" as type
4. Select the plug-in "Facebook Like Button"
5. Follow the wizard and use Item Level Help to get more information about the
   purpose and usage of the different settings.

Note that you can also update existing items to use this new item-type, once installed.


ADDITIONAL DETAILS
==================
Additional information about the Facebook Like button can be found at
http://developers.facebook.com/docs/reference/plugins/like


FAQ
===
* Q: How can I best align the Facebook "Like" button for example with the Twitter button?
  A: 1) In the "Label" region clear any label text,
     2) set "Horizontal / Vertical Alignment" to Above,
     3) set "Template" to "- Select a Template -" and
     4) in the "Element" region set "Horizontal / Vertical Alignment" to "Left top".

* Q: Facebook shows an error when the Like button is pressed. What is wrong?
  A: Have you verified that your application is accessible with the specified URL from the internet?
     If you have specified a Page URL, have you made sure that you used 0 as session id?


UNINSTALL
=========
To completely remove the plug-in:

1. Access the plug-in under Shared Components > Plug-Ins
2. Click [Delete]
   Note: If the [Delete] button doesn't show that indicates the plug-in is in use within the
         application.  Click on 'Utilization' under 'Tasks' to see where it is used.


LICENSE AND TERMS OF USE
========================
Copyright 2010, Oracle. All rights reserved.

The plug-in is dual licensed under the MIT and GPL licenses:

  * http://www.opensource.org/licenses/mit-license.php
  * http://www.gnu.org/licenses/gpl.html

Terms of use: http://apex.oracle.com/plugins#TERMS


SUPPORT
=======
This plug-in is not part of Oracle Application Express software and is therefore not supported by Oracle Support.
Any issues with it can be discussed on the Application Express Forum at http://forums.oracle.com/forums/forum.jspa?forumID=137


CHANGE LOG
==========
v1.1 (05-Dec-2010)
-) Enabled "Element" region for item type
-) Updated FAQ section

v1.0 (12-Nov-2010)
-) Initial edit
