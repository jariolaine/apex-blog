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
  * @module blog.UI
  **/
  blog.UI = {

    /**
    * @function setListCurrentItem
    * @example blog.UI.setListCurrentItem({ affectedElements: this.affectedElements, pageItem: "PX_ITEM" });
    **/
    setListCurrentItem: function(options){

      options = $.extend({
        currentClass: "is-current",
        dataAttrName: "blog-content-id"
      }, options );

      options.affectedElements.find( "li" ).filter( function(){

        var lDataValue = $(this).children( "a" ).data( options.dataAttrName ),
            result = false
        ;

        if( lDataValue ){
          result = $v_CheckValueAgainst(
             options.pageItem
            ,lDataValue
          );
        }

        return result;

      }).addClass( options.currentClass );

    }

  };

})(apex.jQuery, blog);
