 /**
 * @namespace blog
 **/
 var blog = blog || {};

(function($, blog) {

	/*
	 * jQuery plugin: fieldSelection - v1.0.0 - last change: 2017/12/05
	 * Sustained by Nikolas Leite - https://github.com/nikolasmagno
	 * Started by (c) 2006 Alex Brem <alex@0xab.cd> - http://blog.0xab.cd
	 */
	var fieldSelection = {

		getSelection: function() {

			var e = (this.jquery) ? this[0] : this;

			return (

				/* mozilla / dom 3.0 */
				('selectionStart' in e && function() {
					var l = e.selectionEnd - e.selectionStart;
					return { start: e.selectionStart, end: e.selectionEnd, length: l, text: e.value.substr(e.selectionStart, l) };
				}) ||

				/* exploder */
				(document.selection && function() {

					e.focus();

					var r = document.selection.createRange();
					if (r === null) {
						return { start: 0, end: e.value.length, length: 0 }
					}

					var re = e.createTextRange();
					var rc = re.duplicate();
					re.moveToBookmark(r.getBookmark());
					rc.setEndPoint('EndToStart', re);

					return { start: rc.text.length, end: rc.text.length + r.text.length, length: r.text.length, text: r.text };
				}) ||

				/* browser not supported */
				function() { return null; }

			)();

		},

		replaceSelection: function() {

			var e = (this.jquery) ? this[0] : this;
			var text = arguments[0] || '';

			return (

				/* mozilla / dom 3.0 */
				('selectionStart' in e && function() {
					e.value = e.value.substr(0, e.selectionStart) + text + e.value.substr(e.selectionEnd, e.value.length);
					return this;
				}) ||

				/* exploder */
				(document.selection && function() {
					e.focus();
					document.selection.createRange().text = text;
					return this;
				}) ||

				/* browser not supported */
				function() {
					e.value += text;
					return $(e);
				}

			)();

		}

	};

	$.each(fieldSelection, function(i) { $.fn[i] = this; });

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

	/**
	* @module blog.plugin
	**/
	blog.plugin = {

	  /**
	  * @function wrapSelection
	  * @example blog.plugin.wrapSelection( 'code', 'Px_ITEM_NAME' );
	  **/
	  wrapSelection: function ( pTag, pItemName ) {

	    var $Item 	= $( $x( pItemName ) ),
			startTag		= "<" + pTag + ">",
			endTag			= "</" + pTag + ">"
			selectedTxt = $Item.getSelection().text;

	    $Item.focus().replaceSelection( startTag + selectedTxt  + endTag );

	  }

	};

})(apex.jQuery, blog);

// on page ready
// hide automatically success message
apex.jQuery(function() {
  apex.theme42.util.configAPEXMsgs({
    autoDismiss: true
    // duration is optional (Default is 3000 milliseconds)
    ,duration: 5000
  });
});
