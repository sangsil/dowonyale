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
		$( "#search_type_set,#uuser_type_set,#iuser_type_set" ).buttonset();
		$(".listCell").hover(function(){$(this).attr("bgcolor","#EEEEEE");},function(){$(this).attr("bgcolor","#FFFFFF");});			
		
		$("#iuser_id,#iuser_pw,#iuser_pw_confirm,#iemail1,#uuser_pw,#uuser_pw_confirm,#uemail1,#uemail2").alphanumeric();
		//숫자만입력
		$(document).on("keyup", "#iphone1,#iphone2,#iphone3,#uphone1,#uphone2,#uphone3", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
		$(document).on("blur", "#iphone1,#iphone2,#iphone3,#uphone1,#uphone2,#uphone3", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
		
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
					url : "/admin/userDelete.dowon?arr_user_id="+get_chked_values(),
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
					url : "/admin/userDeleteCancel.dowon?arr_user_id="+get_chked_values(),
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
			$("form[name=frm]").attr("action","/admin/userListExcel.dowon");
			$("form[name=frm]").submit();			
		});
		/*//엑셀 */
		
		
	/*	등록	*/
		//아이디중복체크
		$("#duplChk").button({icons: {primary: "ui-icon-check"}})
		.click(function(){
			$("#insertModalForm").ajaxForm({
				url : "/admin/userDuplChk.dowon",
				type : "post",
				dataType: "json",
				success: function(result){
					if(result.result == 0)
					{
						alert("사용 가능한 ID 입니다.");
						$("#user_id_dup").val($("#iuser_id").val());
					}
					else
					{
						alert("존재하는 ID 입니다.\n다른 ID를 입력 해 주십시오.");
						$("#user_id_dup").val("");
					}
				},
				error: function(result){
					alert("오류입니다. 관리자에게 문의하세요.");
				}
			});
		});
		
		/*등록시 이메일 중복체크*/
		$("#iEmailduplChk").button({icons: {primary: "ui-icon-check"}})
		.click(function(){
			if($("#iemail1").val().length < 1) {alert("이메일을 확인해 주세요"); $("#iemail1").focus(); return false;}
			if($("#iemail2").val().length < 1) {alert("이메일을 확인해 주세요"); $("#iemail2").focus(); return false;}
			$("#insertModalForm").ajaxForm({
				url : "/admin/userEmailDuplChk.dowon",
				type : "post",
				dataType: "json",
				success: function(result){
					if(result.result == 0)
					{
						alert("사용 가능한 Email 입니다.");
						$("#iemail1_dup").val($("#iemail1").val());
						$("#iemail2_dup").val($("#iemail2").val());
					}
					else
					{
						alert("존재하는 Email 입니다.\n다른 Email을 입력 해 주십시오.");
						$("#iemail1_dup, #iemail1_dup").val("");
					}
				},
				error: function(result){
					alert("오류입니다. 관리자에게 문의하세요.");
				}
			});
		});
		/*수정시 이메일 중복체크*/
		$("#uEmailduplChk").button({icons: {primary: "ui-icon-check"}})
		.click(function(){
			if($("#uemail1").val().length < 1) {alert("이메일을 확인해 주세요"); $("#uemail1").focus(); return false;}
			if($("#uemail2").val().length < 1) {alert("이메일을 확인해 주세요"); $("#uemail2").focus(); return false;}
			$("#updateModalForm").ajaxForm({
				url : "/admin/userEmailDuplChk.dowon",
				type : "post",
				dataType: "json",
				success: function(result){
					if(result.result == 0)
					{
						alert("사용 가능한 Email 입니다.");
						$("#uemail1_dup").val($("#uemail1").val());
						$("#uemail2_dup").val($("#uemail2").val());
					}
					else
					{
						alert("존재하는 Email 입니다.\n다른 Email을 입력 해 주십시오.");
						$("#uemail1_dup, #uemail1_dup").val("");
					}
				},
				error: function(result){
					alert("오류입니다. 관리자에게 문의하세요.");
				}
			});
		});
		
		$("#btn_reg").click(function(e) {
			e.preventDefault();
			$("#insert_user_modal").dialog("open");
		});
		
		$("#insert_user_modal").dialog({
			autoOpen: false,
			width: 500,
			modal: true,
			buttons: {
				"등록": function(){
					if($("#iuser_id").val().length < 1 || $("#iuser_id").val().length > 20) {alert("아이디를 확인해 주세요"); $("#iuser_id").focus(); return false;}
					if($("#iuser_name").val().length < 1 || $("#iuser_name").val().length > 50) {alert("이름을 확인해 주세요"); $("#iuser_name").focus(); return false;}
					if($("#iuser_pw").val().length < 1 || $("#iuser_pw").val().length > 20) {alert("비밀번호를 확인해 주세요"); $("#iuser_pw").focus(); return false;}
					if($("#iuser_pw_confirm").val().length < 1) {alert("비밀번호를 확인해 주세요"); $("#iuser_pw_confirm").focus(); return false;}
					if($("#iemail1").val().length < 1 || $("#iemail1").val().length > 20) {alert("이메일을 확인해 주세요"); $("#iemail1").focus(); return false;}
					if($("#iemail2").val().length < 1 || $("#iemail2").val().length > 20) {alert("이메일을 확인해 주세요"); $("#iemail2").focus(); return false;}
					if($("#iphone1").val().length < 1 || $("#iphone1").val().length > 3) {alert("전화번호를 확인해 주세요"); $("#iphone1").focus(); return false;}
					if($("#iphone2").val().length < 1 || $("#iphone2").val().length > 4) {alert("전화번호를 확인해 주세요"); $("#iphone2").focus(); return false;}
					if($("#iphone3").val().length < 1 || $("#iphone3").val().length > 4) {alert("전화번호를 확인해 주세요"); $("#iphone3").focus(); return false;}
					if($("#iuser_pw").val() != $("#iuser_pw_confirm").val()) {alert("비밀번호가 일치하지 않습니다."); $("#iuser_pw_confirm").focus(); return false;}
					if($("#iuser_id").val() != $("#user_id_dup").val()) {alert("ID 중복 확인을 해 주십시오"); return false;}
					if($("#iemail1").val() != $("#iemail1_dup").val()) {alert("이메일 중복 확인을 해 주십시오"); return false;}
					if($("#iemail2").val() != $("#iemail2_dup").val()) {alert("이메일 중복 확인을 해 주십시오"); return false;}
					
					if(confirm("등록 하시겠습니까?"))
					{
						$("#insertModalForm").ajaxSubmit({
							url : "/admin/userInsert.dowon",
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
			$("#suuser_id").text(substr[0]);
			$("#uuser_id").val(substr[0]);
			$("#uuser_name").val(substr[1]);
			$("#uuser_pw, #uuser_pw_confirm").val(substr[2]);
			$("#uemail1").val(substr[3]);
			$("#uemail2").val(substr[4]);
			$("#uphone1").val(substr[5]);
			$("#uphone2").val(substr[6]);
			$("#uphone3").val(substr[7]);
			$("#uchild_name").val(substr[8]);
			if(substr[9] == 'U'){$("#user_type1").click();}
			else if(substr[9] == 'T'){$("#user_type2").click();}
			else if(substr[9] == 'A'){$("#user_type3").click();}
			$("#uuser_job").val(substr[10]);
			$("#uorder_no").val(substr[11]);
			
			$("#uemail1_dup").val(substr[3]);
			$("#uemail2_dup").val(substr[4]);
			
			$("#update_user_modal").dialog("open");
		});
		
		$("#update_user_modal").dialog({
			autoOpen: false,
			width: 500,
			modal: true,
			buttons: {
				"수정": function(){
					if($("#uuser_name").val().length < 1 || $("#uuser_name").val().length > 50) {alert("이름을 확인해 주세요"); $("#uuser_name").focus(); return false;}
					if($("#uuser_pw").val().length < 1 || $("#uuser_pw").val().length > 20) {alert("비밀번호를 확인해 주세요"); $("#uuser_pw").focus(); return false;}
					if($("#uuser_pw_confirm").val().length < 1) {alert("비밀번호를 확인해 주세요"); $("#uuser_pw_confirm").focus(); return false;}
					if($("#uemail1").val().length < 1 || $("#uemail1").val().length > 20) {alert("이메일을 확인해 주세요"); $("#uemail1").focus(); return false;}
					if($("#uemail2").val().length < 1 || $("#uemail2").val().length > 20) {alert("이메일을 확인해 주세요"); $("#uemail2").focus(); return false;}
					if($("#uphone1").val().length < 1 || $("#uphone1").val().length > 3) {alert("전화번호를 확인해 주세요"); $("#uphone1").focus(); return false;}
					if($("#uphone2").val().length < 1 || $("#uphone2").val().length > 4) {alert("전화번호를 확인해 주세요"); $("#uphone2").focus(); return false;}
					if($("#uphone3").val().length < 1 || $("#uphone3").val().length > 4) {alert("전화번호를 확인해 주세요"); $("#uphone3").focus(); return false;}
					if($("#uuser_pw").val() != $("#uuser_pw_confirm").val()) {alert("비밀번호가 일치하지 않습니다."); $("#uuser_pw_confirm").focus(); return false;}
					if($("#uemail1").val() != $("#uemail1_dup").val()) {alert("이메일 중복 확인을 해 주십시오"); return false;}
					if($("#uemail2").val() != $("#uemail2_dup").val()) {alert("이메일 중복 확인을 해 주십시오"); return false;}
					
					if(confirm("수정 하시겠습니까?"))
					{
						$("#updateModalForm").ajaxSubmit({
							url : "/admin/userUpdate.dowon",
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

<jsp:include page="/common/admin_header.dowon"><jsp:param name="depth1" value="1" /></jsp:include>

<!-- contents -->
<div class="contents">
	<!-- con1 -->
    <div class="con1">회원관리</div>
   	<!-- //con1 -->
	
    <!-- con2 -->
    <div class="con2">
		<form id="frm" name="frm" method="post" action="/admin/userList.dowon">
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
			
			<c:set var="default_url" value="/admin/userList.dowon"></c:set>
			<input type="hidden" id="user_id_dup" name="user_id_dup" value=""/>
			
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
                    <th class="col40">아이디</th>
                    <th class="col40">이름</th>
                    <th class="col70">전화번호</th>
                    <th class="col100">이메일</th>
                    <th class="col50">자녀이름</th>
                    <th class="col60">로그인횟수</th>
                    <th class="col60">최근로그인</th>
                    <th class="col50">가입일</th>
                    <th class="col50">권한</th>    
                    <th class="col50">탈퇴여부</th>    
                  </tr>
            </thead>
            <tbody>
			<c:if test="${empty resultList}">
				<tr><td colspan="11">등록된 회원이 없습니다.</td></tr>
			</c:if>
			<c:if test="${not empty resultList}">
				<c:forEach var="List" items="${ resultList }">
					<tr class="listCell">
						<td><input type="checkbox" name="checkB" id="${List.user_id }"/></td>
						<td class="modCell btn" title="${List.user_id }&&${List.user_name }&&${List.user_pw }&&${List.email1 }&&${List.email2 }&&${List.phone1 }&&${List.phone2 }&&${List.phone3 }&&${List.child_name }&&${List.user_type }&&${List.user_job }&&${List.user_job }">
							<c:out value="${List.user_id }"/>
						</td>
						<td class="modCell btn" title="${List.user_id }&&${List.user_name }&&${List.user_pw }&&${List.email1 }&&${List.email2 }&&${List.phone1 }&&${List.phone2 }&&${List.phone3 }&&${List.child_name }&&${List.user_type }&&${List.user_job }&&${List.order_no }">
							<c:out value="${List.user_name }"/>
						</td>
						<td><c:out value="${List.phone1 }"/>-<c:out value="${List.phone2 }"/>-<c:out value="${List.phone3 }"/></td>
						<td><c:out value="${List.email1 }"/>@<c:out value="${List.email2 }"/></td>
						<td><c:out value="${List.child_name }"/></td>
						<td><c:out value="${List.login_cnt }"/></td>
						<td>
							<fmt:parseDate var="dateTempParse" value="${List.login_date }" pattern="yyyy-MM-dd HH:mm:ss.S"/>
							<fmt:formatDate value="${dateTempParse }" pattern="yyyy-MM-dd"/>
						</td>
						<td>
							<fmt:parseDate var="dateTempParse" value="${List.in_date }" pattern="yyyy-MM-dd HH:mm:ss.S"/>
							<fmt:formatDate value="${dateTempParse }" pattern="yyyy-MM-dd"/>
						</td>
						<td>
							<c:if test="${List.user_type eq 'U'}">회원</c:if>
							<c:if test="${List.user_type eq 'T'}">선생님</c:if>
							<c:if test="${List.user_type eq 'A'}">전체관리자</c:if>
						</td>
						<td>
							<c:if test="${List.del_yn eq 'N'}"></c:if>
							<c:if test="${List.del_yn eq 'Y'}">탈퇴</c:if>
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
<div id="insert_user_modal" title="회원등록">
	<form name="insertModalForm" id="insertModalForm" method="post">
		<input type="hidden" id="iemail1_dup" name="iemail1_dup" value=""/>
		<input type="hidden" id="iemail2_dup" name="iemail2_dup" value=""/>
        <table class="modalTable_user" id="modalTable_user" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<td class="col60">아이디</td>
				<td class="col80">
					<input type="text" name="user_id" id="iuser_id" size="13" maxlength="20" class="text ui-widget-content ui-corner-all" title="영문,숫자 만 입력 가능합니다."/>
					<button id="duplChk">중복확인 </button>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="user_name" id="iuser_name" size="20" maxlength="20" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="user_pw" id="iuser_pw" size="20" maxlength="20" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
			<tr>				
				<td>확인</td>
				<td><input type="password" name="user_pw_confirm" id="iuser_pw_confirm" size="20" maxlength="20" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" name="email1" id="iemail1" size="10" maxlength="20" class="text ui-widget-content ui-corner-all"/>
					@
					<input type="text" name="email2" id="iemail2" size="13" maxlength="20" class="text ui-widget-content ui-corner-all"/>
					<button id="iEmailduplChk">중복확인 </button>	
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
				<td>자녀이름</td>
				<td><input type="text" name="child_name" id="ichild_name" size="20" maxlength="20" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
			<tr>
				<td>직책</td>
				<td><input type="text" name="user_job" id="iuser_job" size="20" maxlength="20" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
			<tr>
				<td>정렬순서<br />(치료사만해당)</td>
				<td><input type="text" name="order_no" id="iorder_no" size="20" maxlength="3" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
			<tr>				
				<td>권한</td>
				<td>
					<div id="iuser_type_set">
						<input type="radio" id="iuser_type1" name="user_type" checked="checked" value="U"><label for="iuser_type1">회원</label></input>
						<input type="radio" id="iuser_type2" name="user_type" value="T"><label for="iuser_type2">선생님</label></input>
					</div>				
				</td>
			</tr>
        </table>
	</form>
</div>
<!-- //insert -->

<!-- update -->
<div id="update_user_modal" title="회원정보수정">
	<form name="updateModalForm" id="updateModalForm" method="post">
		<input type="hidden" id="uemail1_dup" name="uemail1_dup" value=""/>
		<input type="hidden" id="uemail2_dup" name="uemail2_dup" value=""/>
        <table class="modalTable_user" id="modalTable_user" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<td class="col60">아이디</td>
				<td class="col80">
					<span id="suuser_id"></span><input type="hidden" name="user_id" id="uuser_id"/>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="user_name" id="uuser_name" size="20" maxlength="20" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="user_pw" id="uuser_pw" size="20" maxlength="20" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
			<tr>				
				<td>확인</td>
				<td><input type="password" name="user_pw_confirm" id="uuser_pw_confirm" size="20" maxlength="20" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" name="email1" id="uemail1" size="10" maxlength="20" class="text ui-widget-content ui-corner-all"/>
					@
					<input type="text" name="email2" id="uemail2" size="13" maxlength="20" class="text ui-widget-content ui-corner-all"/>
					<button id="uEmailduplChk">중복확인 </button>	
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
<!-- 					<select id="uphone1" name="phone1" class="select60"> -->
<!-- 						<option value="10">010</option> -->
<!-- 						<option value="11">011</option> -->
<!-- 						<option value="16">016</option> -->
<!-- 						<option value="17">017</option> -->
<!-- 						<option value="19">019</option> -->
<!-- 					</select> -->
					<input type="text" name="phone1" id="uphone1" size="6" maxlength="3" class="text ui-widget-content ui-corner-all"/>
					<input type="text" name="phone2" id="uphone2" size="6" maxlength="4" class="text ui-widget-content ui-corner-all"/>
					<input type="text" name="phone3" id="uphone3" size="6" maxlength="4" class="text ui-widget-content ui-corner-all"/>
				</td>
			</tr>
			<tr>
				<td>자녀이름</td>
				<td><input type="text" name="child_name" id="uchild_name" size="20" maxlength="20" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
			<tr>
				<td>직책</td>
				<td><input type="text" name="user_job" id="uuser_job" size="20" maxlength="20" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
			<tr>
				<td>정렬순서<br />(치료사만해당)</td>
				<td><input type="text" name="order_no" id="uorder_no" size="20" maxlength="3" class="text ui-widget-content ui-corner-all"/></td>
			</tr>	
			
			<tr>				
				<td>권한</td>
				<td>
					<div id="uuser_type_set">
						<input type="radio" id="user_type1" name="user_type" value="U"><label for="user_type1">회원</label></input>
						<input type="radio" id="user_type2" name="user_type" value="T"><label for="user_type2">선생님</label></input>
						<input type="radio" id="user_type3" name="user_type" value="A"><label for="user_type3">전체관리자</label></input>
					</div>				
<!-- 					<select name="user_type" id="uuser_type" class="select80"> -->
<!-- 						<option value="U">회원</option> -->
<!-- 						<option value="T">선생님</option> -->
<!-- 					</select>		 -->
				</td>
			</tr>
        </table>
	</form>
</div>
<!-- //update -->
</body>

</html>
