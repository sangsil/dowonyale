<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>도원예일언어심리센터::관리자</title>
<link rel="icon" href="/images/favicon.ico" type="image/x-icon"/>
<link href="/css/redmond/jquery-ui-1.10.2.custom.css" rel="stylesheet"/>
<link href="/css/redmond/jquery-ui-1.10.2.custom.min.css" rel="stylesheet"/>
<!-- 셀렉트박스용 -->
<link href="/css/selectmenu.css" rel="stylesheet" type="text/css" />
<!-- 테이블용 -->
<link href="/css/uiTable.css" rel="stylesheet" type="text/css" />
<link href="/css/admin_common.css" rel="stylesheet" type="text/css" />
<script src="/js/jquery-1.9.1.js"></script>
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/jquery-ui-1.10.2.custom.js"></script>
<!-- 셀렉트박스용 -->
<script src="/js/jquery.ui.selectmenu.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/jquery.form.js"></script>
<script src="/js/jquery.alphanumeric.js" type="text/javascript"></script>
<script src="/js/paging.js" type="text/javascript"></script>
<script src="/js/admin_common.js" type="text/javascript"></script>
<script type="text/javascript" src="/plugIns/SE2.3.4.O10204/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
	$(function(){
		$(".listCell").hover(function(){$(this).attr("bgcolor","#EEEEEE");},function(){$(this).attr("bgcolor","#FFFFFF");});			
		
		$( ".jindan_gbn_set" ).buttonset();
		//버튼 선택
		if("${param.search_jindan_gbn }" != "" && "${param.search_jindan_gbn }" != null){
			$("#jindan_gbn_${param.search_jindan_gbn }").click();
		}else{
			$("#jindan_gbn_0").click();
		}
		
		/*	검색	*/
		$("#search_value").keyup(function(e){if(e.keyCode == 13){$("#btn_search").click();}});

		$("#btn_search").button({icons: {primary: "ui-icon-search"}}).bind("click",function(){
			$("#startNum").val(0);
			$("form[name=frm]").attr("action","${default_url}");
			$("form[name=frm]").submit();
		});
		/*	//검색	*/
		
		/*	삭제	*/
		$("#chkAll").click(function(){
			var checked_status = this.checked;
			$("input[name=checkB]").each(function()
			{
				this.checked = checked_status;
			});
		});
		
		var chked_val;
		function get_chked_values(){
			chked_val = new Array();
			$("input:checkbox[name='checkB']:checked").each(function(index){
				chked_val[index] = $(this).attr("id");
			});
			return chked_val;
		}		
		$("#btn_del").bind("click",function(){
			if( $(":checkbox[name='checkB']:checked").length==0 ){
				alert("삭제할 항목을 하나이상 체크해주세요.");
				return;
			}
			if(confirm("삭제 하시겠습니까?"))
			{
				$("#frm").ajaxSubmit({
					url : "/admin/jindanAnsDelete.dowon?arr_jindanAns_id="+get_chked_values(),
					type : "post",
					dataType: "json",
					success: function(result){
						alert("삭제 되었습니다.");
						if($("#startNum").val() == null || $("#startNum").val() == ''){$("#startNum").val(0);}
						$("form[name=frm]").attr("action","${default_url}");
						$("form[name=frm]").submit();
					},
					error: function(result){
						alert("삭제 오류입니다. 관리자에게 문의하세요.");
					}
				});
			}
		});
		$("#btn_del_cancel").bind("click",function(){
			if( $(":checkbox[name='checkB']:checked").length==0 ){
				alert("삭제취소 항목을 하나이상 체크해주세요.");
				return;
			}
			if(confirm("삭제를 취소 하시겠습니까?"))
			{
				$("#frm").ajaxSubmit({
					url : "/admin/jindanAnsDeleteCancel.dowon?arr_jindanAns_id="+get_chked_values(),
					type : "post",
					dataType: "json",
					success: function(result){
						alert("삭제 취소 되었습니다.");
						if($("#startNum").val() == null || $("#startNum").val() == ''){$("#startNum").val(0);}
						$("form[name=frm]").attr("action","${default_url}");
						$("form[name=frm]").submit();
					},
					error: function(result){
						alert("삭제 오류입니다. 관리자에게 문의하세요.");
					}
				});
			}
		});
		/*	//삭제	*/
		
		/* 엑셀 */
		$("#btn_excel").bind("click",function(){
			if($("#startNum").val() == null || $("#startNum").val() == ''){$("#startNum").val(0);}
			document.frm.action = "/admin/jindanListExcel.dowon";
			document.frm.submit();
		});
		/*//엑셀 */
		
		/*상세*/
		$(".modCell").bind("click",function(){
			var substr = $(this).attr('title').split("&&");
			
			$("#jindan_ans_id").val(substr[0]);
			$("#jindan_gbn").val(substr[1]);
			$("#user_id").val(substr[2]);
			$("#ans_num").val(substr[3]);
			
			$("#frm").attr("action", "/admin/jindanAnsDetail.dowon");
			$("#frm").submit();
		});
		
		
		/* 인포 모달*/
		$("#info_adhd").button({icons: {primary: "ui-icon-search"}}).bind("click",function(){
			$("#info_modal_adhd").dialog("open");
		});
		$("#info_modal_adhd").dialog({
			autoOpen: false,
			width: 520,
			modal: true,
			close: function(){
				$(this).dialog("close");
			}
		});
		$("#info_hakseub").button({icons: {primary: "ui-icon-search"}}).bind("click",function(){
			$("#info_modal_hakseub").dialog("open");
		});
		$("#info_modal_hakseub").dialog({
			autoOpen: false,
			width: 520,
			modal: true,
			close: function(){
				$(this).dialog("close");
			}
		});
		$("#info_soa").button({icons: {primary: "ui-icon-search"}}).bind("click",function(){
			$("#info_modal_soa").dialog("open");
		});
		$("#info_modal_soa").dialog({
			autoOpen: false,
			width: 520,
			modal: true,
			close: function(){
				$(this).dialog("close");
			}
		});
	});
