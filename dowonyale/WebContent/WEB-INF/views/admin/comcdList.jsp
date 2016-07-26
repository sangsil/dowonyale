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
		$(".btn_detail").button({icons: {primary: "ui-icon-wrench"}});
		$(".listCell").hover(function(){$(this).attr("bgcolor","#EEEEEE");},function(){$(this).attr("bgcolor","#FFFFFF");});			
		//숫자만입력
		$(document).on("keyup", "#iorder_no,#uorder_no", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
		$(document).on("blur", "#iorder_no,#uorder_no", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});	

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
					url : "/admin/comcdDelete.dowon?arr_cd_id="+get_chked_values(),
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
					url : "/admin/comcdDeleteCancel.dowon?arr_cd_id="+get_chked_values(),
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
			$("form[name=frm]").attr("action","/admin/comcdListExcel.dowon");
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
					if($("#icd_name").val().length < 1) {alert("ㅋ드명을 확인해 주세요"); $("#icd_name").focus(); return false;}
					if($("#iorder_no").val().length < 1) {alert("정렬순서를 확인해 주세요"); $("#iorder_no").focus(); return false;}
					
					if(confirm("등록 하시겠습니까?"))
					{
						$("#insertModalForm").ajaxSubmit({
							url : "/admin/comcdInsert.dowon",
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
			$("#cd_id").text(substr[0]);
			$("#ucd_id").val(substr[0]);
			$("#ucd_name").val(substr[1]);
			$("#uorder_no").val(substr[2]);
			
			$("#update_user_modal").dialog("open");
		});
		
		$("#update_user_modal").dialog({
			autoOpen: false,
			width: 350,
			modal: true,
			buttons: {
				"수정": function(){
					if($("#ucd_name").val().length < 1) {alert("ㅋ드명을 확인해 주세요"); $("#ucd_name").focus(); return false;}
					if($("#uorder_no").val().length < 1) {alert("정렬순서를 확인해 주세요"); $("#uorder_no").focus(); return false;}
					
					if(confirm("수정 하시겠습니까?"))
					{
						$("#updateModalForm").ajaxSubmit({
							url : "/admin/comcdUpdate.dowon",
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
	
	//하위코드 관리
	function goDetail(cd_id){
		$("input[name=cd_id]").val(cd_id);
		$("form[name=frm]").attr("action","/admin/comcdDetail.dowon");
		$("form[name=frm]").submit();
	}
</script>
</head>

<body>

<!-- wrap -->
<div class="wrap">

<jsp:include page="/common/admin_header.dowon"><jsp:param name="depth1" value="5" /></jsp:include>

<!-- contents -->
<div class="contents">
	<!-- con1 -->
    <div class="con1">코드관리</div>
   	<!-- //con1 -->
	
    <!-- con2 -->
    <div class="con2">
		<form id="frm" name="frm" method="post" action="/admin/comcdList.dowon">
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
			
			<input type="hidden" name="cd_id" value=""/>

			<c:set var="default_url" value="/admin/comcdList.dowon"></c:set>
			
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
                    <th class="col30">코드ID</th>
                    <th class="col60">코드명</th>
                    <th class="col40">정렬순서</th>
                    <th class="col50">등록일</th>
                    <th class="col40">등록자</th>
                    <th class="col50">수정일</th>
                    <th class="col50">수정자</th>
                    <th class="col70">하위코드관리</th>
                    <th class="col50">삭제여부</th>
                  </tr>
            </thead>
            <tbody>
			<c:if test="${empty resultList}">
				<tr><td colspan="12">등록된 아동이 없습니다.</td></tr>
			</c:if>
			<c:if test="${not empty resultList}">
				<c:forEach var="List" items="${ resultList }">
					<tr class="listCell">
						<td><input type="checkbox" name="checkB" id="${List.cd_id }"/></td>
						<td class="modCell btn" title="${List.cd_id }&&${List.cd_name }&&${List.order_no }">
							<c:out value="${List.cd_id }"/>
						</td>
						<td class="modCell btn" title="${List.cd_id }&&${List.cd_name }&&${List.order_no }">
							<c:out value="${List.cd_name }"/>
						</td>
						<td>
							<c:out value="${List.order_no }"/>
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
						<td><button class="btn_detail" onclick="javascript:goDetail('${List.cd_id }');" >하위코드관리</button></td>
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
<div id="insert_user_modal" title="코드등록">
	<form name="insertModalForm" id="insertModalForm" method="post">
        <table class="modalTable_user" id="modalTable_user" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<td>코드명</td>
				<td><input type="text" name="cd_name" id="icd_name" size="20" maxlength="20" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
			<tr>
				<td>정렬순서</td>
				<td><input type="text" name="order_no" id="iorder_no" size="5" maxlength="5" value="0" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
        </table>
	</form>
</div>
<!-- //insert -->

<!-- update -->
<div id="update_user_modal" title="코드수정">
	<form name="updateModalForm" id="updateModalForm" method="post">
		<input type="hidden" name="cd_id" id="ucd_id"/>
        <table class="modalTable_user" id="modalTable_user" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<td>코드ID</td>
				<td>
					<span id="cd_id" />
				</td>
			</tr>
			<tr>
				<td>코드명</td>
				<td><input type="text" name="cd_name" id="ucd_name" size="20" maxlength="20" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
			<tr>
				<td>정렬순서</td>
				<td><input type="text" name="order_no" id="uorder_no" size="5" maxlength="5" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
        </table>
	</form>
</div>
<!-- //update -->
</body>

</html>
