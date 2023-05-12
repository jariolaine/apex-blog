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
  * @example return blog.search( { element: this, currentPage:'&APP_PAGE_ID.',submitIfEnter:event } )
  * @summary hadle search field
  * @desc submit page if enter is pressed, search field is not empty and parameters currentPage and noSubmitPage are not same.
  **/
  blog.search = function( options ){

    options = $.extend({
      noSubmitPage: "4"
      ,request: "SEARCH"
      ,showWait: true
    }, options );

    if( options.element.value.trim() === "" && options.submitIfEnter.key === "Enter" ){
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

  };

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
    * @summary set dialog title
    * @desc set dynamically dialog page title.
    **/
    setDialogTitle: function( title ){
      apex.util.getTopApex().jQuery( ".ui-dialog-content" ).dialog( "option", "title", title );
    }

  };

  /**
  * @module blog.comment
  **/
  blog.comment = {

    /**
    * @function blog.comment.question
    * @example blog.comment.question( "ajaxIdentifier": "xxxx" );
    * @summary set question field label
    * @desc set result from ajax call to item label. function relates question field APEX plugin.
    **/
    question: function( options ){

      apex.server.plugin( options.ajaxIdentifier, {}, {
        success:function( data ){

          var this$     = $( "[for=\"" + options.itemId + "\"]" )
            , required$ = this$.children().detach()
          ;

          this$.empty().html( data.label ).append( required$ );

        }

      });

    }

  };

})(apex.jQuery, blog);
