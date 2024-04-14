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
    * @function blog.admin.showSuccessMessage
    * @desc Show APEX success message
    **/
    showSuccessMessage: function( message ){

      var lMsg;

      if( typeof message === "object" ){
        if( "text" in message ){
          if( message.text ){
            lMsg = apex.lang.hasMessage( message.text ) ? apex.lang.getMessage( message.text ) : message.text;
            apex.message.showPageSuccess( lMsg );
          }
        }
      }

    },

    /**
    * @module blog.admin.ir
    **/
    ir: {

      /**
      * @function blog.admin.ir.filesAfterRefresh
      * @desc Handle page 15 "Files" interactive report after refresh actions
      **/
      filesAfterRefresh: function( options ){

        // set defaults
        options = $.extend({
          downloadLink: "a[download]"
          ,downloadLinkClass: [
            "t-Button"
            ,"t-Button--noLabel"
            ,"t-Button--icon"
            ,"t-Button--small"
            ,"w60"
          ]
        }, options );

        // Copy from child data attribute for link title and aria-label
        options.region$.find( options.downloadLink ).each(function(){

          var this$ = $(this)
            , fileInfo = this$.children( "span" ).data( "file-info" )
          ;

          this$.attr( "title", fileInfo );

        // Remove alt attribute from download link. APEX bug??
        }).removeAttr( "alt" ).addClass( options.downloadLinkClass );

      },

      /**
      * @function blog.admin.ir.commentsAfterRefresh
      * @desc Handle page 30 "Comments" interactive report after refresh actions
      **/
      commentsAfterRefresh: function( options ){

        // set defaults
        options = $.extend({
          openLink: "a[data-unread=\"true\"]"
          ,newClass: "fa-envelope-open-o"
          ,oldClass: ["fa-envelope-o", "fa-envelope-arrow-down"]
          ,title: apex.lang.getMessage( "BLOG_LOV_COMMENT_FLAG_READ" )
        }, options );

        // change link column css class
        options.region$.find( options.openLink ).one( "click", function(){
          $( $x( $( this ).data( "id" ) ) )
            .removeClass( options.oldClass )
            .addClass( options.newClass )
            .attr( "title", options.title )
          ;
          return true;
        });

      }

    },

    /**
    * @module blog.admin.ig
    **/
    ig : {

      /**
      * @function blog.admin.ig.processChildFeatures
      * @desc hide / show child features depending pElement type
      **/
      processChildFeatures: function( pElement ){

        var element$ = $( $x( pElement ) )
          , nextRows = ":has(td:first-child>span.blog-feature-parent),:has(th)"

        if( element$.is( "input" ) ){

          element$.parents( "tr:has(td:first-child>span.blog-feature-parent)" )
            .nextUntil( nextRows ).toggle()
          ;

        } else {

          element$.find( "tr:has(td:first-child>span.blog-feature-parent[data-status=\"Exclude\"])" )
            .nextUntil( nextRows ).hide()
          ;

        }
      },

      /**
      * @function blog.admin.ig.region
      * @desc IG region initialization code
      **/
      region: function( options ){

        var igId        = options.regionStaticId
          , isConfigIg  = region( igId ).element.hasClass( "blog-config-ig" )
          // remove default "Save" and "Add Row" buttons form IG toolbar
          , toolbarData = $.apex.interactiveGrid.copyDefaultToolbar()
        ;

        toolbarData.toolbarRemove( "save" );
        toolbarData.toolbarRemove( "selection-add-row" );

        options = $.extend({
          toolbarData: toolbarData
        }, options );

        // disable options from features and settings IG
        if( isConfigIg ) {

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

          // disable column header menu for all columns
          options.columns.forEach( column => {
            $.extend( true, column, { defaultGridColumnOptions: { noHeaderActivate: true } } );
          });

        } else {

          options.columns.forEach( column => {

            if( column.name === "DISPLAY_SEQ" ){

              options = $.extend({
                defaultModelOptions: {
                  sequenceField: column.name,
                  sequenceStep: 10
                }
              }, options );

            }

          });

        }

        // run code when page is ready
        $(function(){

          // Set IG save action to custom button
          apex.actions.add({
            name: "save"
            ,action: function(){
              region( igId ).call( "getActions" ).invoke( "save" );
            }
          });

          // don't include "Add Row" button to blog features and settings IG
          if( !isConfigIg ) {

            // Set IG add row action to custom button
            apex.actions.add({
              name: "selection-add-row"
              ,action: function(){
                region( igId ).call( "getActions" ).invoke( "selection-add-row" );
              }
            });

          }

          // Handle hide / show child features
          blog.admin.ig.processChildFeatures( igId );

        });

        // Set IG to edit mode by default on page load
        $( window ).on( "theme42ready", function(){
          region( igId ).call( "getActions" ).set( "edit", true );
        });

        return options;

      }

    },

    /**
    * @module blog.admin.editor
    **/
    editor: {
      /**
      * @function blog.admin.editor.init
      * @desc Editor item initialization code
      **/
      init: function( options ){

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
