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
	//삭제
	$(".goDelete").click(function() {
		if(confirm("삭제 하시겠습니까?"))
		{
			$("#frm").ajaxSubmit({
				url : "/user/keomu_online_delete.dowon",
				type : "post",
				dataType: "json",
				success: function(result){
					alert("삭제 되었습니다.");
					$(location).attr('href', '/user/keomu_online.dowon');
				},
				error: function(result){
					alert("삭제 오류입니다. 관리자에게 문의하세요.");
				}
			});
		}
	});		
	//수정
	$(".goUpForm").click(function() {
		$("form[name=frm]").attr("action","/user/keomu_online_inUpForm.dowon");
		$("form[name=frm]").submit();
	});		
	
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
						<input type="hidden" name="board_id" value="${result.board_id }" />
						<img src="/images/sub/02_content_05_03.png" alt="온라인상담"/>
						<div id="keomu_online">
					        <table cellspacing="0" cellpadding="3">
					        	<tr class="detailTableTitle">
						        	<td class="col70 txtColor">제목</td><td class="col500"><c:out value="${result.board_title }" /></td>
						        	<td class="col50 txtColor">등록일</td>
						        	<td class="col90">
										<fmt:parseDate var="dateTempParse" value="${result.in_date }" pattern="yyyy-MM-dd HH:mm:ss.S"/>
										<fmt:formatDate value="${dateTempParse }" pattern="yyyy-MM-dd"/>
									</td>
						        	<td class="col50 txtColor">조회</td><td class="col70"><c:out value="${result.hit_cnt }" /></td>
					        	</tr>
					        	<tr>
					        		<td colspan="6" class="detailTxt">${result.board_txt }</td>
					        	</tr>
					        </table>
					        <div class="keomu_table_sub">
						        <div class="goList btn">□목록보기</div>
						        <!-- 로그인 = 등록자면 수정 할 수 있게 -->
						        <c:if test="${result.in_user eq sessionScope.USER_ID}">
							        <c:if test="${result.reply_yn eq 'N'}">
								        <div class="goDelete btn">삭제</div>
								        <div class="goUpForm btn">수정</div>
							        </c:if>	
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
