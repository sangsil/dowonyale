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
		$( "#search_type_set, #isuyeopryo_sex_set, #usuyeopryo_sex_set" ).buttonset();
		$(".listCell").hover(function(){$(this).attr("bgcolor","#EEEEEE");},function(){$(this).attr("bgcolor","#FFFFFF");});	
		//$("#ugwamok").val("${result_gwamok.gwamok}");
		//$("#usuyeop_gubun").val("${result_suyeop_gubun.suyeop_gubun}");
		
		//숫자만입력
		$(document).on("keyup", "#isuyeopryo_amt,#isuyeop_cnt,#isuyeop_amt,#usuyeopryo_amt,#usuyeop_cnt,#usuyeop_amt", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
		$(document).on("blur", "#isuyeopryo_amt,#isuyeop_cnt,#isuyeop_amt,#usuyeopryo_amt,#usuyeop_cnt,#usuyeop_amt", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});	
// 		//달력
		$("#isuyeop_month").datepicker({
			//showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
			//buttonImage: "/application/db/jquery/images/calendar.gif", // 버튼 이미지
			//buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다.
			changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
			changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
			minDate: '-2y', // 현재날짜로부터 100년이전까지 년을 표시한다.
			nextText: '다음 달', // next 아이콘의 툴팁.
			prevText: '이전 달', // prev 아이콘의 툴팁.
			numberOfMonths: [1,2], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
			//stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
			yearRange: 'c-2:c+2', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
			//showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
			//currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
			//closeText: '닫기',  // 닫기 버튼 패널
			dateFormat: "yy-mm", // 텍스트 필드에 입력되는 날짜 형식.
			showAnim: "slide", //애니메이션을 적용한다.
			showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
			dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.
		});
		
		/*	검색	*/
		$("#search_value").keyup(function(e){
			if(e.keyCode == 13){
				$("#btn_search").click();
			}
		});

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
					url : "/admin/suyeopryoDelete.dowon?arr_suyeopryo_id="+get_chked_values(),
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
					url : "/admin/suyeopryoDeleteCancel.dowon?arr_suyeopryo_id="+get_chked_values(),
					type : "post",
					dataType: "json",
					success: function(result){
						alert("삭제취소 되었습니다.");
						if($("#startNum").val() == null || $("#startNum").val() == ''){$("#startNum").val(0);}
						$("form[name=frm]").attr("action","${default_url}");
						$("form[name=frm]").submit();
					},
					error: function(result){
						alert("삭제취소 오류입니다. 관리자에게 문의하세요.");
					}
				});
			}
		});
		/*	//삭제	*/
		
		/* 엑셀 */
		$("#btn_excel").bind("click",function(){
			if($("#startNum").val() == null || $("#startNum").val() == ''){$("#startNum").val(0);}
			$("form[name=frm]").attr("action","/admin/suyeopryoListExcel.dowon");
			$("form[name=frm]").submit();			
		});
		/*//엑셀 */
		
		
	/*	등록	*/
		$("#btn_reg").click(function(e) {
			e.preventDefault();
			$("#insert_user_modal").dialog("open");
		});
		
		$("#insert_user_modal").dialog({
			autoOpen: false,
			width: 350,
			modal: true,
			buttons: {
				"등록": function(){
					if($("#isuyeop_month").val().length < 1) {alert("년월을 확인해 주세요"); $("#isuyeop_month").focus(); return false;}
					if($("#igwamok").val().length < 1) {alert("과목을 확인해 주세요"); $("#igwamok").focus(); return false;}
					if($("#isuyeop_gubun").val().length < 1) {alert("수업구분을 확인해 주세요"); $("#isuyeop_gubun").focus(); return false;}
					if($("#icash_charge").val().length < 1) {alert("현금결재가를 확인해 주세요"); $("#icash_charge").focus(); return false;}
					if($("#icard_charge").val().length < 1) {alert("카드결재가를 확인해 주세요"); $("#icard_charge").focus(); return false;}
					
					if(confirm("등록 하시겠습니까?"))
					{
						$("#insertModalForm").ajaxSubmit({
							url : "/admin/suyeopryoInsert.dowon",
							type : "post",
							dataType: "json",
							success: function(result){
								alert("등록 되었습니다.");
								if($("#startNum").val() == null || $("#startNum").val() == ''){$("#startNum").val(0);}
								$("form[name=frm]").attr("action","${default_url}");
								$("form[name=frm]").submit();
							},
							error: function(result){
								alert("등록 오류입니다. 관리자에게 문의하세요.");
							}
						});
					}
				},
				"취소": function(){
					$(this).dialog("close");
				}
			},
			close: function(){
				$("#modalTable_user input").val("");
			}
		});
	/*	//등록	*/
		
	//수정
		$(".modCell").bind("click",function(){
			var substr = $(this).attr('title').split("&&");
			$("#usuyeopryo_id").val(substr[0]);
			$("#usuyeop_month").text(substr[1]);
			$("#ugwamok").text(substr[2]);
			$("#usuyeop_gubun").text(substr[3]);
			$("#ucash_charge").val(substr[4]);
			$("#ucard_charge").val(substr[5]);
			
			$("#update_user_modal").dialog("open");
		});
		
		$("#update_user_modal").dialog({
			autoOpen: false,
			width: 350,
			modal: true,
			buttons: {
				"수정": function(){
					if($("#ucash_charge").val().length < 1) {alert("현금결재가를 확인해 주세요"); $("#ucash_charge").focus(); return false;}
					if($("#ucard_charge").val().length < 1) {alert("카드결재가를 확인해 주세요"); $("#ucard_charge").focus(); return false;}
					
					if(confirm("수정 하시겠습니까?"))
					{
						$("#updateModalForm").ajaxSubmit({
							url : "/admin/suyeopryoUpdate.dowon",
							type : "post",
							dataType: "json",
							success: function(result){
								alert("수정 되었습니다.");
								if($("#startNum").val() == null || $("#startNum").val() == ''){$("#startNum").val(0);}
								$("form[name=frm]").attr("action","${default_url}");
								$("form[name=frm]").submit();
							},
							error: function(result){
								alert("수정 오류입니다. 관리자에게 문의하세요.");
							}
						});
					}
				},
				"취소": function(){
					$(this).dialog("close");
				}
			},
			close: function(){
				$("#update_user_modal input").val("");
			}
		});
	//수정 end

	});