</script>
</head>

<body>

<!-- wrap -->
<div class="wrap">

<jsp:include page="/common/admin_header.dowon"><jsp:param name="depth1" value="2" /></jsp:include>

<!-- contents -->
<div class="contents">
	<!-- con1 -->
    <div class="con1">진단결과관리</div>
   	<!-- //con1 -->
	
    <!-- con2 -->
    <div class="con2">
		<form id="frm" name="frm" method="post" action="/admin/jindanAnsList.dowon">
			<input type="hidden" id="startNum" name="startNum" value="${param.startNum }"/>
			<input type="hidden" id="maxRows" name="maxRows" value="100"/>
			<input type="hidden" id="allCnt" name="allCnt" value="${totalCnt }"/>
			<c:set var="maxRows" value="100"/>
			<c:set var="rmd" value="${totalCnt%maxRows }"/>
			<c:if test="${rmd > 0}"><c:set var="totalPages" value="${totalCnt/maxRows+1 }"/></c:if>
			<c:if test="${rmd == 0}"><c:set var="totalPages" value="${totalCnt/maxRows }"/></c:if>
			<input type="hidden" id="totalPages" name="totalPages" value="${totalPages }"/>
			<c:set var="cPage" value="${param.cPage }"/>
			<c:if test="${empty param.cPage}"><c:set var="cPage" value="1"/></c:if>
			<input type="hidden" id="cPage" name="cPage" value="${cPage }"/>
			<input type="hidden" id="jindan_ans_id" name="jindan_ans_id" value=""/>
			<input type="hidden" id="user_id" name="user_id" value=""/>
			<input type="hidden" id="ans_num" name="ans_num" value=""/>
			<input type="hidden" id="jindan_gbn" name="jindan_gbn" value=""/>

			<input type="hidden" id="excelStartNum" name="excelStartNum" value=""/>
			<input type="hidden" id="excelMaxRows" name="excelMaxRows" value=""/>
			
			<c:set var="default_url" value="/admin/jindanAnsList.dowon"></c:set>
			
			<div class="jindan_gbn_set">
				<c:forEach var="list" items="${result_jindanAnsList }">
					<input type="radio" id="jindan_gbn_${list.cd_id }" name="search_jindan_gbn" value="${list.cd_id }"><label for="jindan_gbn_${list.cd_id }">${list.cd_name }</label></input>
				</c:forEach>
				<input type="radio" id="jindan_gbn_0" name="search_jindan_gbn" value=""><label for="jindan_gbn_0">전체</label></input>
			</div>
			
			<div class="con2_1">
				<div class="tot_cnt">총 <c:out value="${totalCnt}"/>건</div>
				<div class="sort_cnt"></div>
			</div>
			<div class="con2_2">
				<button id="btn_search" class="btn_search">검색</button>
				<input name="search_value" type="text" value="${param.search_value }" class="text ui-widget-content ui-corner-all search_value" id="search_value" size="25" maxlength="30" />
			</div>
		</form>
    </div>    
   	<!-- //con2 -->
    
	<!-- con3 -->
    <div class="con3">
		<div class="con3_1">
			<div id="info_adhd" class="btn">ADHD</div>
			<div id="info_soa" class="btn">소아불안</div>
			<div id="info_hakseub" class="btn">학습..</div>
		</div>
        <table class="dataTable" border="1" cellspacing="0" cellpadding="3">
            <thead>
                  <tr>
                    <th class="col20"><input id="chkAll" type="checkbox"/></th>
                    <th class="col150">자가진단구분</th>
                    <th class="col50">이름</th>
                    <th class="col50">차수</th>
                    <th class="col50">점수</th>
                    <th class="col60">등록일</th>
                    <th class="col50">등록자</th>
                    <th class="col60">수정일</th>
                    <th class="col50">수정자</th>
                    <th class="col50">삭제여부</th>
                  </tr>
            </thead>
            <tbody>
			<c:if test="${empty resultList}">
				<tr><td colspan="10">등록된 내용이 없습니다.</td></tr>
			</c:if>
			<c:if test="${not empty resultList}">
				<c:forEach var="List" items="${ resultList }">
					<tr class="listCell" id="${List.jindan_ans_id }">
						<td><input type="checkbox" name="checkB" id="${List.jindan_ans_id }"/></td>
						<td class="modCell btn" title="${List.jindan_ans_id }&&${List.jindan_gbn }&&${List.user_id }&&${List.ans_num }">
							<c:out value="${List.jindan_gbn_name }"/>
						</td>
						<td class="modCell btn" title="${List.jindan_ans_id }&&${List.jindan_gbn }&&${List.user_id }&&${List.ans_num }">
							<c:out value="${List.user_name }"/>
						</td>
						<td class="modCell btn" title="${List.jindan_ans_id }&&${List.jindan_gbn }&&${List.user_id }&&${List.ans_num }">
							<c:out value="${List.ans_num }" />
						</td>	
						<td>
							<c:out value="${List.ans_val }" />
						</td>	
						<td>
							<fmt:parseDate var="dateTempParse" value="${List.in_date }" pattern="yyyy-MM-dd HH:mm:ss.S"/>
							<fmt:formatDate value="${dateTempParse }" pattern="yyyy-MM-dd"/>
						</td>
						<td><c:out value="${List.in_user_name }"/></td>
						<td>
							<fmt:parseDate var="dateTempParse" value="${List.up_date }" pattern="yyyy-MM-dd HH:mm:ss.S"/>
							<fmt:formatDate value="${dateTempParse }" pattern="yyyy-MM-dd"/>
						</td>
						<td><c:out value="${List.up_user_name }"/></td>
						<td>
							<c:if test="${List.del_yn eq 'N'}"></c:if>
							<c:if test="${List.del_yn eq 'Y'}">삭제</c:if>
						</td>						
					</tr>
				</c:forEach>
			</c:if>
            </tbody>      
        </table>
    </div>   	
    <!-- //con3 -->
    
	<!-- con4 -->
 	<jsp:include page="/common/paging.dowon" />
    <!-- //con4 -->         
        
	<!-- con5 -->
    <div class="con5">
        <button id="btn_del_cancel" class="com_fright">삭제취소</button>
        <button id="btn_excel" class="com_fright">엑셀다운로드</button>
        <button id="btn_del" class="com_fright">삭제</button>
    </div>    
   	<!-- //con5 -->
