
// 브라우저체크
var UserAgent = navigator.userAgent;
var browserCheck="";
if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null)
{
	browserCheck = "MOBILE";
}
else
{
	browserCheck = "PC";
}

// 푸터 배경
$(function(){
	
	if(browserCheck == "MOBILE"){
		$(".footer_bg").css("width", $(".wrap").css("width"));
		$(".footer_bg").css("height", $(window).height());
	}
	
//	if($(window).height() > $("body").height()){
//		$(".footer_bg").find("td").attr("height",$(window).height()-$(".contents").height());
//	}
//	else{
//		$(".footer_bg").find("td").attr("height",$(".wrap").height()-$("body").height());
//	}
	
	
//	alert("$(window).height():"+$(window).height()
//			+"\n"+ "$(window).width():"+$(window).width()
//			+"\n"+ "$('.wrap').css('width'):"+$('.wrap').css('width')
//			+"\n"+ "$('.wrap').css('height'):"+$('.wrap').css('height')
//			+"\n"+ "$('body').css('height'):"+$('body').css('height')
//			+"\n"+ "$('body').css('width'):"+$('body').css('width')
//	);
	
//	var footer_bgWidth = "";
//	if(browserCheck == "MOBILE"){
//		footer_bgWidth = $(".wrap").css("width");
//	}else{
//		footer_bgWidth = $(window).width();
//	}
	
//	$(".footer_bg").css("width", footer_bgWidth);
});