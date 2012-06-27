//Inline HTML Tooltip script: By JavaScript Kit: http://www.javascriptkit.com
//Created: July 10th, 08'
//changed: dbswh, nov-10, for new jquery version 1.3.2

var htmltooltip={
	tipclass: 'htmltooltip',
	fadeeffect: [true, 500],
	anchors: [],
	tooltips: [], //array to contain references to all tooltip DIVs on the page

	positiontip:function($, tipindex, e){
		var anchor=this.anchors[tipindex]
		var tooltip=this.tooltips[tipindex]
		var scrollLeft=window.pageXOffset? window.pageXOffset : this.iebody.scrollLeft
		var scrollTop=window.pageYOffset? window.pageYOffset : this.iebody.scrollTop
		var docwidth=(window.innerWidth)? window.innerWidth-15 : htmltooltip.iebody.clientWidth-15
		var docheight=(window.innerHeight)? window.innerHeight-18 : htmltooltip.iebody.clientHeight-15
		var tipx=anchor.dimensions.offsetx
		var tipy=anchor.dimensions.offsety+anchor.dimensions.h
		tipx=(tipx+tooltip.dimensions.w-scrollLeft>docwidth)? tipx-tooltip.dimensions.w : tipx //account for right edge
		tipy=(tipy+tooltip.dimensions.h-scrollTop>docheight)? tipy-tooltip.dimensions.h-anchor.dimensions.h : tipy //account for bottom edge
		$(tooltip).css({left: tipx, top: tipy})
	},

	showtip:function($, tipindex, e){
		var tooltip=this.tooltips[tipindex]
		if (this.fadeeffect[0])
			$(tooltip).hide().fadeIn(this.fadeeffect[1])
		else
			$(tooltip).show()
	},

	hidetip:function($, tipindex, e){
		var tooltip=this.tooltips[tipindex]
		if (this.fadeeffect[0])
			$(tooltip).fadeOut(this.fadeeffect[1])
		else
			$(tooltip).hide()	
	},

	updateanchordimensions:function($){
		var $anchors=$('*[rel="'+htmltooltip.tipclass+'"]')
		$anchors.each(function(index){
			this.dimensions={w:this.offsetWidth, h:this.offsetHeight, offsetx:$(this).offset().left, offsety:$(this).offset().top}
		})
	},

	render:function(){
		jQuery(document).ready(function($){
			htmltooltip.iebody=(document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
			var $anchors=$('*[rel="'+htmltooltip.tipclass+'"]')
			var $tooltips=$('div[class="'+htmltooltip.tipclass+'"]')
			$anchors.each(function(index){ //find all links with "title=htmltooltip" declaration
				this.dimensions={w:this.offsetWidth, h:this.offsetHeight, offsetx:$(this).offset().left, offsety:$(this).offset().top} //store anchor dimensions
				this.tippos=index+' pos' //store index of corresponding tooltip
				var tooltip=$tooltips.eq(index).get(0) //ref corresponding tooltip
				if (tooltip==null) //if no corresponding tooltip found
					return //exist
				tooltip.dimensions={w:tooltip.offsetWidth, h:tooltip.offsetHeight}
				$(tooltip).remove().appendTo('body') //add tooltip to end of BODY for easier positioning
				htmltooltip.tooltips.push(tooltip) //store reference to each tooltip
				htmltooltip.anchors.push(this) //store reference to each anchor
				var $anchor=$(this)
				$anchor.hover(
					function(e){ //onMouseover element
						htmltooltip.positiontip($, parseInt(this.tippos), e)
						htmltooltip.showtip($, parseInt(this.tippos), e)
					},
					function(e){ //onMouseout element
						htmltooltip.hidetip($, parseInt(this.tippos), e)
					}
				)
				$(window).bind("resize", function(){htmltooltip.updateanchordimensions($)})
			})
		})
	}
}

htmltooltip.render()