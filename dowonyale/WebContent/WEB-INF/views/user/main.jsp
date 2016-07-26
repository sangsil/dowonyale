<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<meta name="description" content="울산 북구 연암동 뚜레주르2층. 언어치료, 놀이치료, 감각통합, 발달검사 제공">
<meta property="og:type" content="website">
<meta property="og:title" content="도원예일언어심리센터">
<meta property="og:description" content="울산 북구 연암동 뚜레주르2층. 언어치료, 놀이치료, 감각통합, 발달검사 제공">
<meta property="og:image" content="http://dowonyale.com/images/01_top_logo.png">
<meta property="og:url" content="http://dowonyale.com">


<title>도원예일언어심리센터</title>
<link rel="icon" href="/images/favicon.ico" type="image/x-icon"/>
<link href="/css/redmond/jquery-ui-1.10.2.custom.min.css" rel="stylesheet"/>
<link type="text/css" href="/css/main.css" rel="stylesheet"/>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/js/jquery.form.js"></script>
<script src="/js/jquery.alphanumeric.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/plugIns/bPopup/bPopup.js"></script>

<script type="text/javascript">
$(function(){
	//말풍선이미지
	$(".overDiv_01").hover(function(){$(".overImg_01").show();},function(){$(".overImg_01").hide();});
	$(".overDiv_02").hover(function(){$(".overImg_02").show();},function(){$(".overImg_02").hide();});
	$(".overDiv_03").hover(function(){$(".overImg_03").show();},function(){$(".overImg_03").hide();});
	$(".overDiv_04").hover(function(){$(".overImg_04").show();},function(){$(".overImg_04").hide();});
	$(".overDiv_05").hover(function(){$(".overImg_05").show();},function(){$(".overImg_05").hide();});
	//버튼이미지
	$(".online, .jaga").hover( 
		function(){
			if($(this).attr("class").indexOf('jaga') >= 0){
				$(".jaga").css("background-image", "url(/images/01_btn_jindan_d.png)");  
			}
			else{
				$(".online").css("background-image", "url(/images/01_btn_online_d.png)");  
			}
		},
		function(){
			$(".jaga").css("background-image", "url(/images/01_btn_jindan_n.png)");
			$(".online").css("background-image", "url(/images/01_btn_online_n.png)");
		}
	);
	
	$(".jaga").bind("click",function(){$(location).attr('href', '/user/jaga_adhd.dowon');});
	$(".online").bind("click",function(){$(location).attr('href', '/user/keomu_online.dowon');});

	$(".overDiv_01").bind("click",function(){$(location).attr('href', '/user/chiryo_geurup.dowon'); $(".overImg_01").hide();});
	$(".overDiv_02").bind("click",function(){$(location).attr('href', '/user/chiryo_nolyi.dowon'); $(".overImg_02").hide();});
	$(".overDiv_03").bind("click",function(){$(location).attr('href', '/user/chiryo_eoneo.dowon'); $(".overImg_03").hide();});
	$(".overDiv_04").bind("click",function(){$(location).attr('href', '/user/chiryo_inji.dowon'); $(".overImg_04").hide();});
	$(".overDiv_05").bind("click",function(){$(location).attr('href', '/user/chiryo_bumo.dowon'); $(".overImg_05").hide();});
	
	//news 클릭시 게시판 이동
	$(".goKeomu").bind("click",function(){
		$("input[name=board_id]").val($(this).attr("id"));
		if($(this).attr("title") == "1"){//공지사항
			$("form[name=frm]").attr("action","/user/keomu_gongji_detail.dowon");
		}
		else if($(this).attr("title") == "2"){//교육공지
			$("form[name=frm]").attr("action","/user/keomu_gyoyuk_detail.dowon");
		}
		else{
			$("form[name=frm]").attr("action","/user/keomu_gongji_detail.dowon");
		}
			
		$("form[name=frm]").submit(); 		
	});
	
	
	<c:if test="${not empty resultList_popup}">
		<c:forEach items="${resultList_popup}" var="item" varStatus="status">
		
// 		if(browserCheck != "PC"){
			
// 			// 팝업 
// 			var settings = "width=${item.popup_width}, height=${item.popup_height}, top=${item.popup_top}, left=${item.popup_left}, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes";
// 			var myWindow = window.open("${item.popup_title}", "popWindow_${item.popup_id}", settings);
// 			if(myWindow != undefined){
// 				myWindow.document.write();
// 			}
// 		}else{
			var divStr = '<div class="mainPopup_${item.popup_id}"><span class="bPopButton b-close"><span>X</span></span><span class="popupContent_${item.popup_id}">bPopup</span></div>';
			$(".addPopDiv").append(divStr);
			var self = $(this) //button
	        , content = $('.popupContent_${item.popup_id}'); 
			$(".mainPopup_${item.popup_id}").bPopup({
				// modalClose: false,	// 배경누르면 팝업 닫힘
				fadeSpeed: 'slow', //can be a string ('slow'/'fast') or int
	            followSpeed: 1500, //can be a string ('slow'/'fast') or int
	            opacity: "0.0",
	            // opacity: "${0.7 / fn:length(resultList_popup)}",
				position: [parseInt('${item.popup_left}'), parseInt('${item.popup_top}')], //x, y
				positionStyle: 'absolute', //'fixed' or 'absolute'
			    onOpen: function() {
	                content.html('${item.popup_txt}');
	            },
	            onClose: function() {
	                content.empty();
	            }
			});
// 		}
		
		</c:forEach>
	</c:if>

	
});
</script>
</head>


<body>
<!--	wrap	-->
<div class="wrap">
	<!--	container	-->
    <div class="container">
        
        <jsp:include page="/common/header.dowon" />
        
        <!--	contents	-->
    	<div class="contents">
          <div class="overDiv_01 btn"></div>
          <div class="overDiv_02 btn"></div>
          <div class="overDiv_03 btn"></div>
          <div class="overDiv_04 btn"></div>
          <div class="overDiv_05 btn"></div>
          <div class="overImg_01"></div>
          <div class="overImg_02"></div>
          <div class="overImg_03"></div>
          <div class="overImg_04"></div>
          <div class="overImg_05"></div>
        
		<form id="frm" name="frm" method="post" action="">
			<input type="hidden" name="board_id" />
    	  <div class="news">
			<table width="350" border="0" cellspacing="0" cellpadding="3">
				<c:if test="${empty resultList }">
					<tr>
						<td colspan="2">등록된 글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty resultList}">
					<c:forEach var="result" items="${resultList }">
						<tr class="goKeomu btn" id="${result.board_id}" title="${result.board_gbn}">
							<td width="200px">
								<c:choose>
									<c:when test="${fn:length(result.board_title) gt 16 }">
										<c:out value="${fn:substring(result.board_title,0,16) }" /> ...
									</c:when>
									<c:otherwise>
										<c:out value="${result.board_title}" />
									</c:otherwise>
								</c:choose>
							</td>
							<td><fmt:parseDate var="dateTempParse" value="${result.in_date }" pattern="yyyy-MM-dd HH:mm:ss.S"/>
								<fmt:formatDate value="${dateTempParse }" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
					</c:forEach>
				</c:if>
            </table>
          </div>
		</form>
    	  <div class="direcLink">
	        <div class="online btn"></div>
    	    <div class="jaga btn"></div>                   
          </div> 
        </div>

		<jsp:include page="/common/footer.dowon" />

    </div>
    <!--	contents	-->
     
    <!-- 메인팝업 -->
    <div class="addPopDiv"></div>
</div>
<!--	wrap	-->
<div class="footer_bg"></div>
</body>
</html>
