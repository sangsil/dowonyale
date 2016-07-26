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

		//숫자만입력
		$(document).on("keyup", "#ibiyong_session, #ibiyong_group, #ibiyong_sangdam, #ibiyong_food, #ibiyong_sogyeonseo, #ibiyong_geongang, #ibiyong_gukmin, #ibiyong_goyong, #ibiyong_sanjea, #ibiyong_toijik, #ibiyong_etc", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
		$(document).on("blur", "#ibiyong_session, #ibiyong_group, #ibiyong_sangdam, #ibiyong_food, #ibiyong_sogyeonseo, #ibiyong_geongang, #ibiyong_gukmin, #ibiyong_goyong, #ibiyong_sanjea, #ibiyong_toijik, #ibiyong_etc", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
		$(document).on("keyup", "#ubiyong_session, #ubiyong_group, #ubiyong_sangdam, #ubiyong_food, #ubiyong_sogyeonseo, #ubiyong_geongang, #ubiyong_gukmin, #ubiyong_goyong, #ubiyong_sanjea, #ubiyong_toijik, #ubiyong_etc", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
		$(document).on("blur", "#ubiyong_session, #ubiyong_group, #ubiyong_sangdam, #ubiyong_food, #ubiyong_sogyeonseo, #ubiyong_geongang, #ubiyong_gukmin, #ubiyong_goyong, #ubiyong_sanjea, #ubiyong_toijik, #ubiyong_etc", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
		
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
					url : "/admin/biyongDelete.dowon?arr_biyong_id="+get_chked_values(),
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
					url : "/admin/biyongDeleteCancel.dowon?arr_biyong_id="+get_chked_values(),
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
			document.frm.action = "/admin/biyongListExcel.dowon";
			document.frm.submit();
		});
		/*//엑셀 */
		
		/*	등록	*/
		$("#btn_reg").click(function(e) {
			e.preventDefault();
			$("#insert_user_modal").dialog("open");
		});
		
		$("#insert_user_modal").dialog({
			autoOpen: false,
			width: 300,
			modal: true,
			buttons: {
				"등록": function(){
					if($("#iuser_id").val().length < 1) {alert("선생님을 선택해 주세요"); $("#iuser_id").focus(); return false;}
					
					if(confirm("등록 하시겠습니까?"))
					{
						$("#insertModalForm").ajaxSubmit({
							url : "/admin/biyongInsert.dowon",
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
			$("#ubiyong_id").val(substr[0]);
			$("#uuser_name").val(substr[1]);
			$("#ubiyong_session").val(substr[2]);
			$("#ubiyong_group").val(substr[3]);
			$("#ubiyong_sangdam").val(substr[4]);
			$("#ubiyong_food").val(substr[5]);
			$("#ubiyong_sogyeonseo").val(substr[6]);
			$("#ubiyong_geongang").val(substr[7]);
			$("#ubiyong_gukmin").val(substr[8]);
			$("#ubiyong_goyong").val(substr[9]);
			$("#ubiyong_sanjea").val(substr[10]);
			$("#ubiyong_toijik").val(substr[11]);
			$("#ubiyong_etc").val(substr[12]);

			$("#update_user_modal").dialog("open");
		});
		
		$("#update_user_modal").dialog({
			autoOpen: false,
			width: 300,
			modal: true,
			buttons: {
				"수정": function(){
					if($("#ubiyong_session").val().length < 1) {alert("세션비용을 확인해 주세요"); $("#ubiyong_session").focus(); return false;}
					if($("#ubiyong_group").val().length < 1) {alert("그룹비용을 확인해 주세요"); $("#ubiyong_group").focus(); return false;}
					if($("#ubiyong_sangdam").val().length < 1) {alert("상담비용을 확인해 주세요"); $("#ubiyong_sangdam").focus(); return false;}
					if($("#ubiyong_food").val().length < 1) {alert("식대를 확인해 주세요"); $("#ubiyong_food").focus(); return false;}
					if($("#ubiyong_sogyeonseo").val().length < 1) {alert("소견서비용을 확인해 주세요"); $("#ubiyong_sogyeonseo").focus(); return false;}
					if($("#ubiyong_geongang").val().length < 1) {alert("건강보험비용을 확인해 주세요"); $("#ubiyong_geongang").focus(); return false;}
					if($("#ubiyong_gukmin").val().length < 1) {alert("국민연금비용을 확인해 주세요"); $("#ubiyong_gukmin").focus(); return false;}
					if($("#ubiyong_goyong").val().length < 1) {alert("공요보험비용을 확인해 주세요"); $("#ubiyong_goyong").focus(); return false;}
					if($("#ubiyong_sanjea").val().length < 1) {alert("산재보험비용을 확인해 주세요"); $("#ubiyong_sanjea").focus(); return false;}
					if($("#ubiyong_toijik").val().length < 1) {alert("퇴직금을 확인해 주세요"); $("#ubiyong_toijik").focus(); return false;}
					if($("#ubiyong_etc").val().length < 1) {alert("기타비용을 확인해 주세요"); $("#ubiyong_etc").focus(); return false;}
					
					if(confirm("수정 하시겠습니까?"))
					{
						$("#updateModalForm").ajaxSubmit({
							url : "/admin/biyongUpdate.dowon",
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
    <div class="con1">비용관리</div>
   	<!-- //con1 -->
	
    <!-- con2 -->
    <div class="con2">
		<form id="frm" name="frm" method="post" action="/admin/biyongList.dowon">
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
			<input type="hidden" id="biyong_id" name="biyong_id" value=""/>

			<input type="hidden" id="excelStartNum" name="excelStartNum" value=""/>
			<input type="hidden" id="excelMaxRows" name="excelMaxRows" value=""/>
			
			<c:set var="default_url" value="/admin/biyongList.dowon"></c:set>
			
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
                    <th class="col40">이름</th>
                    <th class="col70">세션비용</th>
                    <th class="col70">그룹비용</th>
                    <th class="col70">상담비용</th>
                    <th class="col70">소견서<br />비용</th>
                    <th class="col50">식대</th>
                    <th class="col70">건강보험</th>
                    <th class="col70">국민연금</th>
                    <th class="col70">고용보험</th>
                    <th class="col70">산재보험</th>
                    <th class="col50">퇴직금</th>
                    <th class="col70">기타비용</th>
<!--                     <th class="col50">등록일</th> -->
<!--                     <th class="col40">등록자</th> -->
<!--                     <th class="col50">수정일</th> -->
<!--                     <th class="col40">수정자</th> -->
                    <th class="col40">삭제여부</th>
                  </tr>
            </thead>
            <tbody>
			<c:if test="${empty resultList}">
				<tr><td colspan="14">등록된 내용이 없습니다.</td></tr>
			</c:if>
			<c:if test="${not empty resultList}">
				<c:forEach var="List" items="${ resultList }">
					<tr class="listCell" id="${List.biyong_id }">
						<td><input type="checkbox" name="checkB" id="${List.biyong_id }"/></td>
						<td class="modCell btn" title="${List.biyong_id }&&${List.user_name }&&${List.biyong_session }&&${List.biyong_group }&&${List.biyong_sangdam }&&${List.biyong_food }&&${List.biyong_sogyeonseo }&&${List.biyong_geongang }&&${List.biyong_gukmin }&&${List.biyong_goyong }&&${List.biyong_sanjea }&&${List.biyong_toijik }&&${List.biyong_etc }">
							<c:out value="${List.user_name }"/>
						</td>
						<td class="modCell btn" title="${List.biyong_id }&&${List.user_name }&&${List.biyong_session }&&${List.biyong_group }&&${List.biyong_sangdam }&&${List.biyong_food }&&${List.biyong_sogyeonseo }&&${List.biyong_geongang }&&${List.biyong_gukmin }&&${List.biyong_goyong }&&${List.biyong_sanjea }&&${List.biyong_toijik }&&${List.biyong_etc }">
							<c:out value="${List.biyong_session }"/>
						</td>
						<td class="modCell btn" title="${List.biyong_id }&&${List.user_name }&&${List.biyong_session }&&${List.biyong_group }&&${List.biyong_sangdam }&&${List.biyong_food }&&${List.biyong_sogyeonseo }&&${List.biyong_geongang }&&${List.biyong_gukmin }&&${List.biyong_goyong }&&${List.biyong_sanjea }&&${List.biyong_toijik }&&${List.biyong_etc }">
							<c:out value="${List.biyong_group }"/>
						</td>
						<td class="modCell">
							<c:out value="${List.biyong_sangdam }"/>
						</td>
						<td class="modCell">
							<c:out value="${List.biyong_food }"/>
						</td>
						<td class="modCell">
							<c:out value="${List.biyong_sogyeonseo }"/>
						</td>
						<td class="modCell">
							<c:out value="${List.biyong_geongang }"/>
						</td>
						<td class="modCell">
							<c:out value="${List.biyong_gukmin }"/>
						</td>
						<td class="modCell">
							<c:out value="${List.biyong_goyong }"/>
						</td>
						<td class="modCell">
							<c:out value="${List.biyong_sanjea }"/>
						</td>
						<td class="modCell">
							<c:out value="${List.biyong_toijik }"/>
						</td>
						<td class="modCell">
							<c:out value="${List.biyong_etc }"/>
						</td>
<!-- 						<td> -->
<%-- 							<fmt:parseDate var="dateTempParse" value="${List.in_date }" pattern="yyyy-MM-dd HH:mm:ss.S"/> --%>
<%-- 							<fmt:formatDate value="${dateTempParse }" pattern="yyyy-MM-dd"/> --%>
<!-- 						</td> -->
<%-- 						<td><c:out value="${List.in_user_name }"/></td> --%>
<!-- 						<td> -->
<%-- 							<fmt:parseDate var="dateTempParse" value="${List.up_date }" pattern="yyyy-MM-dd HH:mm:ss.S"/> --%>
<%-- 							<fmt:formatDate value="${dateTempParse }" pattern="yyyy-MM-dd"/> --%>
<!-- 						</td> -->
<%-- 						<td><c:out value="${List.up_user_name }"/></td> --%>
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
<div id="insert_user_modal" title="비용등록">
	<form name="insertModalForm" id="insertModalForm" method="post">
        <table class="modalTable_user" id="modalTable_user" border="1" cellspacing="0" cellpadding="3">
				<tr>
					<td>선생님</td>
					<td>
						<select name="user_id" id="iuser_id">
							<option value="">= 선생님 =</option>
							<c:if test="${not empty result_teacherList}">
								<c:forEach var="list" items="${ result_teacherList }">
									<option value="${list.user_id }"><c:out value="${list.user_job } : ${list.user_name }" /></option>
								</c:forEach>
							</c:if>	
						</select>
					</td>
				</tr>
				<tr>
					<td>세션비용</td>
					<td>
						<input type="text" name="biyong_session" id="ibiyong_session" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
					</td>
				</tr>
				<tr>
					<td>그룹비용</td>
					<td>
						<input type="text" name="biyong_group" id="ibiyong_group" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
					</td>
				</tr>
				<tr>
					<td>상당비용</td>
					<td>
						<input type="text" name="biyong_sangdam" id="ibiyong_sangdam" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
					</td>
				</tr>
				<tr>
					<td>식대</td>
					<td>
						<input type="text" name="biyong_food" id="ibiyong_food" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
					</td>
				</tr>
				<tr>
					<td>소견서</td>
					<td>
						<input type="text" name="biyong_sogyeonseo" id="ibiyong_sogyeonseo" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
					</td>
				</tr>
				<tr>
					<td>건강보험</td>
					<td>
						<input type="text" name="biyong_geongang" id="ibiyong_geongang" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
					</td>
				</tr>
				<tr>
					<td>국민연금</td>
					<td>
						<input type="text" name="biyong_gukmin" id="ibiyong_gukmin" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
					</td>
				</tr>
				<tr>
					<td>고용보험</td>
					<td>
						<input type="text" name="biyong_goyong" id="ibiyong_goyong" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
					</td>
				</tr>
				<tr>
					<td>산재보험</td>
					<td>
						<input type="text" name="biyong_sanjea" id="ibiyong_sanjea" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
					</td>
				</tr>
				<tr>
					<td>퇴직금</td>
					<td>
						<input type="text" name="biyong_toijik" id="ibiyong_toijik" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
					</td>
				</tr>
				<tr>
					<td>기타비용</td>
					<td>
						<input type="text" name="biyong_etc" id="ibiyong_etc" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
					</td>
				</tr>
				<tr>
					<td>기타비용내역</td>
					<td>
						<input type="text" name="biyong_etc_txt" id="ibiyong_etc_txt" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
					</td>
				</tr>
        </table>
	</form>
</div>
<!-- //insert -->

<!-- update -->
<div id="update_user_modal" title="경력수정">
	<form name="updateModalForm" id="updateModalForm" method="post">
		<input type="hidden" name="biyong_id" id="ubiyong_id"/>
        <table class="modalTable_user" id="modalTable_user" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<td>선생님</td>
				<td>
					<input type="text" name="user_id" id="uuser_name" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<td>세션비용</td>
				<td>
					<input type="text" name="biyong_session" id="ubiyong_session" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
				</td>
			</tr>
			<tr>
				<td>그룹비용</td>
				<td>
					<input type="text" name="biyong_group" id="ubiyong_group" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
				</td>
			</tr>
			<tr>
				<td>상당비용</td>
				<td>
					<input type="text" name="biyong_sangdam" id="ubiyong_sangdam" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
				</td>
			</tr>
			<tr>
				<td>식대</td>
				<td>
					<input type="text" name="biyong_food" id="ubiyong_food" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
				</td>
			</tr>
			<tr>
				<td>소견서</td>
				<td>
					<input type="text" name="biyong_sogyeonseo" id="ubiyong_sogyeonseo" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
				</td>
			</tr>
			<tr>
				<td>건강보험</td>
				<td>
					<input type="text" name="biyong_geongang" id="ubiyong_geongang" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
				</td>
			</tr>
			<tr>
				<td>국민연금</td>
				<td>
					<input type="text" name="biyong_gukmin" id="ubiyong_gukmin" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
				</td>
			</tr>
			<tr>
				<td>고용보험</td>
				<td>
					<input type="text" name="biyong_goyong" id="ubiyong_goyong" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
				</td>
			</tr>
			<tr>
				<td>산재보험</td>
				<td>
					<input type="text" name="biyong_sanjea" id="ubiyong_sanjea" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
				</td>
			</tr>
			<tr>
				<td>퇴직금</td>
				<td>
					<input type="text" name="biyong_toijik" id="ubiyong_toijik" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
				</td>
			</tr>
			<tr>
				<td>기타비용</td>
				<td>
					<input type="text" name="biyong_etc" id="ubiyong_etc" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
				</td>
			</tr>
			<tr>
				<td>기타비용내역</td>
				<td>
					<input type="text" name="biyong_etc_txt" id="ubiyong_etc_txt" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" />
				</td>
			</tr>
        </table>
	</form>
</div>
<!-- //update -->

</body>

</html>
