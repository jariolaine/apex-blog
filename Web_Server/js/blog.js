/**
* @namespace blog
**/
var blog = blog || {};

(function($, blog) {

  // on page ready
  // hide automatically success message
  $(function() {
    apex.theme42.util.configAPEXMsgs({
      autoDismiss: true
      // duration is optional (Default is 3000 milliseconds)
      ,duration: 10000
    });
  });

  /**
  * @function blog.search
  * @example return blog.search( this, { currentPage:'&APP_PAGE_ID.',submitIfEnter:event } )
  **/
  blog.search = function( element, options ){

    options = $.extend({
      noSubmitPage: "4"
      ,request: "SEARCH"
      ,showWait: true
    }, options );

    if( element.value.trim() === "" && options.submitIfEnter.key === "Enter" ){
      return false;
    }

    if( options.currentPage === options.noSubmitPage ){
      return options.submitIfEnter.key
    }

    return apex.submit({
      request: options.request
      ,submitIfEnter: options.submitIfEnter
      ,showWait: options.showWait
    });

  },

  /**
  * @module blog.ui
  **/
  blog.ui = {

    /**
    * @function blog.ui.setListCurrentItem
    * @example blog.UI.setListCurrentItem({ affectedElements: this.affectedElements, pageItem: "PX_ITEM" });
    **/
    setListCurrentItem: function( options ){

      options = $.extend({
        currentClass: "is-current",
        dataAttrName: "item-id"
      }, options );

      options.affectedElements.find( "li" ).filter( function(){

        var lDataValue = $(this).children( "a" ).data( options.dataAttrName )
          , result = false
        ;

        if( lDataValue ){
          result = $v_CheckValueAgainst(
            options.pageItem
            ,lDataValue
          );
        }

        return result;

      }).addClass( options.currentClass );

    },

    /**
    * @function blog.ui.setDialogTitle
    * @example blog.UI.setDialogTitle("Dialog Title");
    **/
    setDialogTitle: function( title ){
      apex.util.getTopApex().jQuery( ".ui-dialog-content" ).dialog( "option", "title", title );
    }

  };

})(apex.jQuery, blog);
