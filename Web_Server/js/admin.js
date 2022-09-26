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
    * @function getDialogMessage
    * @summary Get Dialog Message
    * @desc
    * @version 1.0
    **/
    getDialogMessage: function( message ){
      message !== undefined ? apex.message.showPageSuccess( message.text ) : null;
    },
    /**
    * @function filesIrAfterRefresh
    * @summary Handle page 15 "Files" interactive report after refresh actions
    * @desc
    * @version 1.0
    **/
    filesIrAfterRefresh: function( report ){
      // Remove alt and title from download link. APEX bug
      report.find( "td[headers=DOWNLOAD] a" ).removeAttr( "alt title" ).end()
      // Find column that have copy URL button and attach click event
      .find( "[data-clipboard-source]" ).click( function(){
        navigator.clipboard.writeText( $( this ).data( "clipboard-source" ) );
      });
    },
    /**
    * @function commentsIrAfterRefresh
    * @summary Handle page 30 "Comments" interactive report after refresh actions
    * @desc
    * @version 1.0
    **/
    commentsIrAfterRefresh: function( report ){
      report.find( "a[data-unread=true]" ).one( "click", function(){
        $( $x( $( this ).data( "id" ) ) )
          .removeClass( "fa-envelope-o fa-envelope-arrow-down" )
          .addClass( "fa-envelope-open-o" );
      });
    },
    /**
    * @module blog.admin.dialogIG
    **/
    dialogIG : {
      /**
      * @function initRegion
      * @summary Dialog IG region initialization code
      * @desc put blog.admin.dialogIG.initRegion in region Advanced: JavaScript Initialization Code
      * @version 1.0
      **/
      initRegion: function( options ){

        var toolbarData = $.apex.interactiveGrid.copyDefaultToolbar();

        toolbarData.toolbarRemove( "save" );
        toolbarData.toolbarRemove( "selection-add-row" );

        if( blog.admin.dialogIG.options.sequenceField != "undefined" ){
          options = $.extend({
            defaultModelOptions: {
              sequenceField: blog.admin.dialogIG.options.sequenceField,
              sequenceStep: blog.admin.dialogIG.options.sequenceStep
            }
          }, options);
        }

        options = $.extend({
          toolbarData: toolbarData
        }, options);

        return options;

      },
      /**
      * @function initLinkColumn
      * @summary Dialog IG link column Initialization code
      * @desc put blog.admin.dialogIG.initLinkColumn in column Advanced: JavaScript Initialization Code
      * @version 1.0
      **/
      initLinkColumn: function( options ){

        options = $.extend({
          defaultGridColumnOptions: {
            noHeaderActivate: true
          }
        }, options);

        return options;

      },
      /**
      * @function initOnPageLoad
      * @summary Dialog IG initialization code
      * @desc put blog.admin.dialogIG.initOnPageLoad in page JavaScript: Function and Global Variable Declaration
      * @version 1.0
      **/
      initOnPageLoad: function( options ){

        $(function(){

          options = $.extend({
            btnSave: "ig-save"
            ,btnAddRow: "ig-selection-add-row"
          }, options);

          blog.admin.dialogIG.options = $.extend({
            sequenceField: options.sequenceField
            ,sequenceStep: 10
          }, blog.admin.dialogIG.options);

          apex.actions.add([
            {
              name: options.btnSave
              ,action: function(){
                region( options.regionId ).call( "getActions" ).invoke( "save" );
              }
            }
            ,{
              name: options.btnAddRow
              ,action: function(){
                region( options.regionId ).call( "getActions" ).invoke( "selection-add-row" );
              }
            }
          ]);

        });

      }
    },
    /**
    * @module blog.admin.configIG
    **/
    configIG : {
      /**
      * @function initRegion
      * @summary configuration IG region initialization code
      * @desc put blog.admin.configIG.initRegion in region Advanced: JavaScript Initialization Code
      * @version 1.0tags
      **/
      initRegion: function( options ){

        var toolbarData = $.apex.interactiveGrid.copyDefaultToolbar();

        toolbarData.toolbarRemove( "save" );

        options = $.extend({
          toolbarData: toolbarData,
          reportSettingsArea: false,
          defaultGridViewOptions: {
            reorderColumns: false,
            footer: false
          }
        }, options);

        return options;
      },
      /**
      * @function initColumn
      * @summary IG columns initialization code
      * @desc put blog.admin.configIG.initColumn in column Advanced: JavaScript Initialization Code
      * @version 1.0
      **/
      initColumn: function( options ){

        options = $.extend({
          defaultGridColumnOptions: {
            noHeaderActivate: true
          }
        }, options);

        return options;

      },
      /**
      * @function initOnPageLoad
      * @summary configuration IG page initialization code
      * @desc put blog.admin.configIG.initOnPageLoad in page JavaScript: Function and Global Variable Declaration
      * @version 1.0
      **/
      initOnPageLoad: function( options ){
        $(function(){

          options = $.extend({
            btnSave: "ig-save"
          }, options);

          apex.actions.add([
            {
              name: options.btnSave
              ,action: function(){
                region( options.regionId ).call( "getActions" ).invoke( "save" );
              }
            }
          ]);

        });
      }
    },
    /**
    * @function editorInit
    * @summary editor item initialization code
    * @desc put blog.admin.editorInit in item Advanced: JavaScript Initialization Code
    * @version 1.0
    **/
    editorInit: function( options ){

      options.contentsCss = options.contentsCss || [];
      options.contentsCss.unshift(CKEDITOR.getUrl("contents.css"));

      return $.extend(options, {
         startupOutlineBlocks: true
        ,toolbarCanCollapse: true
        ,forcePasteAsPlainText: true
        //,autoParagraph: false
        //,enterMode: CKEDITOR.ENTER_BR
        //,shiftEnterMode: CKEDITOR.ENTER_P
        ,entities_additional: "#35,#39"
        ,disallowedContent: "script; *[on*]"
        ,allowedContent: {
          $1:{
            // Use the ability to specify elements as an object.
            elements: CKEDITOR.dtd,
            attributes: true,
            styles: true,
            classes: true
          }
        }
        ,stylesSet: [
          {name:"Program Code",element:"pre",attributes:{"class":"z-program-code"}},

          {name:"Big",element:"big"},
          {name:"Small",element:"small"},
          {name:"Typewriter",element:"tt"},
          {name:"Computer Code",element:"code"},
          {name:"Keyboard Phrase",element:"kbd"},
          {name:"Sample Text",element:"samp"},
          {name:"Variable",element:"var"},
          {name:"Deleted Text",element:"del"},
          {name:"Inserted Text",element:"ins"},
          {name:"Cited Work",element:"cite"},
          {name:"Inline Quotation",element:"q"},
          {name:"Styled image(left)",element:"img",attributes:{"class":"left"}},
          {name:"Styled image(right)",element:"img",attributes:{"class":"right"}}
        ]
      });
    }
  }
})( apex.jQuery, apex.region, blog );