</div>
<!-- //contens -->

<jsp:include page="/common/admin_footer.dowon" />

</div>
<!-- //wrap -->

<!-- infoDialog -->
<div id="info_modal_adhd" title="결과">
	<table class="modal_info" border="1" cellspacing="0" cellpadding="3">
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
<!-- infoDialog -->
<div id="info_modal_hakseub" title="결과">
	<table class="modal_info" border="1" cellspacing="0" cellpadding="3">
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
			<td>29점 이상</td>
			<td>매우 심한 우울 상태</td>
		</tr>
    </table>
</div>
<!-- infoDialog -->
<!-- infoDialog -->
<div id="info_modal_soa" title="결과">
	<table class="modal_info" border="1" cellspacing="0" cellpadding="3">
		<tr>
			<td class="col300" rowspan="3">
				1) 소아의 특성불안 측정.<br />
				2) 특성불안은 불안을 일으키는 경향으로 개인이 지니고 있는 지속적인 특성을 의미.<br />
				3) Spielberger의 성인용 특성불안 척도를 소아들이 이해하기 쉬운 형태로 변형시킨 것으로 총 20문항으로 구성. 
			</td>
			<td class="col100">39 ~ 42점</td>
			<td class="col120">특성불안 수준이<br />약간 높음</td>
		</tr>
		<tr>
			<td>43 ~ 46점</td>
			<td>특성불안 수준이<br />상당히 높음</td>
		</tr>
		<tr>
			<td>47점 이상</td>
			<td>특성불안 수준이<br />매우 높음</td>
		</tr>
    </table>
</div>
<!-- infoDialog -->

</body>

</html>
