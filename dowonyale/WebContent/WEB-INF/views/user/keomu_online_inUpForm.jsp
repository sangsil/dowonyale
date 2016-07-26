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
<script type="text/javascript" src="/plugIns/SE2.3.4.O10204/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
	
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "board_txt",
		sSkinURI: "/plugIns/SE2.3.4.O10204/SmartEditor2Skin.html",	
		fCreator: "createSEditor2"
	});
	
	$("#board_title").focus();
	
	
	/*	등록	*/
	$("#btn_reg").click(function() {
		if($("#board_title").val().length < 1) {alert("제목을 입력해 주세요"); $("#board_title").focus(); return false;}
	    // 에디터의 내용이 textarea에 적용된다.
	    oEditors.getById["board_txt"].exec("UPDATE_CONTENTS_FIELD", []);
	    // 에디터의 내용에 대한 값 검증은 이곳에서
	    if ($("#board_txt").val() == "<br>") {alert("내용을 입력하세요");	return false;}
	    
	    var regUrl="";
		if($("#board_id").val() != "" && $("#board_id").val() != null){
			regUrl = "/user/keomu_online_update.dowon";
		}
		else{
			regUrl = "/user/keomu_online_insert.dowon";
		}
		if(confirm("등록 하시겠습니까?"))
		{
			$("#frm").ajaxSubmit({
				url : regUrl,
				type : "post",
				dataType: "json",
				success: function(result){
					alert("등록 되었습니다.");
					$(location).attr('href', '/user/keomu_online.dowon');
				},
				error: function(result){
					alert("등록 오류입니다. 관리자에게 문의하세요.");
				}
			});
		}
	});
	/*	//등록	*/
	
	
	$(".goList").bind("click",function(){
		$(location).attr('href', '/user/keomu_online.dowon');
	});
	
});
</script>
</head>


<body>
<!--	wrap	-->
<div class="wrap">
	<!--	container	-->
	<div class="container">
		<jsp:include page="/common/header.dowon" ><jsp:param name="depth1" value="5" /><jsp:param name="depth2" value="3" /></jsp:include>

		<!--	contents	-->
		<div class="contents"> 
		
			<!--	header Img	-->
			<div class="header_bg" style="background-color: #e7f2fa;"><img src="/images/sub/02_bg05.png"  class="header_img"/></div>
			<!--	//header Img	-->

			<!--	navi	-->
			<div class="navi">
				<span class="navigator">Home &gt; 커뮤니티 &gt; <span class="navi_menu2">온라인상담</span></span>
			</div>  
			<!--	//navi	-->     
			<!--	cont	-->
			<div class="cont">
				<jsp:include page="/common/left.dowon"><jsp:param name="depth1" value="5" /><jsp:param name="depth2" value="3" /></jsp:include>

				<!--	con_body	-->
				<div class="con_body">
					<form id="frm" name="frm" method="post" action="">
						<c:set var="default_url" value="/user/keomu_online.dowon"></c:set>
						<input type="hidden" name="board_id" id="board_id" value="<c:out value='${result.board_id }' />"/>
						<img src="/images/sub/02_content_05_03.png" alt="온라인상담"/>
						<div id="keomu_online">
					        <table cellspacing="0" cellpadding="3">
					        	<tr class="detailTableTitle">
						        	<td class="col30 txtColor">제목</td>
						        	<td><input type="text" name="board_title" id="board_title" size="110" maxlength="100" value='<c:out value="${result.board_title }" />' /></td>
					        	</tr>
					        	<tr>
					        		<td colspan="2"><textarea name="board_txt" id="board_txt" rows="8" cols="70" style="width:765px;">${result.board_txt }</textarea></td>
					        	</tr>
					        </table>
					        <div class="keomu_table_sub">
						        <div class="goList btn">□목록보기</div>
						        <div class="goNext btn" id="btn_reg">등록</div>
						        <c:if test="${not empty result.board_id}">
<!-- 							        <div class="goPre btn">삭제</div> -->
						        </c:if>
					        </div>
						</div>
					</form>
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
