/**
* @namespace blog
**/
var blog = blog || {};

(function($, region, blog) {

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
    * @module blog.admin.categoriesIG
    **/
    categoriesIG : {
      /**
      * @function initRegion
      * @summary categories IG region initialization code
      * @desc put blog.admin.categoriesIG.initRegion in region Advanced: JavaScript Initialization Code
      * @version 1.0
      **/
      initRegion: function(options) {

        var toolbarData = $.apex.interactiveGrid.copyDefaultToolbar();

        toolbarData.toolbarRemove("save");
        toolbarData.toolbarRemove("selection-add-row");

        options = $.extend({
          toolbarData: toolbarData,
          defaultModelOptions: {
            sequenceField: blog.admin.categoriesIG.options.sequenceField,
            sequenceStep: blog.admin.categoriesIG.options.sequenceStep
          },
          defaultGridViewOptions: {
            reorderColumns: false
          }
        }, options);

        return options;
      },
      /**
      * @function initHandleColumn
      * @summary categories IG handle column Initialization code
      * @desc put blog.admin.categoriesIG.initHandleColumn in column Advanced: JavaScript Initialization Code
      * @version 1.0
      **/
      initHandleColumn: function(options) {

        options = $.extend({
          defaultGridColumnOptions: {
            virtual: true,
            noHeaderActivate: true
          }
        }, options);

        return options;

      },
      /**
      * @function initLinkColumn
      * @summary categories IG link column Initialization code
      * @desc put blog.admin.categoriesIG.initLinkColumn in column Advanced: JavaScript Initialization Code
      * @version 1.0
      **/
      initLinkColumn: function(options) {

        options = $.extend({
          defaultGridColumnOptions: {
            noHeaderActivate: true
          }
        }, options);

        return options;

      },
      /**
      * @function initOnPageLoad
      * @summary categories page initialization code
      * @desc put blog.admin.categoriesIG.initOnPageLoad in page JavaScript: Function and Global Variable Declaration
      * @version 1.0
      **/
      initOnPageLoad: function(options){

        blog.admin.categoriesIG.options = $.extend({
          sequenceField: options.sequenceField
          ,sequenceStep: "10"
        }, blog.admin.categoriesIG.options);

        $(function(){

          var IG$ = $($x(options.regionID));

          apex.actions.add([
            {
              name: options.btnSave
              ,action: function() {
                region(options.regionID).call("getActions").invoke("save");
              }
            }
            ,{
              name: options.btnAddRow
              ,action: function() {
                region(options.regionID).call("getActions").invoke("selection-add-row");
              }
            }
          ]);

          IG$.on("interactivegridviewchange interactivegridreportsettingschange", function(event, ui) {

            var view = region(this.id).call("getViews","grid");

            view.view$.find(".a-GV-w-scroll").sortable({
              cursor: "move"
              ,handle: ".z-sortable-handle"
              ,contaiment: "parent"
              ,tolerance: "pointer"
              ,scroll: false
              ,items: "tbody>tr"
              ,axis: "y"
              ,opacity: 0.6
              ,placeholder: "a-GV-cell"
              ,helper: function(event, ui){
                ui.children().each(function(){
                  $(this).width($(this).width()).addClass("u-color-1")
                })
                return ui;
              }
              ,stop: function(event, ui){
                var model = view.model
                    ,item$ = $(ui.item)
                    // get moved record
                    ,item = (item$.length) ? model.getRecord(item$.data("id")) : null
                    // get next or previous row from visible table
                    // depending is record moved up or down
                    ,after$ = (ui.originalPosition.top > ui.position.top) ? item$.next("") : item$.prev("")
                    ,after = (after$.length) ? model.getRecord(after$.data("id")) : null
                ;
                // remove helper class, if row isn't actually moved
                item$.children().removeClass("u-color-1");
                // if record and place where record moved is found
                if(item && after){
                  if(ui.originalPosition.top > ui.position.top){
                    // if record is moved upwards, we need get previous record from model
                    // because if IG is paginated row should not moved at index 0
                    after = model.recordAt(model.indexOf(after) - 1);
                  }
                  // move record
                  if(item !== after){
                    // cancel sortable, and let IG moveRecords method handle actual move
                    $(this).sortable("cancel");
                    model.moveRecords([item], null, after);
                  }
                }
              }
            });//.disableSelection();
          });
        });

      }
    },
    /**
    * @module blog.admin.tagsIG
    **/
    tagsIG : {
      /**
      * @function initRegion
      * @summary tags IG region initialization code
      * @desc put blog.admin.tagsIG.initRegion in region Advanced: JavaScript Initialization Code
      * @version 1.0
      **/
      initRegion: function(options) {

        var toolbarData = $.apex.interactiveGrid.copyDefaultToolbar();

        toolbarData.toolbarRemove("save");
        toolbarData.toolbarRemove("selection-add-row");

        options = $.extend({
          toolbarData: toolbarData,
          defaultGridViewOptions: {
            reorderColumns: false
          }
        }, options);

        return options;

      },
      /**
      * @function initLinkColumn
      * @summary tags IG link column initialization code
      * @desc put blog.admin.tagsIG.initLinkColumn in column Advanced: JavaScript Initialization Code
      * @version 1.0
      **/
      initLinkColumn: function(options) {

        options = $.extend({
          defaultGridColumnOptions: {
            noHeaderActivate: true
          }
        }, options);

        return options;

      },
      /**
      * @function initOnPageLoad
      * @summary tags IG page initialization code
      * @desc put blog.admin.tagsIG.initOnPageLoad in page JavaScript: Function and Global Variable Declaration
      * @version 1.0
      **/
      initOnPageLoad: function(options){

        $(function(){

          apex.actions.add([
            {
              name: options.btnSave
              ,action: function() {
                region(options.regionID).call("getActions").invoke("save");
              }
            }
            ,{
              name: options.btnAddRow
              ,action: function() {
                region(options.regionID).call("getActions").invoke("selection-add-row");
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
      initRegion: function(options) {

        var toolbarData = $.apex.interactiveGrid.copyDefaultToolbar();

        toolbarData.toolbarRemove("save");

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
      initColumn: function(options){

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
      initOnPageLoad: function(options){
        $(function(){

          apex.actions.add([
            {
              name: options.btnSave
              ,action: function() {
                region(options.regionID).call("getActions").invoke("save");
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
    editorInit: function(options){

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
})(apex.jQuery, apex.region, blog);
