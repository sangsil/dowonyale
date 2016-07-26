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
	
	if("${sessionScope.USER_ID}" == null || "${sessionScope.USER_ID}" ==""){
		$("#tableCmt").show();
	}
	$(".jaga_contents input:radio").on("click", function(){
		if("${sessionScope.USER_ID}" == null || "${sessionScope.USER_ID}" ==""){
			alert("로그인이 필요합니다");
			goLogIn();
			return;
		}
	});
	
	/*	등록	*/
	$("#btn_reg").click(function(e) {
		if("${sessionScope.USER_ID}" == null || "${sessionScope.USER_ID}" ==""){
			alert("로그인이 필요합니다");
			goLogIn();
			return;
		}

		for(var i=1; i<= $("#resultCntView").val(); i++){
			if($(":radio[name='ans_"+i+"']:checked").val() == undefined) {alert(i+" 문항을 확인해 주세요"); $(":radio[name='ans_"+i+"']").focus(); return false;}
		}
		
		if(confirm("제출 하시겠습니까?"))
		{
			$("#frm").ajaxSubmit({
				url : "/user/jaga_hakseubInsert.dowon",
				type : "post",
				dataType: "json",
				success: function(result){
					alert("등록 되었습니다.");
					$("#search_result").text(result.result);
					$("#info_modal").dialog("open");
				},
				error: function(result){
					alert("등록 오류입니다. 관리자에게 문의하세요.");
				}
			});
		}
	});
	
	
	$("#btn_info").bind("click", function(){
		$("#info_modal").dialog("open");
	});
	$("#info_modal").dialog({
		autoOpen: false,
		width: 500,
		modal: true,
		close: function(){
			$(this).dialog("close");
			$("form[name=frm]").attr("action","${default_url}");
			$("form[name=frm]").submit();
		}
	});
});
</script>
</head>


<body>
<!--	wrap	-->
<div class="wrap">
	<!--	container	-->
	<div class="container">
		<jsp:include page="/common/header.dowon" ><jsp:param name="depth1" value="4" /><jsp:param name="depth2" value="3" /></jsp:include>

		<!--	contents	-->
		<div class="contents"> 
		
			<!--	header Img	-->
			<div class="header_bg" style="background-color: #e9f3cd;"><img src="/images/sub/02_bg04.png"  class="header_img"/></div>
			<!--	//header Img	-->

			<!--	navi	-->
			<div class="navi">
				<span class="navigator">Home &gt; 자가진단 &gt; <span class="navi_menu2">학습/반항성/따돌림 체크리스트</span></span>
			</div>  
			<!--	//navi	-->     
			<!--	cont	-->
			<div class="cont">
				<jsp:include page="/common/left.dowon"><jsp:param name="depth1" value="4" /><jsp:param name="depth2" value="3" /></jsp:include>

				<!--	con_body	-->
				<div class="con_body">
					<div id="jaga_hakseub"></div>
					<div id="tableCmt">※ 설문을 제출하시려면 로그인이 필요합니다.</div>
					
					<div class="jaga_contents">
<!-- 						<div id="btn_info" class="btn">INFO</div> -->
						<form action="" id="frm" name="frm" method="post">
							<input type="hidden" id="resultCntView" name="resultCntView" value="${resultCntView}"/>
							<input type="hidden" id="resultCnt" name="resultCnt" value="${resultCnt}"/>
							<c:set var="default_url" value="/user/jaga_hakseub.dowon"></c:set>
							<table cellspacing="0" cellpadding="3">
								<thead>
									<tr>
										<th>번호</th>
										<th>&nbsp;</th>
										<th>문항내용</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="result" items="${resultList }" varStatus="status">
									<tr id="${result.jindan_quest_no }">
										<td>
											<c:choose>
												<c:when test="${status.count%3 eq 1}">
													<c:out value="${result.jindan_quest_no }" />
												</c:when>
												<c:otherwise>&nbsp;</c:otherwise>
											</c:choose>
											<input type="hidden" name="jindan_quest_no" value="${result.jindan_quest_no }"/>
										</td>
										<td>
											<c:choose>
												<c:when test="${status.count%3 eq 1}">
													<input type="radio" name="ans_${result.jindan_quest_no }" value="${result.jindan_sub_quest_no }"/>
												</c:when>
												<c:when test="${status.count%3 eq 2}">
													<input type="radio" name="ans_${result.jindan_quest_no }" value="${result.jindan_sub_quest_no }"/>
												</c:when>
												<c:otherwise>
													<input type="radio" name="ans_${result.jindan_quest_no }" value="${result.jindan_sub_quest_no }"/>
												</c:otherwise>
											</c:choose>
										</td>
										<td><c:out value="${result.jindan_txt }" /></td>
									</tr>
								</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="6" class="a_right"><div id="btn_reg" class="jaga_table_sub btn">제출</div></td>
									</tr>
								</tfoot>
							</table>
						</form>
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

<!-- infoDialog -->
<div id="info_modal" title="결과">
	<div>${sessionScope.USER_NAME} 님의 점수는 <span id="search_result"></span> 점 입니다</div>
	<table class="modal_info" id="modal_info" border="1" cellspacing="0" cellpadding="3">
		<tr>
			<td class="col300" rowspan="3">
				1) 소아의 우울 정도 측정.<br />
				2) Beck 우울 척도를 8-13세 연령의 소아에 맞도록 변형시킨 문항으로 구성.
			</td>
			<td class="col100">22 ~ 25점</td>
			<td class="col120">약간의 우울 상태</td>
		</tr>
		<tr>
			<td>26 ~ 28점</td>
			<td>당한 우울 상태</td>
		</tr>
		<tr>
			<td>29점 이상점</td>
			<td>매우 심한 우울 상태</td>
		</tr>
    </table>
</div>
<!-- infoDialog -->

<!--	//wrap	-->
<div class="footer_bg"></div>
</body>
</html>
