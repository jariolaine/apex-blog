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
      ,duration: 5000
    });
  });

	/**
	* @module blog.UI
	**/
	blog.UI = {

	  /**
	  * @function formatProgramCode
	  * @example blog.UI.formatProgramCode("pre.program-code");
	  **/
	  formatProgramCode: function( p_selector ){
	    var $Elem = $( p_selector );

	    $Elem.html (function( ind, oldHTML ){

	      var lrows = [];
	      lrows = oldHTML.split( "\n" );

	      if( lrows && lrows.length ){

	        while( lrows.length > 0 && lrows[lrows.length - 1].trim().length === 0 ){
	          lrows.pop();
	        }

	        if( lrows && lrows.length ){
	          return "<code>" + lrows.join( "</code>\n<code>" ) + "</code>";
	        }

	      }

	    });

	  },

	};

})(apex.jQuery, blog);
