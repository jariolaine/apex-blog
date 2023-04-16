/**
* @namespace blog
**/
var blog = blog || {};

( function( $, region, blog ) {

  // on page ready
  // hide automatically success message
  $(function() {

    apex.theme42.util.configAPEXMsgs({
      autoDismiss: true
      // duration is optional (Default is 3000 milliseconds)
      ,duration: 5000
    });

  });

  /**
  * @module blog.admin
  **/
  blog.admin = {
    /**
    * @function showSuccessMessage
    * @summary Show APEX success message
    * @desc
    **/
    showSuccessMessage: function( message ){
      if( typeof message === "object" ){
        if( "text" in message ){
          apex.message.showPageSuccess( message.text );
        } else if ( "messageKey" in message ){
          apex.message.showPageSuccess( apex.lang.getMessage( message.messageKey ) );
        }
      }
    },
    /**
    * @function filesIrAfterRefresh
    * @summary Handle page 15 "Files" interactive report after refresh actions
    * @desc
    **/
    filesIrAfterRefresh: function( options ){

      // set defaults
      options = $.extend({
        copyLink: "[data-clipboard-source]"
        ,copySource: "clipboard-source"
        ,downloadLink: "td[headers=DOWNLOAD] a"
        ,downloadLinkClass: [
          "t-Button"
          ,"t-Button--noLabel"
          ,"t-Button--icon"
          ,"t-Button--small"
          ,"w100p"
          ,"mxw100"
        ]
      }, options );

      // Copy from child data attribute for link title and aria-label
      options.region$.find( options.downloadLink ).each(function(){

        var this$ = $(this)
          , fileInfo = this$.children( "span" ).data( "file-info" )
        ;

        this$.attr({ "title" : fileInfo, "aria-label" : fileInfo });

      // Remove alt attribute from download link. APEX bug??
      }).removeAttr( "alt" ).addClass( options.downloadLinkClass ).end()
      // Find column that have copy URL button and attach click event
      .find( options.copyLink ).click( function(){
        navigator.clipboard.writeText( $( this ).data( options.copySource ) );
      });

    },
    /**
    * @function commentsIrAfterRefresh
    * @summary Handle page 30 "Comments" interactive report after refresh actions
    * @desc
    **/
    commentsIrAfterRefresh: function( options ){

      // set defaults
      options = $.extend({
        openLink: "a[data-unread=\"true\"]"
        ,newClass: "fa-envelope-open-o"
        ,oldClass: ["fa-envelope-o", "fa-envelope-arrow-down"]
        ,messageKey: "BLOG_LOV_COMMENT_FLAG_READ"
      }, options );

      // Get title and aria label
      var newLabel = apex.lang.getMessage( options.messageKey );

      // change link column css class
      options.region$.find( options.openLink ).one( "click", function(){
        $( $x( $( this ).data( "id" ) ) )
          .removeClass( options.oldClass )
          .addClass( options.newClass )
          .attr({ "aria-label": newLabel, "title": newLabel })
      });

    },
    /**
    * @module blog.admin.configIG
    **/
    configIG : {

      options: {},

      /**
      * @function initOnPageLoad
      * @summary IG initialization code on page load
      * @desc put blog.admin.configIG.initOnPageLoad in page JavaScript: Function and Global Variable Declaration
      **/
      initOnPageLoad: function( options ){

        // defaults for IG custom button data attribute values
        options = $.extend({
          btnSave: "save"
          ,btnAddRow: "selection-add-row"
        }, options );

        // if sequence column defined
        if( options.sequenceField !== undefined ){
          blog.admin.configIG.options = $.extend({
            sequenceField: options.sequenceField
            ,sequenceStep: 10
          }, blog.admin.configIG.options );
        }

        // Set IG to edit mode by default on page load
        $( window ).on( "theme42ready", function(){
          region( options.regionId  ).call( "getActions" ).set( "edit", true );
        });

        // run coode when page is ready
        $(function(){

          // Set IG save action to custom button
          apex.actions.add([{
            name: options.btnSave
            ,action: function(){
              region( options.regionId ).call( "getActions" ).invoke( "save" );
            }
          }]);

          // don't include "Add Row" button to blog features and settings IG
          if( !$( $x( options.regionId ) ).hasClass( "z-config-ig" ) ) {

            // Set IG add row action to custom button
            apex.actions.add([{
              name: options.btnAddRow
              ,action: function(){
                region( options.regionId ).call( "getActions" ).invoke( "selection-add-row" );
              }
            }]);

          }

        });

      },
      /**
      * @function initRegion
      * @summary IG region initialization code
      * @desc put blog.admin.configIG.initRegion in region Advanced: JavaScript Initialization Code
      **/
      initRegion: function( options ){

        // remove default "Save" and "Add Row" buttons form IG toolbar
        var toolbarData = $.apex.interactiveGrid.copyDefaultToolbar();

        toolbarData.toolbarRemove( "save" );
        toolbarData.toolbarRemove( "selection-add-row" );

        options = $.extend({
          toolbarData: toolbarData
        }, options );

        // if sequence column defined in page load
        if( blog.admin.configIG.options.sequenceField !== undefined ){
          options = $.extend({
            defaultModelOptions: {
              sequenceField: blog.admin.configIG.options.sequenceField,
              sequenceStep: blog.admin.configIG.options.sequenceStep
            }
          }, options );
        }

        if( $( $x( options.regionStaticId ) ).hasClass( "z-config-ig" ) ) {

          // disable options from IG that are used manage blog features and settings
          options = $.extend({
            reportSettingsArea: false,
            defaultGridViewOptions: {
              footer: false,
              collapsibleControlBreaks: false,
              reorderColumns: false,
              columnSort: false,
              resizeColumns: false
            }
          }, options );

        }

        return options;

      },
      /**
      * @function initColumn
      * @summary IG columns initialization code
      * @desc put blog.admin.configIG.initColumn in column Advanced: JavaScript Initialization Code
      **/
      initColumn: function( options ){

        // remove headers actions
        options = $.extend({
          defaultGridColumnOptions: {
            noHeaderActivate: true
          }
        }, options );

        return options;

      }

    },
    /**
    * @module blog.admin.editor
    **/
    editor: {
      /**
      * @function initItem
      * @summary Editor item initialization code
      * @desc put blog.admin.editor.initItem in item Advanced: JavaScript Initialization Code
      **/
      initItem: function( options ){

        var messageKey    = "BLOG_TXT_OPEN_NEW_TAB"
          , linkTarget    = "_blank"
        ;

        // include option to add target attribute to links
        options = $.extend( true, {
          editorOptions: {
            link: {
              decorators: {
                openInNewTab: {
                  mode: "manual"
                  ,label: apex.lang.getMessage( messageKey )
                  ,attributes: {
                    target: linkTarget
                  }
                }
              }
            }
          }
        }, options );

        return options;

      }
    }
  }
})( apex.jQuery, apex.region, blog );