</script>
</head>

<body>

<!-- wrap -->
<div class="wrap">

<jsp:include page="/common/admin_header.dowon"><jsp:param name="depth1" value="5" /></jsp:include>

<!-- contents -->
<div class="contents">
	<!-- con1 -->
    <div class="con1">수업료관리</div>
   	<!-- //con1 -->
	
    <!-- con2 -->
    <div class="con2">
		<form id="frm" name="frm" method="post" action="/admin/suyeopryoList.dowon">
			<input type="hidden" id="startNum" name="startNum" value="${param.startNum }"/>
			<input type="hidden" id="maxRows" name="maxRows" value="20"/>
			<input type="hidden" id="allCnt" name="allCnt" value="${totalCnt }"/>
			<c:set var="maxRows" value="20"/>
			<c:set var="rmd" value="${totalCnt%maxRows }"/>
			<c:if test="${rmd > 0}"><c:set var="totalPages" value="${totalCnt/maxRows+1 }"/></c:if>
			<c:if test="${rmd == 0}"><c:set var="totalPages" value="${totalCnt/maxRows }"/></c:if>
			<input type="hidden" id="totalPages" name="totalPages" value="${totalPages }"/>
			<c:set var="cPage" value="${param.cPage }"/>
			<c:if test="${empty param.cPage}"><c:set var="cPage" value="1"/></c:if>
			<input type="hidden" id="cPage" name="cPage" value="${cPage }"/>

			<input type="hidden" id="excelStartNum" name="excelStartNum" value=""/>
			<input type="hidden" id="excelMaxRows" name="excelMaxRows" value=""/>
			
			<c:set var="default_url" value="/admin/suyeopryoList.dowon"></c:set>
			
			<div class="con2_1">
				<div class="tot_cnt">총 <c:out value="${totalCnt}"/>건</div>
				<div class="sort_cnt">
			  </div>
			</div>
