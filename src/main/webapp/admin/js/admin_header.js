/**
 * 
 */

$(document).ready(function() {
	
		
		$(".user a").click(function() {
			$(this).parent("div").children(".tes_list").slideToggle('fast');
			
			if($(this).children("span").attr("class")=="icon_minus"){
				$(this).children("span").attr("class","icon_plus");
			}else{
				$(this).children("span").attr("class","icon_minus");
			}
		});
	
	$("#menu ul li").hover(function() {
		$(this).children("ul").css("visibility","visible");
	}, function() {
		$(this).children("ul").css("visibility","hidden");
	})
	
	// 카테고리 색상변경
	/*
	$("#menu>ul>li>a").click(function() {
		$("#menu>ul>li").removeClass("menu_category");
		$(this).parent("li").addClass("menu_category");
	})
	*/
	
	
	$(".sub_list li").hover(function() {
		$(this).css("background-color","#dddddd");
	}, function() {
		$(this).css("background-color","#efefef");
	})
	
	$(".user ul li").hover(function() {
		$(this).css("font-weight","bold");
	}, function() {
		$(this).css("font-weight","normal");
	})
	
});

