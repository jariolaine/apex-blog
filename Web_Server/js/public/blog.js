/**
* @namespace blog
**/
var blog = blog || {};

(function($, blog) {

  /**
  * @module blog.ui
  **/
  blog.ui = {

    /**
    * @function blog.ui.setListCurrentItem
    * @example blog.UI.setListCurrentItem({ affectedElements: this.affectedElements, pageItem: "PX_ITEM" });
    * @summary set list item class indicate current page
    * @desc global page lists are cached use passed parameters to set class to list that indicate current page.
    **/
    setListCurrentItem: function( options ){

      options = $.extend({
        currentClass: [ "is-current" ]
      , dataAttrName: "item-id"
      , currentAttr: { "aria-current": "page" }
      }, options );

      options.affectedElements.find( "a[data-" + options.dataAttrName + "]" ).filter( function(){

        let lDataValue = $( this ).data( options.dataAttrName )
          , result = false
        ;
        result = $v_CheckValueAgainst(
          options.pageItem
        , lDataValue
        );

        return result;

      }).parent().addClass( options.currentClass ).attr( options.currentAttr );

    },

    /**
    * @function blog.ui.setDialogTitle
    * @example blog.UI.setDialogTitle("Dialog Title");
    * @summary set dialog title
    * @desc set dynamically dialog page title.
    **/
    setDialogTitle: function( title ){
      apex.util.getTopApex().jQuery( ".ui-dialog-content" ).dialog( "option", "title", title );
    }

  };

  /**
  * @module blog.plugin
  **/
  blog.plugin = {

    /**
    * @module blog.plugin.mathQuestionField
    **/
    mathQuestionField : {

      /**
      * @function blog.plugin.mathQuestionField.getQuestion
      * @example blog.comment.question( "ajaxIdentifier": "xxxx" );
      * @summary set question field label
      * @desc set result from ajax call to item label. function relates question field APEX plugin.
      **/
      getQuestion: function( options ){

        apex.server.plugin( options.ajaxIdentifier, {}, {
          success:function( data ){
            $( $x( options.labelId ) ).html( data.label );
          }

        });

      }

    }

  };

})(apex.jQuery, blog);
