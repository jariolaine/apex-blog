TWITTER BUTTON, 1.0
===================
Add this button to your application to let people share content on Twitter without having
to leave the page. Promote strategic Twitter accounts at the same time while driving traffic
to your website.


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
7. Browse and locate the installer file, item_type_plugin_com_oracle_apex_twitter_button.sql
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
4. Select the plug-in "Twitter Button"
5. Follow the wizard and use Item Level Help to get more information about the
   purpose and usage of the different settings.

Note that you can also update existing items to use this new item-type, once installed.


ADDITIONAL DETAILS
==================
Additional information about the Twitter button can be found at
http://twitter.com/about/resources/tweetbutton


FAQ
===
* Q: How can I best align the Twitter Button for example with the Facebook "Like" button?
  A: 1) In the "Label" region clear any label text,
     2) set "Horizontal / Vertical Alignment" to Above,
     3) set "Template" to "- Select a Template -" and
     4) in the "Element" region set "Horizontal / Vertical Alignment" to "Left top".

* Q: How can I customize the default Tweet text?
  A: Set the setting "Tweet Text" to "Custom" and enter any text into "Custom Tweet Text". You
     can also use the placeholder #PAGE_TITLE# in this attribute to include the current
     page title. For example: Check out "#PAGE_TITLE#"!


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
v1.0 (06-Dec-2010)
-) Initial edit
