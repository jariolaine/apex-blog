/**
* @namespace blog
**/
var blog = blog || {};

( function( $, region, blog ) {

  gErrMesgKey = "BLOG_GENERIC_ERROR";

  function get_message( message ){
    return apex.lang.hasMessage( message ) ? apex.lang.getMessage( message ) : message;
  }

  /**
  * @module blog.admin
  **/
  blog.admin = {

    /**
    * @function blog.admin.showSuccessMessage
    * @desc Show APEX success message
    **/
    showSuccessMessage: function( message ){

      if( typeof message === "object" ){
        if( "text" in message ){
          if( message.text ){
            let lMsg = get_message( message.text );
            apex.message.showPageSuccess( lMsg );
          }
        }
      }

    }

    /**
    * @module blog.admin.ir
    **/
  , ir: {

      /**
      * @function blog.admin.ir.filesAfterRefresh
      * @desc Handle page 70 "Files" interactive report after refresh actions
      **/
      filesAfterRefresh: function( options ){

        // set defaults
        options = $.extend({
          clipboardSourceAttr: "data-clipboard-source"
        , loadingIconClass: [ "fa-refresh", "fa-anim-spin" ]
        , onOffIconClass: [ "fa-check-square-o", "fa-square-o" ]
        }, options );

        // on page load add action to select file switch
        if( options.browserEvent === "load" ){

          apex.actions.add({
            name: "select-file"
          , action: ( event, element, args ) => {

              let element$ = $( element )
                // Find button element
                , button$ = element$.is( ":button" ) ? element$ : element$.parent()
                // Find icon element and set loading icon
                , icon$ = button$.children( ".t-Icon" ).removeClass( options.onOffIconClass ).addClass( options.loadingIconClass )
                // Disable button and get stored collection seq_id from data attribute
                , seqId = button$.prop( "disabled", true ).data( "seq" )
                // Get fallback generic error message
                , errMsg = get_message( gErrMesgKey );
              ;

              // Call Ajax process to save selected file id to collection
              apex.server.process(
                args.process
              , {
                  x01: seqId
                , x02: args.id
                }
              , {
                  success: function( data ){
                    // Check if seq key is in returned data
                    if( "seq" in data ){

                      // Remove loading icon
                      icon$.removeClass( options.loadingIconClass ).addClass( data.seq ? options.onOffIconClass[0] : options.onOffIconClass[1] );
                      // Set aria-checked attribute true/false, save returned seq and enable button
                      button$.attr( "aria-checked", data.seq ? "true" : "false" ).data( "seq", data.seq ).prop( "disabled", false );

                    // If seq key not exists in returned data, some error has happend
                    // show returned or generic error message
                    } else {
                      // Clear all previous errors
                      apex.message.clearErrors();
                      // Get error message from returned data if exists
                      if( "errMsg" in data ){
                        errMsg = get_message( data.errMsg );
                      }
                      // Show error in page
                      apex.message.showErrors([
                        {
                          type:     "error"
                        , location: "page"
                        , message:  errMsg
                        , unsafe:   false
                        }
                      ]);
                    }
                  }
                }
              );

            }
          });

        } else {
          // Reinitialize copy to clipboard when report is changed
          options.region$.find( "[" + options.clipboardSourceAttr + "]" ).each( function() {
            apex.clipboard.addText( $( this ).attr( options.clipboardSourceAttr ), this );
          });
        }

      }

      /**
      * @function blog.admin.ir.commentsAfterRefresh
      * @desc Handle page 60 "Comments" interactive report after refresh actions
      **/
    , commentsAfterRefresh: function( options ){

        // set defaults
        options = $.extend({
          openLink: "a[data-unread=\"true\"]"
        , newClass: "fa-envelope-open-o"
        , oldClass: ["fa-envelope-o", "fa-envelope-arrow-down"]
        , titleMsg: "BLOG_LOV_COMMENT_FLAG_READ"
        }, options );

        // change link column css class
        options.region$.find( options.openLink ).one( "click", function(){
          $( $x( $( this ).data( "id" ) ) )
            .removeClass( options.oldClass )
            .addClass( options.newClass )
            .attr( "title", get_message( options.titleMsg ) )
          ;
          return true;
        });

      }

    }

    /**
    * @module blog.admin.ig
    **/
  , ig : {

      /**
      * @function blog.admin.ig.processChildFeatures
      * @desc hide / show child features depending pElement type
      **/
      processChildFeatures: function( pElement ){

        let element$ = $( $x( pElement ) )
          , nextRows = ":has(td:first-child>span.blog-feature-parent),:has(th)"

        // Check if function called by checkbox in page load
        if( element$.is( "input" ) ){
          element$.parents( "tr:has(td:first-child>span.blog-feature-parent)" )
            .nextUntil( nextRows ).toggle()
          ;
        } else {
          element$.find( "tr:has(td:first-child>span.blog-feature-parent[data-status=\"Exclude\"])" )
            .nextUntil( nextRows ).hide()
          ;
        }

        // if( element$.is( "input" ) ){
        //   let level     = element$.parents("tr").children().children().data( "level" )
        //     , nextRows  = ":has(td:first-child>span[data-level=\"" + level + "\"]),:has(th)"
        //     , rows$     = element$.parents( "tr:has(td:first-child>span[data-level=\"" + level + "\"])" )
        //   ;
        //   $v(pElement) === "Include" ? rows$.nextUntil( nextRows ).show() : rows$.nextUntil( nextRows ).hide();
        // } else {
        //   element$.find( "span[data-status=\"Exclude\"]" ).each(function(){
        //     let this$     = $(this)
        //       , level     = this$.data( "level" )
        //       , nextRows  = ":has(td:first-child>span[data-level=\"" + level + "\"]),:has(th)"
        //     ;
        //     this$.parents( "tr ").nextUntil( nextRows ).hide()
        //   });
        // }

      }

      /**
      * @function blog.admin.ig.region
      * @desc IG region initialization code
      **/
    , region: function( options ){

        let igId        = options.regionStaticId
          , isConfigIg  = region( igId ).element.hasClass( "blog-config-ig" )
          , toolbarData = $.apex.interactiveGrid.copyDefaultToolbar()
        ;
        // remove default "Save" and "Add Row" buttons form IG toolbar
        toolbarData.toolbarRemove( "save" );
        toolbarData.toolbarRemove( "selection-add-row" );

        options = $.extend({
          toolbarData: toolbarData
        }, options );

        // disable options from features and settings IG
        if( isConfigIg ) {

          options = $.extend({
            reportSettingsArea: false
          , defaultGridViewOptions: {
              footer: false
            , collapsibleControlBreaks: false
            , reorderColumns: false
            , columnSort: false
            , resizeColumns: false
            }
          }, options );

        }

        options.columns.forEach( column => {
          // disable column header menu for all columns
          if( isConfigIg ) {

            $.extend( true, column, { defaultGridColumnOptions: { noHeaderActivate: true } } );

          } else if( column.name === "DISPLAY_SEQ" ){

            options = $.extend({
              defaultModelOptions: {
                sequenceField: column.name
              , sequenceStep: 10
              }
            }, options );

          }

        });

        // run code when page is ready
        $(function(){

          // Set IG save action to custom button
          apex.actions.add({
            name: "save"
          , action: function(){
              region( igId ).call( "getActions" ).invoke( "save" );
            }
          });

          // don't include "Add Row" button to blog features and settings IG
          if( !isConfigIg ) {

            // Set IG add row action to custom button
            apex.actions.add({
              name: "selection-add-row"
            , action: function(){
                region( igId ).call( "getActions" ).invoke( "selection-add-row" );
              }
            });

          } else {
            // Hide child features on page load
            blog.admin.ig.processChildFeatures( igId );
          }

        });

        // Set IG to edit mode by default on page loadeditor
        $( window ).on( "theme42ready", function(){
          region( igId ).call( "getActions" ).set( "edit", true );
        });

        return options;

      }

    }

    /**
    * @module blog.admin.editor
    **/
  , editor: {

      /**
      * @function blog.admin.editor.init
      * @desc Editor item initialization code
      **/
      init: function( options ){

        let messageKey  = "BLOG_TXT_OPEN_NEW_TAB"
          , linkTarget  = "_blank"
        ;

        // include option to add target attribute to links
        options = $.extend( true, {
          editorOptions: {
            link: {
              decorators: {
                openInNewTab: {
                  mode: "manual"
                , label: get_message( messageKey )
                , attributes: {
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

    /**
    * @module blog.admin.ai
    **/
  , ai: {

      /**
      * @module blog.admin.ai.post
      **/
      post: {

        item: "P12_BODY_HTML"

        /**
        * @module blog.admin.ai.post.assistant
        **/
      , assistant: {

          button: "TALK_TO_ASSISTANT"

          /**
          * @function blog.admin.ai.post.assistant.useResponse
          * @desc Use assistant generated text
          **/
        , useResponse: function( options ){

            options = $.extend({
              postItem: blog.admin.ai.post.item
            , talkButton: this.button
            , process: "MARKDOWN_TO_HTML"
            }, options);

            apex.debug.info( "AI response markdown to html options", options )

            // Call Ajax callback process to convert markdown to HTML
            apex.server.process( options.process, {
              f01: apex.server.chunk( options.text )
            },{
              dataType: "html"
            , success: function( html ){
                $s( options.postItem, html );
                $( $x( options.talkButton ) ).hide();
              }
            });

          }

        }

        /**
        * @function blog.admin.ai.post.buttonActions
        * @desc Set blog post page item buttons action
        **/
      , buttonActions: function( options ){

          options = $.extend({
            postItem: blog.admin.ai.post.item
          , process: "GENERATIVE_AI_CONTENT"
          , buttons: [
              {
                action: "gen-ai-post-category"
              , targetItem: "P12_CATEGORY_TITLE"
              , systemPromptMsg: "BLOG_AI_SYSTEM_PROMPT_POST_CATEGORY"
              }
            , {
                action: "gen-ai-post-description"
              , targetItem: "P12_POST_DESC"
              , systemPromptMsg: "BLOG_AI_SYSTEM_PROMPT_POST_DESCRIPTION"
              }
            , {
                action: "gen-ai-post-tags"
              , targetItem: "P12_TAGS"
              , systemPromptMsg: "BLOG_AI_SYSTEM_PROMPT_POST_TAGS"
              }
            , {
                action: "gen-ai-post-title"
              , targetItem: "P12_TITLE"
              , systemPromptMsg: "BLOG_AI_SYSTEM_PROMPT_POST_TITLE"
              }
            ]
          }, options );


          $.each( options.buttons, function( idx, button ){
            apex.actions.add({
              name: button.action
            , action: ( event, element, args ) => {
                blog.admin.ai.post.generate({
                  triggeringElement: element
                , process: options.process
                , postItem: options.postItem
                , targetItem: button.targetItem
                , systemPromptMsg: button.systemPromptMsg
                });
              }
            });
          });

        }

        /**
        * @function blog.admin.ai.post.generate
        * @desc Call Ajax process to generate content
        **/
      , generate: function( options ){

          options = $.extend({
            buttonProcessingClass: ""
          , systemPromptMsg: ""
          , iconProcessingClass: "fa-anim-spin"
          }, options );

          apex.debug.info( "AI generate options", options )

          // Remove HTML from editor text
          let text = $( "<div/>" ).html( $v( options.postItem ) )
            .find( "code" ).remove().end()
            .text().trim().substring( 0, 32000 )
          ;

          // exit if there isn't text
          if( text.length === 0 ){
            apex.message.alert( apex.lang.getMessage( 'BLOG_MSG_AI_NO_POST_FOR_CONTEXT' ) )
            return;
          }

          let element$ = $( options.triggeringElement )
            , button$ = element$.is( ":button" ) ? element$ : element$.parent()
            , icon$ = button$.children( "span.t-Icon" )
            , errMsg = get_message( gErrMesgKey );
          ;

          button$.prop( "disabled", true ).addClass( options.buttonProcessingClass );
          icon$.addClass( options.iconProcessingClass );
          apex.item( options.targetItem ).disable();

          apex.server.process( options.process, {
            x01: text
          , x02: options.systemPromptMsg
          },{
            success: function( data ){

              apex.debug.info( "AI generate content response", data )

              if( "response" in data ){
                $s( options.targetItem, data.response );
              } else {
                // Clear all previous errors
                apex.message.clearErrors();
                // Get error message from returned data if exists
                if( "errMsg" in data ){
                  errMsg = get_message( data.errMsg );
                }
                // Show error in page
                apex.message.showErrors([{
                  type:     "error"
                , location: "page"
                , message:  errMsg
                , unsafe:   false
                }]);
              }

              apex.item( options.targetItem ).enable();
              icon$.removeClass( options.iconProcessingClass );
              button$.prop( "disabled", false ).removeClass( options.buttonProcessingClass );

            }
          , error: function( jqXHR, textStatus, errorThrown ){
              apex.item( options.targetItem ).enable();
              icon$.removeClass( options.iconProcessingClass );
              button$.prop( "disabled", false ).removeClass( options.buttonProcessingClass );
            }
          });

        }

      }

    }

    /**
    * @module blog.admin.speechRecognition
    **/
  , speechRecognition: {

      /**
      * @variable blog.admin.speechRecognition.buttonAction
      * @desc Add toggle speech recognition action
      **/
      buttonAction: function( options ){

        if( "action" in options ){
          apex.actions.add({
            name: options.action
          , action: ( event, element, args ) => {
              blog.admin.speechRecognition.toggleRecording({
                element: element
              , class: options.class
              , objectName: options.objectName
              });
            }
          });
        }
      }

      /**
      * @function blog.admin.speechRecognition.init
      * @desc Initialize speech recognition
      **/
    , init: function( options ){

        if ( "webkitSpeechRecognition" in window ) {

          options = $.extend({
            clearPreviousText: false
          }, options );

          this[ options.objectName ] = this[ options.objectName ] || {};
          this[ options.objectName ].element$ = options.element$;

          // Initialize webkitSpeechRecognition
          this[ options.objectName ].speech = new webkitSpeechRecognition();

          // Set the properties for the Speech Recognition object
          this[ options.objectName ].speech.continuous = true;
          //this[ options.objectName ].speech.interimResults = true;
          this[ options.objectName ].speech.lang = navigator.language || navigator.userLanguage;

          this[ options.objectName ].speech.onresult = ( event ) => {

            let transcript = event.results[event.resultIndex][0].transcript;
            transcript = transcript.trim();
            transcript = transcript.charAt(0).toUpperCase() + transcript.slice(1) + ".";

            // append transcript to item value
            $s( options.element$[0], $v( options.element$[0] ) + transcript );
            options.element$.trigger( "change" );

          };

          this[ options.objectName ].speech.onend = ( event ) => {
            this.startEndCallback({
              element$: options.element$
            , objectName: options.objectName
            });
          }

          this[ options.objectName ].speech.onstart = ( event ) => {

            options.clearPreviousText ? $s( options.element$[0], "" ) : null;

            this.startEndCallback({
              element$: options.element$
            , objectName: options.objectName
            });

          }

        } else {
          apex.debug.info( "Speech Recognition Not Available." );
        }
      }

      /**
      * @function blog.admin.speechRecognition.toggleRecording
      * @desc Start or end speech recognition
      **/
    , toggleRecording: function( options ){

        if( [ options.objectName ] in this ){

          let element$ = $( options.element );

          // set defaults
          this[ options.objectName ].button = $.extend({
            element$: element$.is(":button") ? element$ : element$.parent()
          , class: [ "t-Button--warning" ]
          , icons: [ "fa-microphone", "fa-stop-circle" ]
          }, options );

          this[ options.objectName ].recording ? this[ options.objectName ].speech.stop() : this[ options.objectName ].speech.start();

        }

      }

      /**
      * @function blog.admin.speechRecognition.startEndCallback
      * @desc Handles record stop and start
      **/
    , startEndCallback: function( options ){

        this[ options.objectName ].recording = this[ options.objectName ].recording ? false : true;

        this[ options.objectName ].button.element$.toggleClass( this[ options.objectName ].button.class )
          .children( "span.t-Icon" )
          .toggleClass( this[ options.objectName ].button.icons )
          .toggleClass( "fa-anim-flash" )
        ;

      }

      /**
      * @function blog.admin.speechRecognition.initButtonAction
      * @desc Initialize speech recognition and adds toggle
      **/
    , initButtonAction: function( options ){
        this.init( options );
        this.buttonAction( options );
      }

    }

  }
})( apex.jQuery, apex.region, blog );
