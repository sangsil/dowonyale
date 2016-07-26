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
	$('#center_slideBar li').click(function(){
		
		//모든 이미지 off로 초기화
		$("#center_slideBar li img").each(function(i){
			$("#center_slide_img"+(i+1)+" img").attr("src",$("#center_slide_img"+(i+1)+" img").attr("src").replace("_d", ""));
		});
		var imgSrc = $(this).find("img").attr("src");
		//클릭시 ON 이미지로 바꿈
		$(this).find("img").attr("src",imgSrc.substring(0,imgSrc.length-4)+"_d.png");
		
		var dataLeft=$(this).attr('data-left');
		//$('#slideConteiner').css('left',dataLeft);
		$('#slideConteiner').animate({left:dataLeft},"slow");
	});
	$('#center_slideBar li').mouseover(function(){
		
		//모든 이미지 off로 초기화
		$("#center_slideBar li img").each(function(i){
			$("#center_slide_img"+(i+1)+" img").attr("src",$("#center_slide_img"+(i+1)+" img").attr("src").replace("_d", ""));
		});
		var imgSrc = $(this).find("img").attr("src");
		//클릭시 ON 이미지로 바꿈
		$(this).find("img").attr("src",imgSrc.substring(0,imgSrc.length-4)+"_d.png");
		
	});
});
</script>
</head>


<body>
<!--	wrap	-->
<div class="wrap">
	<!--	container	-->
	<div class="container">
		<jsp:include page="/common/header.dowon" ><jsp:param name="depth1" value="1" /><jsp:param name="depth2" value="4" /></jsp:include>

		<!--	contents	-->
		<div class="contents"> 
		
			<!--	header Img	-->
			<div class="header_bg" style="background-color: #e7f2fa;"><img src="/images/sub/02_bg01.png"  class="header_img"/></div>
			<!--	//header Img	-->

			<!--	navi	-->
			<div class="navi">
				<span class="navigator">Home &gt; 도원예일소개 &gt; <span class="navi_menu2">센터둘러보기</span></span>
			</div>  
			<!--	//navi	-->     
			<!--	cont	-->
			<div class="cont">
				<jsp:include page="/common/left.dowon"><jsp:param name="depth1" value="1" /><jsp:param name="depth2" value="4" /></jsp:include>

				<!--	con_body	-->
				<div class="con_body">
					<div id="intro_center"></div>
					<div id="intro_center_wrap">
					
						<div id="slideConteiner">
							<img src="/images/sub/center/02_center_01.png" alt="" />
							<img src="/images/sub/center/02_center_02.png" alt="" />
							<img src="/images/sub/center/02_center_03.png" alt="" />
							<img src="/images/sub/center/02_center_04.png" alt="" />
							<img src="/images/sub/center/02_center_05.png" alt="" />
							<img src="/images/sub/center/02_center_06.png" alt="" />
							<img src="/images/sub/center/02_center_07.png" alt="" />
							<img src="/images/sub/center/02_center_08.png" alt="" />
							<img src="/images/sub/center/02_center_09.png" alt="" />
							<img src="/images/sub/center/02_center_10.png" alt="" />
						</div>
<!-- 						<ul id="slideBar"> -->
<!-- 							<li class="active" data-left="0px"></li> -->
<!-- 							<li data-left="-640px"><img src="/images/sub/center/02_center_btn01.png" alt="" /></li> -->
<!-- 							<li data-left="-1280px"><img src="/images/sub/center/02_center_btn02.png" alt="" /></li> -->
<!-- 							<li data-left="-1920px"><img src="/images/sub/center/02_center_btn03.png" alt="" /></li> -->
<!-- 							<li data-left="-2560px"><img src="/images/sub/center/02_center_btn04.png" alt="" /></li> -->
<!-- 							<li data-left="-3200px"><img src="/images/sub/center/02_center_btn05.png" alt="" /></li> -->
<!-- 							<li data-left="-3840px"><img src="/images/sub/center/02_center_btn06.png" alt="" /></li> -->
<!-- 							<li data-left="-4480px"><img src="/images/sub/center/02_center_btn07.png" alt="" /></li> -->
<!-- 						</ul> -->
					
					</div>
					<div id="slide_icon">
						<ul id="center_slideBar">
							<li id="center_slide_img1"  data-left="0px"><img src="/images/sub/center/02_center_btn01_d.png"  alt="1" /></li>
							<li id="center_slide_img2"  data-left="-777px" ><img src="/images/sub/center/02_center_btn02.png" alt="2" /></li>
							<li id="center_slide_img3"  data-left="-1554px"><img src="/images/sub/center/02_center_btn03.png" alt="3" /></li>
							<li id="center_slide_img4"  data-left="-2331px"><img src="/images/sub/center/02_center_btn04.png" alt="4" /></li>
							<li id="center_slide_img5"  data-left="-3108px"><img src="/images/sub/center/02_center_btn05.png" alt="5" /></li>
							<li id="center_slide_img6"  data-left="-3885px"><img src="/images/sub/center/02_center_btn06.png" alt="6" /></li>
							<li id="center_slide_img7"  data-left="-4662px"><img src="/images/sub/center/02_center_btn07.png" alt="7" /></li>
							<li id="center_slide_img8"  data-left="-5439px"><img src="/images/sub/center/02_center_btn08.png" alt="8" /></li>
							<li id="center_slide_img9"  data-left="-6216px"><img src="/images/sub/center/02_center_btn09.png" alt="9" /></li>
							<li id="center_slide_img10" data-left="-6993px"><img src="/images/sub/center/02_center_btn10.png"  alt="10" /></li>
						</ul>					
					</div>
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
