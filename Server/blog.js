/*
 * jQuery plugin: fieldSelection - v0.1.1 - last change: 2006-12-16
 * (c) 2006 Alex Brem <alex@0xab.cd> - http://blog.0xab.cd
 */

(function() {

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

			var e = (typeof this.id == 'function') ? this.get(0) : this;
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
					return jQuery(e);
				}

			)();

		}

	};

	jQuery.each(fieldSelection, function(i) { jQuery.fn[i] = this; });

})(apex.jQuery);


/**
* @namespace blog
**/
var blog = blog || {};

/**
* @module blog.UI
**/
blog.UI = {

  /**
  * @function formatProgramCode
  * @example blog.UI.formatProgramCode("pre.program-code");
  **/
  formatProgramCode: function( p_selector ){
    var $Elem = apex.jQuery( p_selector );
    
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

    var $Item = apex.item( pItemName );
    $Item.replaceSelection(
      "<" + pTag + ">" 
      + $Item.getSelection().text() 
      + "</" + pTag + ">"
    )

  }

};

/**
* @module blog.editor
**/
blog.editor = {

  /**
  * @function config
  * @example blog.editor.config( pOptions, pExtraCssFile );
  **/
  config: function( pOptions, pExtraCssFile ){
    //pOptions.forcePasteAsPlainText=true;
    pOptions.entities_additional="#35,#39";
    pOptions.startupOutlineBlocks=true;

    pOptions.contentsCss=[
       CKEDITOR.getUrl("contents.css")
      ,pExtraCssFile
    ];

    pOptions.allowedContent = {
      $1:{
        // Use the ability to specify elements as an object.
        elements: CKEDITOR.dtd,
        attributes: true,
        styles: true,
        classes: true
      }
    };

    pOptions.disallowedContent = "script; *[on*]";

    pOptions.stylesSet=[
      {name:"Program Code",element:"pre",attributes:{"class":"program-code"}},
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
    ];

    return pOptions;
  
  }
}
