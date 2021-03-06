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

		for(var i=1; i<= $("#resultCnt").val(); i++){
			if($(":radio[name='ans_"+i+"']:checked").val() == undefined) {alert(i+" 문항을 확인해 주세요"); $(":radio[name='ans_"+i+"']").focus(); return false;}
		}
		
		if(confirm("제출 하시겠습니까?"))
		{
			$("#frm").ajaxSubmit({
				url : "/user/jaga_adhdInsert.dowon",
				type : "post",
				dataType: "json",
				success: function(result){
					alert("등록 되었습니다.");
// 					$("form[name=frm]").attr("action","${default_url}");
// 					$("form[name=frm]").submit();
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
		<jsp:include page="/common/header.dowon" ><jsp:param name="depth1" value="4" /><jsp:param name="depth2" value="1" /></jsp:include>

		<!--	contents	-->
		<div class="contents"> 
		
			<!--	header Img	-->
			<div class="header_bg" style="background-color: #e9f3cd;"><img src="/images/sub/02_bg04.png"  class="header_img"/></div>
			<!--	//header Img	-->

			<!--	navi	-->
			<div class="navi">
				<span class="navigator">Home &gt; 자가진단 &gt; <span class="navi_menu2">ADHD아동 체크리스트</span></span>
			</div>  
			<!--	//navi	-->     
			<!--	cont	-->
			<div class="cont">
				<jsp:include page="/common/left.dowon"><jsp:param name="depth1" value="4" /><jsp:param name="depth2" value="1" /></jsp:include>

				<!--	con_body	-->
				<div class="con_body">
					<div id="jaga_adhd"></div>
					<div id="tableCmt">※ 설문을 제출하시려면 로그인이 필요합니다.</div>
					
					<div class="jaga_contents">
<!-- 						<div id="btn_info" class="btn">INFO</div> -->
						<form action="" id="frm" name="frm" method="post">
							<input type="hidden" id="resultCnt" name="resultCnt" value="${resultCnt}"/>
							<c:set var="default_url" value="/user/jaga_adhd.dowon"></c:set>
							<table cellspacing="0" cellpadding="3">
								<thead>
									<tr>
										<th>번호</th>
										<th>문항내용</th>
										<th>전혀</br>그렇지 않다</th>
										<th>약간</br>그렇다</th>
										<th>상당히</br>그렇다</th>
										<th>매우</br>그렇다</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="result" items="${resultList }" varStatus="status">
									<tr id="${result.jindan_quest_no }">
										<td>
											<c:out value="${result.jindan_quest_no }" />
											<input type="hidden" name="jindan_quest_no" value="${result.jindan_quest_no }"/>
										</td>
										<td><c:out value="${result.jindan_txt }" /></td>
										<td class="a_center"><input type="radio" name="ans_${result.jindan_quest_no }" value="1"/></td>
										<td class="a_center"><input type="radio" name="ans_${result.jindan_quest_no }" value="2"/></td>
										<td class="a_center"><input type="radio" name="ans_${result.jindan_quest_no }" value="3"/></td>
										<td class="a_center"><input type="radio" name="ans_${result.jindan_quest_no }" value="4"/></td>
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
			<td class="col200 a_center" rowspan="3">주의력결핍<br />과잉행동장애<br />진단척도</td>
			<td class="col100">6점 이하</td>
			<td class="col120">보통수준</td>
			<td class="col100">&nbsp;</td>
		</tr>
		<tr>
			<td>7 ~ 11점</td>
			<td>다소 부주의하고<br />과잉행동수준</td>
			<td>상담필요</td>
		</tr>
		<tr>
			<td>12점 이상</td>
			<td>장애 가능성</td>
			<td>정확한 진단필요</td>
		</tr>
    </table>
</div>
<!-- infoDialog -->

<!--	//wrap	-->
<div class="footer_bg"></div>
</body>
</html>
