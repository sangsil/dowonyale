<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>도원예일언어심리센터</title>
<link rel="icon" href="/images/favicon.ico" type="image/x-icon"/>
<link href="/css/redmond/jquery-ui-1.10.2.custom.min.css" rel="stylesheet"/>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/sub_contents.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/js/jquery.form.js"></script>
<script src="/js/jquery.alphanumeric.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript">
$(function(){
	$("#naver_map1").bind("click",function(){
		var opts  = {'url' : 'naverMap.html', 'width' : '300px', 'height' : '300px', 'left': '100px' , 'top' : '300px', 'center': false };
	    // 팝업 미리 호출 windown.open 과 동일하게 어디서나 $.popup으로 호출, 팝업 창이 뜬다.
		window.open('http://map.naver.com/?query='+encodeURL(도원예일언어심리센터),'map',opts);
	});
	$("#daum_map1").bind("click",function(){
		var opts  = {'url' : 'naverMap.html', 'width' : '200px', 'height' : '200px', 'left': '100px' , 'top' : '300px', 'center': false };
	    // 팝업 미리 호출 windown.open 과 동일하게 어디서나 $.popup으로 호출, 팝업 창이 뜬다.
		window.open('/map/daumMap.html','map',opts);
	});
});
</script>
</head>


<body>
<!--	wrap	-->
<div class="wrap">
	<!--	container	-->
	<div class="container">
		<jsp:include page="/common/header.dowon" ><jsp:param name="depth1" value="1" /><jsp:param name="depth2" value="5" /></jsp:include>

		<!--	contents	-->
		<div class="contents"> 
		
			<!--	header Img	-->
			<div class="header_bg" style="background-color: #e7f2fa;"><img src="/images/sub/02_bg01.png"  class="header_img"/></div>
			<!--	//header Img	-->

			<!--	navi	-->
			<div class="navi">
				<span class="navigator">Home &gt; 도원예일소개 &gt; <span class="navi_menu2">찾아오시는길</span></span>
			</div>  
			<!--	//navi	-->     
			<!--	cont	-->
			<div class="cont">
				<jsp:include page="/common/left.dowon"><jsp:param name="depth1" value="1" /><jsp:param name="depth2" value="5" /></jsp:include>

				<!--	con_body	-->
				<div class="con_body">
					<div id="intro_chaja"></div>
						<a href="http://map.naver.com/?query=도원예일언어심리센터" target="_blank"><div id="naver_map"></div></a>
						<a href="http://local.daum.net/map/index.jsp?q=도원예일언어심리센터" target="_blank"><p id="daum_map"></p></a>
				</div>
				<!--	con_body	-->            
			</div>
			<!--	//cont	-->        

		</div>
	<!--	contents	-->
		<jsp:include page="/common/footer.dowon" />
	</div>
	<!--	//container	-->
</div>
<!--	//wrap	-->
<div class="footer_bg"></div>
</body>
</html>
