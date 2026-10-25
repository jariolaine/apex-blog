/**
* @namespace blog
**/
window.blog = window.blog || {};

(function($, blog) {
  "use strict";

  const LOG_PREFIX = "[blog.public]";

  /*
   * @module blog.ui
   */
  blog.ui = {

    /*
     * @function blog.ui.setListCurrentItem
     * @example blog.ui.setListCurrentItem( this.affectedElements, { pageItem: "PX_ITEM", currentClass: "is-current" } );
     * @summary set list cached item class indicate current page
     * @desc global page lists are cached use passed parameters to set class to list that indicate current page.
     */
    setListCurrentItem: function (region$, options) {
      options = $.extend(
        {
          currentClass: "is-current",
          dataAttrName: "item-id"
        },
        options
      );

      const selector = `a[data-${options.dataAttrName}]`;
      const links$ = region$.find(selector);

      apex.debug.info(
        LOG_PREFIX,
        "Setting current list item.",
        {
          pageItem: options.pageItem,
          selector: selector,
          linkCount: links$.length
        }
      );

      links$
        .removeAttr("aria-current")
        .closest("li")
        .removeClass(options.currentClass);

      const currentLinks$ = links$.filter(function () {
        return $v_CheckValueAgainst(
          options.pageItem,
          $(this).attr(`data-${options.dataAttrName}`)
        );
      });

      currentLinks$
        .attr("aria-current", "page")
        .closest("li")
        .addClass(options.currentClass);

      apex.debug.info(
        LOG_PREFIX,
        "Current list item updated.",
        {
          matchedCount: currentLinks$.length
        }
      );
    },

    /*
     * @function blog.ui.setDialogTitle
     * @example blog.ui.setDialogTitle("Dialog Title");
     * @summary set dialog title
     * @desc set dynamically dialog page title.
     */
    setDialogTitle: function( title ){
      apex.util.getTopApex().jQuery(
        ".ui-dialog-content"
      ).dialog( "option", "title", title );
    }

  };

  /*
   * @module blog.plugin
   */
  blog.plugin = {

    /*
     * @module blog.plugin.mathQuestionField
     */
    mathQuestionField : {

      /*
       * @function blog.plugin.mathQuestionField.getQuestion
       * @example blog.comment.question( "ajaxIdentifier": "xxxx" );
       * @summary set question field label
       * @desc set result from ajax call to item label. function relates question field APEX plugin.
       */
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
