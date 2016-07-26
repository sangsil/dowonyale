<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>도원예일언어심리센터</title>
<link rel="icon" href="/images/favicon.ico" type="image/x-icon"/>
<link type="text/css" href="/css/jquery-ui-1.8.20.custom.css" rel="stylesheet"/>
<link type="text/css" href="/css/style_thanks.css" rel="stylesheet"/>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/js/jquery.form.js"></script>
<script type="text/javascript">
$(function(){
	$(".overlay_bg, .more01_popup, .more02_popup, .more03_popup").hide();
	
	//목표수
	var fullCnt = 500;
	var cntPer = Math.round(("${cnt}"/fullCnt)*100);
	//alert(cntPer);
	if(cntPer > 80){
		$("#bottle").attr("src","/images/bottle_100.gif");
	}
	else if((cntPer <= 80) && (cntPer > 60)){
		$("#bottle").attr("src","/images/bottle_80.gif");
	}
	else if((cntPer <= 60) && (cntPer > 40)){
		$("#bottle").attr("src","/images/bottle_60.gif");
	}
	else if((cntPer <= 40) && (cntPer > 20)){
		$("#bottle").attr("src","/images/bottle_40.gif");
	}
	else if((cntPer <= 20) && (cntPer > 0)){
		$("#bottle").attr("src","/images/bottle_20.gif");
	}
	else{
		$("#bottle").attr("src","/images/bottle_0.png");
	}
	
	//alert(("${cnt}"/fullCnt)*100);
	
	$(".more_btn01").click(function(){
		$(".overlay_bg").show();
		$(".more01_popup").show();
	});
	$(".more01_popup, #more01_close_btn").click( function() {
		$(".overlay_bg").hide();
		$(".more01_popup").hide();
	});
	
	$(".more_btn02").click(function(){
		$(".overlay_bg").show();
		$(".more02_popup").show();
	});
	$(".more02_popup, #more02_close_btn").click( function() {
		$(".overlay_bg").hide();
		$(".more02_popup").hide();
	});
	
	$(".more_btn03").click(function(){
		$(".overlay_bg").show();
		$(".more03_popup").show();
		$("#list").load("/user/list.dowon?account="+$('input[name=account]').val());
	});
	$("#more03_close_btn").click( function() {
		$(".overlay_bg").hide();
		$(".more03_popup").hide();
	});
	
	$("#btn_main").click(function(){
		location.href = "/user/main.dowon?account="+$('input[name=account]').val();
	});
});
</script>
</head>
<body>

<div id="thanks_bg">
	<input type="hidden" name="account" value="${memberInfo.account }"/>
	<div id="thanks">
		<div id="name_text">${memberInfo.member_name }</div>
		<div id="thanks_text"><sup><img src="/images/text_01.png"/></sup> ${param.cmnt } <sup><img src="/images/text_02.png"/></sup></div>		
		<div id="cnt">${cnt }</div>
		<div id="money"><fmt:formatNumber value="${cnt * 5000}" type="number"/></div>
		<div id="bottle_gif"><img src="/images/bottle_0.png" id="bottle"/></div>
		<div id="pwder_gif"><img src="/images/ani_powder.gif"/></div>
		<div id="btn_main"><img src="/images/btn_back.png" class="button"/></div>
	</div>

	<div id="footer">
		<div class="more_btn01"><img src="/images/btn_arrow.png" class="button"/></div>
		<div class="more_btn02"><img src="/images/btn_arrow.png" class="button"/></div>
		<div class="more_btn03"><img src="/images/btn_arrow.png" class="button"/></div>
		<div id="footer_table">
			<table width="100%">
				<tbody>
					<c:if test="${empty newResultList }">
						<tr><td colspan="2">등록된 글이 없습니다</td></tr>
					</c:if>
					<c:if test="${not empty newResultList}">
					<c:forEach var="List" items="${ newResultList }">
					<tr>
						<td align="left" width="200" height="20"><font color="#ffffff" size="2">${List.cmnt }</font></td>
						<td align="left" width="100" height="20"><font color="#ffffff" size="2">
							<c:out value="${fn:substring(List.reg_dtti,0,4)}"/>-<c:out value="${fn:substring(List.reg_dtti,4,6)}"/>-<c:out value="${fn:substring(List.reg_dtti,6,8)}"/>
							</font>
						</td>
					</tr>
					</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		
		<div class="overlay_bg"></div>
		<div class="more01_popup" style="background-image: url('/images/pop01_bg.png')">
			<div id="more01_close_btn"><img src="/images/btn_close.png" class="button"/></div>
		</div>
		<div class="more02_popup" style="background-image: url('/images/pop02_bg.png')">
		  <div id="more02_close_btn"><img src="/images/btn_close.png" class="button"/></div>
		</div>		
		<div class="more03_popup" style="background-image: url('/images/pop03_bg.png')">
			<div id="more03_close_btn"><img src="/images/btn_close.png" class="button"/></div>
			<div id="list"></div>			
		</div>
	</div>
</div>
</body>
</html>