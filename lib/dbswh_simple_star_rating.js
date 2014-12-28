/* 
 * DBSWH Simple Star Rating v1.0
 * This JavaScript is based on the
 * Matt O'Neill | jSimple-Star-Rating
 * https://github.com/MattONeillUK/jSimple-Star-Rating
 */
(function ($) {
    $.fn.starRating = function (s) {
        return this.each(function () {
            var $ratingElement = $(this),
            $ratingField = $ratingElement.children("ul"),
			$ratingDialog = $ratingElement.children("div"),
            $ratingFieldItem = $ratingField.children(),
            rating = 0;
			$ratingDialog.dialog({
				modal:true,
				autoOpen:false,
				buttons:{"OK":function(){$(this).dialog("close")}}
			});
            $ratingFieldItem.on({
                click: function () {
					rating = $(this).index() + 1;
					$ratingFieldItem.removeClass("enabled active hover");
					$("li:lt(" +  rating + ")", $ratingField).addClass("active");
					$("label[for="+ $ratingElement.attr("id") +"]").remove();
					$ratingFieldItem.off();
					$ratingField.off();
					apex.server.process("RATE_ARTICLE",{
						x01: rating
					},{
						success:function(){
							$ratingDialog.dialog("open")
						}
					});
                },
                mouseenter: function () {
                    $("li:lt(" + ($(this).index() + 1) + ")", $ratingField).addClass("hover").removeClass("active");
                    $("li:gt(" + ($(this).index()) + ")", $ratingField).removeClass("hover active");
                },
                mouseleave: function () {
                    $(this).parent().children("li:gt(" + ($(this).index()) + ")").removeClass("hover");
                }
            });
            $ratingField.on({
                mouseleave: function () {
                    $ratingFieldItem.removeClass("hover");
					$("li:lt(" + ($ratingElement.data("val")) + ")", $ratingField).addClass("active");
                }
            });
        });
    };
}(apex.jQuery));
