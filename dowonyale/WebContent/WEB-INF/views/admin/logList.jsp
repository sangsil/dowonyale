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

<script>
	$(function(){
		$(".listCell").hover(function(){$(this).attr("bgcolor","#EEEEEE");},function(){$(this).attr("bgcolor","#FFFFFF");});
		
		$("#fromDate" ).val("${searchVo.fromDate }");
		$("#toDate" ).val("${searchVo.toDate }");
		
		//달력
		$("#fromDate, #toDate").datepicker({
			//showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
			//buttonImage: "/application/db/jquery/images/calendar.gif", // 버튼 이미지
			//buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다.
			changeMonth: false, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
			changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
			minDate: '-20y', // 현재날짜로부터 100년이전까지 년을 표시한다.
			nextText: '다음 달', // next 아이콘의 툴팁.
			prevText: '이전 달', // prev 아이콘의 툴팁.
			numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
			//stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
			yearRange: '2016:c', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
			showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다.
			//currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
			//closeText: '닫기',  // 닫기 버튼 패널
			dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
			showAnim: "slide", //애니메이션을 적용한다.
			showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
			dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.
		});
		
		/*	검색	*/
		$("#fromDate, #toDate").on("change", function(){
			if($("#fromDate").val() > $("#toDate").val()){
				alert("검색 날짜를 확인 해 주세요");
				$("#fromDate" ).val("${searchVo.fromDate }");
				$("#toDate" ).val("${searchVo.toDate }");
				return;
			}
			
			$("#startNum").val(0);
			$("form[name=frm]").submit();
		});

		$("#btn_search").button({icons: {primary: "ui-icon-search"}}).bind("click",function(){
			$("#startNum").val(0);
			$("form[name=frm]").submit();
		});
		/*	//검색	*/
		
		
		/* 엑셀 */
		$("#btn_excel").bind("click",function(){
			if($("#startNum").val() == null || $("#startNum").val() == ''){$("#startNum").val(0);}
			$("form[name=frm]").attr("action","/admin/logListExcel.dowon");
			$("form[name=frm]").submit();			
		});
		/*//엑셀 */
		
		

	});
</script>
</head>

<body>

<!-- wrap -->
<div class="wrap">

<jsp:include page="/common/admin_header.dowon"><jsp:param name="depth1" value="7" /></jsp:include>

<!-- contents -->
<div class="contents">
	<!-- con1 -->
    <div class="con1">로그데이타</div>
   	<!-- //con1 -->
	
    <!-- con2 -->
    <div class="con2">
		<form id="frm" name="frm" method="post" action="/admin/logList.dowon">
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

			<input type="hidden" id="excelStartNum" name="excelStartNum" value=""/>
			<input type="hidden" id="excelMaxRows" name="excelMaxRows" value=""/>
			
			<c:set var="default_url" value="/admin/logList.dowon"></c:set>
			
			<div class="con2_1">
				<div class="tot_cnt">총 <c:out value="${totalCnt}"/>건</div>
				<div class="sort_cnt">
			  </div>
			</div>
			<div class="con2_2">
				<button id="btn_search" class="btn_search">검색</button>
				<input name="search_value" type="text" value="${param.search_value }" class="text ui-widget-content ui-corner-all search_value" id="search_value" size="25" maxlength="30" />
				<input type="text" name="toDate" id="toDate" size="10" maxlength="20" class="ui-widget-content ui-corner-all search_value" readonly/>
				<input type="text" name="fromDate" id="fromDate" size="10" maxlength="20" class="ui-widget-content ui-corner-all search_value" readonly/>
			</div>
		</form>
    </div>    
   	<!-- //con2 -->
    
	<!-- con3 -->
    <div class="con3">
        <table class="dataTable" border="1" cellspacing="0" cellpadding="3">
            <thead>
                  <tr>
                    <th class="col60">URL</th>
                    <th class="col60">브라우저</th>
                    <th class="col50">모바일여부</th>
                    <th class="col50">아이피</th>
                    <th class="col50">아이디</th>    
                    <th class="col50">등록일시</th>
                  </tr>
            </thead>
            <tbody>
			<c:if test="${empty resultList}">
				<tr><td colspan="6">등록된 로그가 없습니다.</td></tr>
			</c:if>
			<c:if test="${not empty resultList}">
				<c:forEach var="List" items="${ resultList }">
					<tr class="listCell">
						<td>${List.log_url }</td>
						<td>${List.device_gbn }</td>
						<td>
							<c:if test="${List.mobile_yn eq 'Y'}">모바일</c:if>
							<c:if test="${List.mobile_yn eq 'N'}">PC</c:if>
						</td>
						<td>${List.in_ip }</td>
						<td>${List.in_user }</td>
						<td>
							<fmt:parseDate var="dateTempParse" value="${List.in_date }" pattern="yyyy-MM-dd HH:mm:ss.S"/>
							<fmt:formatDate value="${dateTempParse }" pattern="yyyy-MM-dd HH:mm:ss"/>
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
<!--     <div class="con5"> -->
<!--         <button id="btn_excel" class="com_fright">엑셀다운로드</button> -->
<!--     </div>     -->
   	<!-- //con5 -->
</div>
<!-- //contens -->

<jsp:include page="/common/admin_footer.dowon" />

</div>
<!-- //wrap -->

</body>

</html>