<!-- 			<div class="con2_2"> -->
<!-- 				<button id="btn_search" class="btn_search">검색</button> -->
<%-- 				<input name="search_value" type="text" value="${param.search_value }" class="text ui-widget-content ui-corner-all search_value" id="search_value" size="25" maxlength="30" /> --%>
<!-- 			</div> -->
		</form>
    </div>    
   	<!-- //con2 -->
    
	<!-- con3 -->
    <div class="con3">
        <table class="dataTable" border="1" cellspacing="0" cellpadding="3">
            <thead>
                  <tr>
                    <th class="col20"><input id="chkAll" type="checkbox"/></th>
                    <th class="col50">년월</th>
                    <th class="col50">과목</th>
                    <th class="col50">수업</th>
                    <th class="col60">현금결재가</th>
                    <th class="col50">카드결재가</th>    
                    <th class="col50">등록일</th>
                    <th class="col40">등록자</th>
                    <th class="col50">수정일</th>
                    <th class="col50">수정자</th>
                    <th class="col40">삭제여부</th>
                  </tr>
            </thead>
            <tbody>
			<c:if test="${empty resultList}">
				<tr><td colspan="11">등록된 수업료내역이 없습니다.</td></tr>
			</c:if>
			<c:if test="${not empty resultList}">
				<c:forEach var="List" items="${ resultList }">
					<tr class="listCell">
						<td><input type="checkbox" name="checkB" id="${List.suyeopryo_id }"/></td>
						<td class="modCell btn" title="${List.suyeopryo_id }&&${List.suyeop_month }&&${List.gwamok_name }&&${List.suyeop_gubun_name }&&${List.cash_charge }&&${List.card_charge }">
							<c:out value="${List.suyeop_month }"/>
						</td>
						<td class="modCell btn" title="${List.suyeopryo_id }&&${List.suyeop_month }&&${List.gwamok_name }&&${List.suyeop_gubun_name }&&${List.cash_charge }&&${List.card_charge }">
							<c:out value="${List.gwamok_name }"/>
						</td>
						<td class="modCell btn" title="${List.suyeopryo_id }&&${List.suyeop_month }&&${List.gwamok_name }&&${List.suyeop_gubun_name }&&${List.cash_charge }&&${List.card_charge }">
							<c:out value="${List.suyeop_gubun_name }"/>
						</td>
						<td><c:out value="${List.cash_charge }"/></td>
						<td><c:out value="${List.card_charge }"/></td>
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
        <button id="btn_reg" class="com_fright">등록</button>
    </div>    
   	<!-- //con5 -->
</div>
<!-- //contens -->

<jsp:include page="/common/admin_footer.dowon" />

</div>
<!-- //wrap -->

<!-- insert -->
<div id="insert_user_modal" title="수업료등록">
	<form name="insertModalForm" id="insertModalForm" method="post">
        <table class="modalTable_user" id="modalTable_user" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<td>년월</td>
				<td>
					<input type="text" name="suyeop_month" id="isuyeop_month" size="20" maxlength="20" class="text ui-widget-content ui-corner-all" tabindex="-1" readonly/>
				</td>
			</tr>
			<tr>
				<td>과목</td>
				<td>
					<select name="gwamok" id="igwamok">
						<option value="">= 과목 =</option>
						<c:if test="${not empty result_gwamokList}">
							<c:forEach var="list" items="${ result_gwamokList }">
								<option value="${list.cd_id }"><c:out value="${list.cd_name }" /></option>
							</c:forEach>
						</c:if>	
					</select>
				</td>
			</tr>
			<tr>				
				<td>수업구분</td>
				<td>
					<select name="suyeop_gubun" id="isuyeop_gubun">
						<option value="">= 수업 =</option>
						<c:if test="${not empty result_suyeop_gubunList}">
							<c:forEach var="list" items="${ result_suyeop_gubunList }">
								<option value="${list.cd_id }"><c:out value="${list.cd_name }" /></option>
							</c:forEach>
						</c:if>	
					</select>
				</td>
			</tr>
			<tr>				
				<td>현글결재가</td>
				<td>
					<input type="text" name="cash_charge" id="icash_charge" size="6" maxlength="6" class="text ui-widget-content ui-corner-all"/>		
				</td>
			</tr>
			<tr>
				<td>카드결재가</td>
				<td>
					<input type="text" name="card_charge" id="icard_charge" size="6" maxlength="6" class="text ui-widget-content ui-corner-all"/>
				</td>
			</tr>
        </table>
	</form>
</div>
<!-- //insert -->

<!-- update -->
<div id="update_user_modal" title="수업료수정">
	<form name="updateModalForm" id="updateModalForm" method="post">
		<input type="hidden" name="suyeopryo_id" id="usuyeopryo_id"/>
        <table class="modalTable_user" id="modalTable_user" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<td>년월</td>
				<td>
					<span id="usuyeop_month" />
				</td>
			</tr>
			<tr>
				<td>과목</td>
				<td>
					<span id="ugwamok" />
				</td>
			</tr>
			<tr>				
				<td>수업구분</td>
				<td>
					<span id="usuyeop_gubun" />
				</td>
			</tr>
			<tr>				
				<td>현글결재가</td>
				<td>
					<input type="text" name="cash_charge" id="ucash_charge" size="6" maxlength="6" class="text ui-widget-content ui-corner-all"/>		
				</td>
			</tr>
			<tr>
				<td>카드결재가</td>
				<td>
					<input type="text" name="card_charge" id="ucard_charge" size="6" maxlength="6" class="text ui-widget-content ui-corner-all"/>
				</td>
			</tr>
        </table>
	</form>
</div>
<!-- //update -->
</body>

</html>
