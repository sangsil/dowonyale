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
		$( "#search_type_set, #iadong_sex_set, #uadong_sex_set" ).buttonset();
		$(".listCell").hover(function(){$(this).attr("bgcolor","#EEEEEE");},function(){$(this).attr("bgcolor","#FFFFFF");});			
		//숫자만입력
		$(document).on("keyup", "#iphone1,#iphone2,#iphone3,#uphone1,#uphone2,#uphone3", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
		$(document).on("blur", "#iphone1,#iphone2,#iphone3,#uphone1,#uphone2,#uphone3", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});	
		//달력
		$("#iadong_birth, #uadong_birth, #iend_date, #uend_date" ).datepicker({
			//showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
			//buttonImage: "/application/db/jquery/images/calendar.gif", // 버튼 이미지
			//buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다.
			changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
			changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
			minDate: '-20y', // 현재날짜로부터 100년이전까지 년을 표시한다.
			nextText: '다음 달', // next 아이콘의 툴팁.
			prevText: '이전 달', // prev 아이콘의 툴팁.
			numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
			//stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
			yearRange: 'c-20:c+3', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
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
					url : "/admin/adongDelete.dowon?arr_adong_id="+get_chked_values(),
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
					url : "/admin/adongDeleteCancel.dowon?arr_adong_id="+get_chked_values(),
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
			$("form[name=frm]").attr("action","/admin/adongListExcel.dowon");
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
					if($("#iadong_name").val().length < 1 || $("#iadong_name").val().length > 50) {alert("이름을 확인해 주세요"); $("#iadong_name").focus(); return false;}
// 					if($("#iparent_name").val().length < 1 || $("#iparent_name").val().length > 20) {alert("부모이름를 확인해 주세요"); $("#iparent_name").focus(); return false;}
					if($("#iadong_birth").val().length < 1 || $("#iadong_birth").val().length > 20) {alert("생년워일을 확인해 주세요"); $("#iadong_birth").focus(); return false;}
// 					if($("#iphone1").val().length < 1 || $("#iphone1").val().length > 3) {alert("전화번호를 확인해 주세요"); $("#iphone1").focus(); return false;}
// 					if($("#iphone2").val().length < 1 || $("#iphone2").val().length > 4) {alert("전화번호를 확인해 주세요"); $("#iphone2").focus(); return false;}
// 					if($("#iphone3").val().length < 1 || $("#iphone3").val().length > 4) {alert("전화번호를 확인해 주세요"); $("#iphone3").focus(); return false;}
					
					if(confirm("등록 하시겠습니까?"))
					{
						$("#insertModalForm").ajaxSubmit({
							url : "/admin/adongInsert.dowon",
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
			$("#uadong_id").val(substr[0]);
			$("#uadong_name").val(substr[1]);
			$("#uparent_name").val(substr[2]);
			$("#uadong_birth").val(substr[3]);
			if(substr[4] == '1'){$("#uadong_sex1").click();}
			else if(substr[4] == '2'){$("#uadong_sex2").click();}
			$("#uend_date").val(substr[5]);
			$("#uphone1").val(substr[6]);
			$("#uphone2").val(substr[7]);
			$("#uphone3").val(substr[8]);
			$("#uvoucher_id").val(substr[9]);
			$("#uadongPyeongga").val(substr[10]);
			
			$("#update_user_modal").dialog("open");
		});
		
		$("#update_user_modal").dialog({
			autoOpen: false,
			width: 350,
			modal: true,
			buttons: {
				"수정": function(){
					if($("#uadong_name").val().length < 1 || $("#uadong_name").val().length > 50) {alert("이름을 확인해 주세요"); $("#uadong_name").focus(); return false;}
// 					if($("#uparent_name").val().length < 1 || $("#uparent_name").val().length > 20) {alert("부모이름를 확인해 주세요"); $("#uparent_name").focus(); return false;}
					if($("#uadong_birth").val().length < 1 || $("#uadong_birth").val().length > 20) {alert("생년월일을 확인해 주세요"); $("#iadong_birth").focus(); return false;}
// 					if($("#uphone1").val().length < 1 || $("#uphone1").val().length > 3) {alert("전화번호를 확인해 주세요"); $("#uphone1").focus(); return false;}
// 					if($("#uphone2").val().length < 1 || $("#uphone2").val().length > 4) {alert("전화번호를 확인해 주세요"); $("#uphone2").focus(); return false;}
// 					if($("#uphone3").val().length < 1 || $("#uphone3").val().length > 4) {alert("전화번호를 확인해 주세요"); $("#uphone3").focus(); return false;}
					if(confirm("수정 하시겠습니까?"))
					{
						$("#updateModalForm").ajaxSubmit({
							url : "/admin/adongUpdate.dowon",
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

<jsp:include page="/common/admin_header.dowon"><jsp:param name="depth1" value="4" /></jsp:include>

<!-- contents -->
<div class="contents">
	<!-- con1 -->
    <div class="con1">아동관리</div>
   	<!-- //con1 -->
	
    <!-- con2 -->
    <div class="con2">
		<form id="frm" name="frm" method="post" action="/admin/adongList.dowon">
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
			
			<c:set var="default_url" value="/admin/adongList.dowon"></c:set>
			
			<div class="con2_1">
				<div class="tot_cnt">총 <c:out value="${totalCnt}"/>건</div>
				<div class="sort_cnt">
			  </div>
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
        <table class="dataTable" border="1" cellspacing="0" cellpadding="3">
            <thead>
                  <tr>
                    <th class="col20"><input id="chkAll" type="checkbox"/></th>
                    <th class="col30">이름</th>
                    <th class="col60">생년월일</th>
                    <th class="col40">성별</th>
                    <th class="col50">부모이름</th>
                    <th class="col50">전화번호</th>    
                    <th class="col50">종료일</th>
                    <th class="col50">바우처지원여부</th>
                    <th class="col50">등록일</th>
                    <th class="col40">등록자</th>
                    <th class="col50">수정일</th>
                    <th class="col50">수정자</th>
                    <th class="col50">삭제여부</th>
                  </tr>
            </thead>
            <tbody>
			<c:if test="${empty resultList}">
				<tr><td colspan="13">등록된 아동이 없습니다.</td></tr>
			</c:if>
			<c:if test="${not empty resultList}">
				<c:forEach var="List" items="${ resultList }">
					<tr class="listCell">
						<td><input type="checkbox" name="checkB" id="${List.adong_id }"/></td>
						<td class="modCell btn" title="${List.adong_id }&&${List.adong_name }&&${List.parent_name }&&${List.adong_birth }&&${List.adong_sex }&&${List.end_date }&&${List.phone1 }&&${List.phone2 }&&${List.phone3 }&&${List.voucher_id }&&${List.adongPyeongga }">
							<c:out value="${List.adong_name }"/>
						</td>
						<td class="modCell btn" title="${List.adong_id }&&${List.adong_name }&&${List.parent_name }&&${List.adong_birth }&&${List.adong_sex }&&${List.end_date }&&${List.phone1 }&&${List.phone2 }&&${List.phone3 }&&${List.voucher_id }&&${List.adongPyeongga }">
							<c:out value="${List.adong_birth }"/>
						</td>
						<td>
							<c:if test="${List.adong_sex eq '1'}">남</c:if>
							<c:if test="${List.adong_sex eq '2'}">여</c:if>
						</td>
						<td><c:out value="${List.parent_name }"/></td>
						<td><c:out value="${List.phone1 }"/>-<c:out value="${List.phone2 }"/>-<c:out value="${List.phone3 }"/></td>
						<td><c:out value="${List.end_date }"/></td>
						<td>
							<c:choose>
								<c:when test="${List.voucher_id eq 0 }">미지원</c:when>
								<c:otherwise>지원</c:otherwise>
							</c:choose>
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
        <button id="btn_reg" class="com_fright">등록</button>
    </div>    
   	<!-- //con5 -->
</div>
<!-- //contens -->

<jsp:include page="/common/admin_footer.dowon" />

</div>
<!-- //wrap -->

<!-- insert -->
<div id="insert_user_modal" title="아동등록">
	<form name="insertModalForm" id="insertModalForm" method="post">
        <table class="modalTable_user" id="modalTable_user" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<td>이름</td>
				<td><input type="text" name="adong_name" id="iadong_name" size="20" maxlength="20" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
			<tr>
				<td>부모이름</td>
				<td><input type="text" name="parent_name" id="iparent_name" size="20" maxlength="20" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
			<tr>				
				<td>생년월일</td>
				<td><input type="text" name="adong_birth" id="iadong_birth" size="20" maxlength="20" class="text ui-widget-content ui-corner-all" readonly/></td>
			</tr>
			<tr>				
				<td>성별</td>
				<td>
					<div id="iadong_sex_set">
						<input type="radio" id="iadong_sex1" name="adong_sex" checked="checked" value="1"><label for="iadong_sex1">남자</label></input>
						<input type="radio" id="iadong_sex2" name="adong_sex" value="2"><label for="iadong_sex2">여자</label></input>
					</div>				
				</td>
			</tr>
			<tr>
				<td>종료일</td>
				<td>
					<input type="text" name="end_date" id="iend_date" size="20" maxlength="20" class="text ui-widget-content ui-corner-all" readonly/>
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
					<input type="text" name="phone1" id="iphone1" size="6" maxlength="3" class="text ui-widget-content ui-corner-all"/>
					<input type="text" name="phone2" id="iphone2" size="6" maxlength="4" class="text ui-widget-content ui-corner-all"/>
					<input type="text" name="phone3" id="iphone3" size="6" maxlength="4" class="text ui-widget-content ui-corner-all"/>
				</td>
			</tr>
			<tr>				
				<td>바우처지원</td>
				<td>
					<select name="voucher_id" id="ivoucher_id">
						<option value="0">= 바우처지원 =</option>
						<c:if test="${not empty voucher_resultList}">
							<c:forEach var="list" items="${ voucher_resultList }">
								<option value="${list.voucher_id }"><c:out value="${list.gwamok_name } : ${list.suyeop_gubun_name }" /></option>
							</c:forEach>
						</c:if>	
					</select>
				</td>
			</tr>
			<tr>				
				<td>수업평가</td>
				<td>
					<textarea name="adongPyeongga" id="iadongPyeongga" rows="3" cols="40"></textarea>		
				</td>
			</tr>
        </table>
	</form>
</div>
<!-- //insert -->

<!-- update -->
<div id="update_user_modal" title="아동정보수정">
	<form name="updateModalForm" id="updateModalForm" method="post">
        <table class="modalTable_user" id="modalTable_user" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="adong_name" id="uadong_name" size="20" maxlength="20" class="text ui-widget-content ui-corner-all"/>
					<input type="hidden" name="adong_id" id="uadong_id"/>
				</td>
			</tr>
			<tr>
				<td>부모이름</td>
				<td><input type="text" name="parent_name" id="uparent_name" size="20" maxlength="20" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
			<tr>				
				<td>생년월일</td>
				<td><input type="text" name="adong_birth" id="uadong_birth" size="20" maxlength="20" class="text ui-widget-content ui-corner-all" readonly/></td>
			</tr>
			<tr>				
				<td>성별</td>
				<td>
					<div id="uadong_sex_set">
						<input type="radio" id="uadong_sex1" name="adong_sex" checked="checked" value="1"><label for="uadong_sex1">남자</label></input>
						<input type="radio" id="uadong_sex2" name="adong_sex" value="2"><label for="uadong_sex2">여자</label></input>
					</div>				
				</td>
			</tr>
			<tr>
				<td>종료일</td>
				<td>
					<input type="text" name="end_date" id="uend_date" size="20" maxlength="20" class="text ui-widget-content ui-corner-all" readonly/>
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
					<input type="text" name="phone1" id="uphone1" size="6" maxlength="3" class="text ui-widget-content ui-corner-all"/>
					<input type="text" name="phone2" id="uphone2" size="6" maxlength="4" class="text ui-widget-content ui-corner-all"/>
					<input type="text" name="phone3" id="uphone3" size="6" maxlength="4" class="text ui-widget-content ui-corner-all"/>
				</td>
			</tr>
			<tr>				
				<td>바우처지원</td>
				<td>
					<select name="voucher_id" id="uvoucher_id">
						<option value="0">= 바우처지원 =</option>
						<c:if test="${not empty voucher_resultList}">
							<c:forEach var="list" items="${ voucher_resultList }">
								<option value="${list.voucher_id }"><c:out value="${list.gwamok_name } : ${list.suyeop_gubun_name }" /></option>
							</c:forEach>
						</c:if>	
					</select>
				</td>
			</tr>
			<tr>				
				<td>수업평가</td>
				<td>
					<textarea name="adongPyeongga" id="uadongPyeongga" rows="3" cols="40"></textarea>		
				</td>
			</tr>
        </table>
	</form>
</div>
<!-- //update -->
</body>

</html>
