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
		$( "#search_type_set,#uuser_type_set,#iuser_type_set" ).buttonset();
		$(".listCell").hover(function(){$(this).attr("bgcolor","#EEEEEE");},function(){$(this).attr("bgcolor","#FFFFFF");});			
		
		$( ".jindan_gbn_set" ).buttonset();
		
		//버튼 선택
		if("${param.search_jindan_gbn }" != "" && "${param.search_jindan_gbn }" != null){
			$("#jindan_gbn_${param.search_jindan_gbn }").click();
		}else{
			$("#jindan_gbn_0").click();
		}
		
		//숫자만입력
		$(document).on("keyup", "#ijindan_quest_no", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
		$(document).on("blur", "#ijindan_quest_no", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
		
		//+ - 버튼 아이콘삽입
		$("#ibtn_plus").button({icons: {primary: "ui-icon-plusthick"},text:false});
		$("#ibtn_minus").button({icons: {primary: "ui-icon-minusthick"},text:false});
		$("#ubtn_plus").button({icons: {primary: "ui-icon-plusthick"},text:false});
		$("#ubtn_minus").button({icons: {primary: "ui-icon-minusthick"},text:false});		
		
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
					url : "/admin/jindanDelete.dowon?arr_jindan_id="+get_chked_values(),
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
					url : "/admin/jindanDeleteCancel.dowon?arr_jindan_id="+get_chked_values(),
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
		
	/*	등록	*/
		$("#btn_reg").click(function(e) {
			e.preventDefault();
			$("#insert_user_modal").dialog("open");
		});
		
		$("#insert_user_modal").dialog({
			autoOpen: false,
			width: 680,
			modal: true,
			buttons: {
				"등록": function(){
					if($("#ijindan_gbn").val().length < 1) {alert("문항구분을 확인해 주세요"); $("#ijindan_gbn").focus(); return false;}
					if($("#ijindan_quest_no").val().length < 1) {alert("문항번호를 확인해 주세요"); $("#ijindan_quest_no").focus(); return false;}
					for(var i=1; i<=tdCnt; i++){
						if($("#ijindan_txt_"+i).val().length < 1) {alert(i+" 번째 문항을 확인해 주세요"); $("#ijindan_txt_"+i).focus(); return false;}
					}
					
					if(confirm("등록 하시겠습니까?"))
					{
						$("#insertModalForm").ajaxSubmit({
							url : "/admin/jindanInsert.dowon",
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
				},
				
			},
			close: function(){
				$("#modalTable_user input").val("");
			}
		});
	/*	//등록	*/
		
	//수정
		var utdCnt = 0;
		$(".modCell").bind("click",function(){
			var substr = $(this).attr('title').split("&&");
			$("#ujindan_id").val(substr[0]);
			$("#ujindan_gbn").val(substr[1]);
			$("#ujindan_quest_no").val(substr[2]);
			$("#djindan_gbn").val(substr[1]);
			$("#djindan_quest_no").val(substr[2]);
			
			$("div[id^=jindan_sub_quest]").remove();
			$("div[id^=ujindan_sub_quest_dy]").remove();
			
			$("#detailModalForm").ajaxSubmit({
				url : "/admin/jindanDetail.dowon",
				type : "post",
				dataType: "json",
				success: function(result){
					utdCnt = result.resultList.length;
					var str="";
					$("#ujindan_sub_quest_no_1").val(result.resultList[0].jindan_sub_quest_no);
					$("#ujindan_txt_1").val(result.resultList[0].jindan_txt);
					for(var i=1; i<result.resultList.length; i++){
						str +=		'<div id="ujindan_sub_quest_dy'+result.resultList[i].jindan_sub_quest_no+'">';
						str +=		'</br>';
						str +=		'<input type="text" class="jindan_sub_quest_no_dy" name="jindan_sub_quest_no" id="ujindan_sub_quest_no_'+result.resultList[i].jindan_sub_quest_no+'" size="5" maxlength="2" class="text ui-widget-content ui-corner-all" value="'+result.resultList[i].jindan_sub_quest_no+'" readonly="readonly"/>';
						str +=		'<textarea name="jindan_txt" class="jindan_txt" id="ujindan_txt_'+result.resultList[i].jindan_sub_quest_no+'" rows="2" cols="70">'+result.resultList[i].jindan_txt+' </textarea>';
						str +=		'</div>';
					}
					$("#udynamicTd").append(str);
				},
				error: function(result){
					alert("오류입니다. 관리자에게 문의하세요.");
				}
			});
			$("#update_user_modal").dialog("open");
		});
		
		$("#update_user_modal").dialog({
			autoOpen: false,
			width: 680,
			modal: true,
			buttons: {
				"수정": function(){
					if($("#ujindan_gbn").val().length < 1) {alert("문항구분을 확인해 주세요"); $("#ujindan_gbn").focus(); return false;}
					if($("#ujindan_quest_no").val().length < 1) {alert("문항번호를 확인해 주세요"); $("#ujindan_quest_no").focus(); return false;}
					for(var i=1; i<=utdCnt; i++){
						if($("#ujindan_txt_"+i).val().length < 1) {alert(i+" 번째 문항을 확인해 주세요"); $("#ujindan_txt_"+i).focus(); return false;}
					}
					if(confirm("수정 하시겠습니까?"))
					{
						$("#updateModalForm").ajaxSubmit({
							url : "/admin/jindanUpdate.dowon",
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

	//s:플러스 마이너스 클릭 등록
		var tdCnt=1;
			$("#ijindan_sub_quest_no_"+tdCnt).val(tdCnt);
		$("#ibtn_plus").bind("click", function(){
			tdCnt = tdCnt+1;
			$("#idynamicTd").append(
					'<div id="ijindan_sub_quest_dy'+tdCnt+'">'+
					'</br>'+
					'<input type="text" class="jindan_sub_quest_no_dy" name="jindan_sub_quest_no" id="ijindan_sub_quest_no_'+tdCnt+'" size="5" maxlength="2" class="text ui-widget-content ui-corner-all" readonly="readonly"/>'+
					'<textarea name="jindan_txt" class="ijindan_txt" id="ijindan_txt_'+tdCnt+'" rows="2" cols="70"></textarea>'+
					'</div>'
					);
			$("#ijindan_sub_quest_no_"+tdCnt).val(tdCnt);
		});
		$("#ibtn_minus").bind("click", function(){
			if(tdCnt == 1) return;
			$("#ijindan_sub_quest_dy"+tdCnt).remove();
			tdCnt--;
		});
	//e:플러스 마이너스 클릭
	//s:플러스 마이너스 클릭 수정
		$("#ubtn_plus").bind("click", function(){
			utdCnt = utdCnt+1;
			$("#udynamicTd").append(
					'<div id="ujindan_sub_quest_dy'+utdCnt+'">'+
					'</br>'+
					'<input type="text" class="jindan_sub_quest_no_dy" name="jindan_sub_quest_no" id="ujindan_sub_quest_no_'+utdCnt+'" size="5" maxlength="2" class="text ui-widget-content ui-corner-all" readonly="readonly"/>'+
					'<textarea name="jindan_txt" class="jindan_txt" id="ujindan_txt_'+utdCnt+'" rows="2" cols="70"></textarea>'+
					'</div>'
					);
			$("#ujindan_sub_quest_no_"+utdCnt).val(utdCnt);
		});
		$("#ubtn_minus").bind("click", function(){
			if(utdCnt == 1) return;
			$("#ujindan_sub_quest_dy"+utdCnt).remove();
			utdCnt--;
		});
	//e:플러스 마이너스 클릭
	
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
    <div class="con1">항목관리</div>
   	<!-- //con1 -->
	
    <!-- con2 -->
    <div class="con2">
		<form id="frm" name="frm" method="post" action="/admin/jindanList.dowon">
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
			<input type="hidden" id="jindan_id" name="jindan_id" value=""/>

			<input type="hidden" id="excelStartNum" name="excelStartNum" value=""/>
			<input type="hidden" id="excelMaxRows" name="excelMaxRows" value=""/>
			
			<c:set var="default_url" value="/admin/jindanList.dowon"></c:set>
			
			<div class="jindan_gbn_set">
				<c:forEach var="list" items="${result_jindanList }">
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
        <table class="dataTable" border="1" cellspacing="0" cellpadding="3">
            <thead>
                  <tr>
                    <th class="col20"><input id="chkAll" type="checkbox"/></th>
                    <th class="col150">자가진단구분</th>
                    <th class="col50">문항번호</th>
                    <th class="col200">문항</th>
                    <th class="col60">등록일</th>
                    <th class="col50">등록자</th>
                    <th class="col60">수정일</th>
                    <th class="col50">수정자</th>
                    <th class="col50">삭제여부</th>
                  </tr>
            </thead>
            <tbody>
			<c:if test="${empty resultList}">
				<tr><td colspan="9">등록된 내용이 없습니다.</td></tr>
			</c:if>
			<c:if test="${not empty resultList}">
				<c:forEach var="List" items="${ resultList }">
					<tr class="listCell" id="${List.jindan_id }">
						<td><input type="checkbox" name="checkB" id="${List.jindan_id }"/></td>
						<td class="modCell btn" title="${List.jindan_id }&&${List.jindan_gbn }&&${List.jindan_quest_no }">
							<c:out value="${List.jindan_gbn_name }"/>
						</td>
						<td class="modCell btn" title="${List.jindan_id }&&${List.jindan_gbn }&&${List.jindan_quest_no }">
							<c:out value="${List.jindan_quest_no }"/>
						</td>
						<td class="modCell btn" title="${List.jindan_id }&&${List.jindan_gbn }&&${List.jindan_quest_no }">
							<c:out value="${List.jindan_txt }" />
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
<div id="insert_user_modal" title="문항등록">
	<form name="insertModalForm" id="insertModalForm" method="post">
        <table class="modalTable_user" id="modalTable_user" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<td>문항구분</td>
				<td>
					<select name="jindan_gbn" id="ijindan_gbn">
						<option value="">= 선택 =</option>
						<c:if test="${not empty result_jindanList}">
							<c:forEach var="list" items="${ result_jindanList }">
								<option value="${list.cd_id }"><c:out value="${list.cd_name }" /></option>
							</c:forEach>
						</c:if>	
					</select>
				</td>
			</tr>
			<tr>
				<td>문항번호</td>
				<td><input type="text" name="jindan_quest_no" id="ijindan_quest_no" size="5" maxlength="5" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
			<tr>
				<td>문항</td>
				<td class="jindan_question_set" id="idynamicTd">
					<div class="jindan_question_button_set">
						<div id="ibtn_plus" class="com_fright">추가</div><div id="ibtn_minus">제거</div>
					</div>
					<input type="text" class="jindan_sub_quest_no" name="jindan_sub_quest_no" id="ijindan_sub_quest_no_1" size="5" maxlength="2" class="text ui-widget-content ui-corner-all" readonly="readonly"/>
					<textarea name="jindan_txt" class="jindan_txt" id="ijindan_txt_1" rows="2" cols="70"></textarea>
				</td>
			</tr>
        </table>
	</form>
</div>
<!-- //insert -->

<!-- update -->
<div id="update_user_modal" title="수업수정">
	<form name="updateModalForm" id="updateModalForm" method="post">
		<input type="hidden" name="jindan_id" id="ujindan_id"/>
        <table class="modalTable_user" id="modalTable_user" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<td>문항구분</td>
				<td>
					<select name="jindan_gbn" id="ujindan_gbn">
						<option value="">= 선택 =</option>
						<c:if test="${not empty result_jindanList}">
							<c:forEach var="list" items="${ result_jindanList }">
								<option value="${list.cd_id }"><c:out value="${list.cd_name }" /></option>
							</c:forEach>
						</c:if>	
					</select>
				</td>
			</tr>
			<tr>
				<td>문항번호</td>
				<td><input type="text" name="jindan_quest_no" id="ujindan_quest_no" size="5" maxlength="5" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
			<tr>
				<td>문항</td>
				<td class="jindan_question_set" id="udynamicTd">
					<div class="jindan_question_button_set">
						<div id="ubtn_plus" class="com_fright">추가</div><div id="ubtn_minus">제거</div>
					</div>
					<input type="text" class="jindan_sub_quest_no" name="jindan_sub_quest_no" id="ujindan_sub_quest_no_1" size="5" maxlength="2" class="text ui-widget-content ui-corner-all" readonly="readonly"/>
					<textarea name="jindan_txt" class="jindan_txt" id="ujindan_txt_1" rows="2" cols="70"></textarea>
				</td>
			</tr>
        </table>
	</form>
</div>
<!-- //update -->

<!-- detail -->
<form name="detailModalForm" id="detailModalForm" method="post">
	<input type="hidden" name="jindan_id" id="djindan_id"/>
	<input type="hidden" name="jindan_gbn" id="djindan_gbn"/>
	<input type="hidden" name="jindan_quest_no" id="djindan_quest_no"/>
</form>
<!-- //detail -->
</body>

</html>
