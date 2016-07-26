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
<script type="text/javascript" src="/plugIns/bPopup/bPopup.js"></script>

<style>
/*	bPopup	*/
.bPopButton {
    background-color: #2b91af;
    border-radius: 10px;
    box-shadow: 0 2px 3px rgba(0,0,0,0.3);
    color: #fff;
    cursor: pointer;
    display: inline-block;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none
}
.bPopButton.b-close {
    border-radius: 7px 7px 7px 7px;
    box-shadow: none;
    font: bold 131% sans-serif;
    padding: 0 6px 2px;
    position: absolute;
    right: -7px;
    top: -7px
}
div[class^="mainPopup_"] {
    background-color: #fff;
    border-radius: 10px 10px 10px 10px;
    box-shadow: 0 0 25px 5px #999;
    color: #111;
    display: none;
    min-width: 200px;
    padding: 25px
}
div[class^="mainPopup_"] .logo {
    color: #2b91af;
    font: bold 325% 'Petrona',sans
}

div[class^="mainPopup_"] {
    min-height: 200px
}
/*	bPopup	*/
</style>

<script>
	$(function(){
		$(".btn_detail").button({icons: {primary: "ui-icon-wrench"}});
		$( "#search_type_set,#uuser_type_set,#iuser_type_set" ).buttonset();
		$(".listCell").hover(function(){$(this).attr("bgcolor","#EEEEEE");},function(){$(this).attr("bgcolor","#FFFFFF");});			
		
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
					url : "/admin/popupDelete.dowon?arr_popup_id="+get_chked_values(),
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
					url : "/admin/popupDeleteCancel.dowon?arr_popup_id="+get_chked_values(),
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
			document.frm.action = "/admin/popupListExcel.dowon";
			document.frm.submit();
		});
		/*//엑셀 */
		
		$("#btn_reg").click(function(e) {
			$("#popup_id").val("");
			$("form[name=frm]").attr("action", "/admin/popupInUpForm.dowon");
			$("form[name=frm]").submit();
		});
		$(".modCell").bind("click",function(){
			$("#popup_id").val($(this).parent("tr").attr("id"));
			$("form[name=frm]").attr("action", "/admin/popupInUpForm.dowon");
			$("form[name=frm]").submit();
		});

		// 팝업 테스트
		openPopup = function(popup_id, popup_width, popup_height, popup_top, popup_left, popup_title, popup_txt){
// 			팝업 
// 			var settings = "width="+popup_width+", height="+popup_height+", top="+popup_top+", left="+popup_left+", toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes";
// 			var myWindow = window.open(popup_title, popup_id, settings);
// 			if(myWindow != undefined){
// 				myWindow.document.write($("#popup_txt_"+popup_id).val());
// 			}
			
			var divStr = '<div class="mainPopup_1"><span class="bPopButton b-close"><span>X</span></span><span class="popupContent_1">bPopup</span></div>';
			$(".addPopDiv").append(divStr);
			var self = $(this) //button
	        , content = $('.popupContent_1'); 
			$(".mainPopup_1").bPopup({
				fadeSpeed: 'slow', //can be a string ('slow'/'fast') or int
	            followSpeed: 1500, //can be a string ('slow'/'fast') or int
	            opacity: 0.7,
				position: [parseInt(popup_left), parseInt(popup_top)], //x, y
				
			    onOpen: function() {
	                content.html($("#popup_txt_"+popup_id).val());
	            },
	            onClose: function() {
	                content.empty();
	            }
			});
			
			
		};
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
    <div class="con1">팝업관리</div>
   	<!-- //con1 -->
	
    <!-- con2 -->
    <div class="con2">
		<form id="frm" name="frm" method="post" action="/admin/popupList.dowon">
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
			<input type="hidden" id="popup_id" name="popup_id" value=""/>

			<input type="hidden" id="excelStartNum" name="excelStartNum" value=""/>
			<input type="hidden" id="excelMaxRows" name="excelMaxRows" value=""/>
			
			<c:set var="default_url" value="/admin/popupList.dowon"></c:set>
			
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
                    <th class="col40">NO</th>
                    <th class="col200">제목</th>
                    <th class="col70">팝업시작일</th>
                    <th class="col70">팝업종료일</th>
                    <th class="col70">수정일</th>
                    <th class="col60">수정자</th>
                    <th class="col50">삭제여부</th>
                    <th class="col80">팝업실행</th>
                  </tr>
            </thead>
            <tbody>
			<c:if test="${empty resultList}">
				<tr><td colspan="10">등록된 내용이 없습니다.</td></tr>
			</c:if>
			<c:if test="${not empty resultList}">
				<c:forEach var="List" items="${ resultList }">
					<tr class="listCell" id="${List.popup_id }">
					
						<input type="hidden" id="popup_txt_${List.popup_id }" value='${List.popup_txt }' />
						
						<td><input type="checkbox" name="checkB" id="${List.popup_id }"/></td>
						<td class="modCell btn">
							<c:out value="${List.popup_id }"/>
						</td>
						<td class="modCell btn">
							<c:out value="${List.popup_title }"/>
						</td>
						<td><c:out value="${List.from_date }"/></td>
						<td><c:out value="${List.to_date }"/></td>
						<td>
							<fmt:parseDate var="dateTempParse" value="${List.up_date }" pattern="yyyy-MM-dd HH:mm:ss.S"/>
							<fmt:formatDate value="${dateTempParse }" pattern="yyyy-MM-dd"/>
						</td>
						<td><c:out value="${List.up_user_name }"/></td>
						<td>
							<c:if test="${List.del_yn eq 'N'}">사용</c:if>
							<c:if test="${List.del_yn eq 'Y'}">삭제</c:if>
						</td>
						<td><button class="btn_detail" onclick="javascript:openPopup('${List.popup_id }', '${List.popup_width }', '${List.popup_height }', '${List.popup_top }', '${List.popup_left }', '${List.popup_title }');" >팝업실행</button></td>				
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

    <!-- 메인팝업 -->
    <div class="addPopDiv"></div>
    
</body>

</html>
