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
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "popup_txt",
			sSkinURI: "/plugIns/SE2.3.4.O10204/SmartEditor2Skin.html",	
			fCreator: "createSEditor2"
		});
		
		$(document).on("keyup", "#popup_width, #popup_height, #popup_top, #popup_left", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
		
		if($("#popup_id").val() == "" || $("#popup_id").val() == null){
			$("#popup_width, #popup_height").val(100);
		}
		
		/*	등록	*/
		$("#btn_reg").click(function(e) {
			if($("#popup_title").val().length < 1) {alert("제목을 입력해 주세요"); $("#popup_title").focus(); return false;}
		    if($("#popup_width").val().length < 1) {alert("넓이를 입력해 주세요"); $("#popup_width").focus(); return false;}
		    if($("#popup_height").val().length < 1) {alert("높이를 입력해 주세요"); $("#popup_height").focus(); return false;}
		    if($("#popup_top").val().length < 1) {alert("위치를 입력해 주세요"); $("#popup_top").focus(); return false;}
		    if($("#popup_left").val().length < 1) {alert("위치를 입력해 주세요"); $("#popup_left").focus(); return false;}
		    if($("#from_date").val().length < 1) {alert("팝업시작일을 입력해 주세요"); $("#from_date").focus(); return false;}
		    if($("#to_date").val().length < 1) {alert("팝업종료일을 입력해 주세요"); $("#to_date").focus(); return false;}
		    if ( $("#from_date").val() > $("#to_date").val()) {
		    	alert("시작/종료일을 확인하세요");	
				$("#from_date" ).val("${result.from_date }");
				$("#to_date" ).val("${result.to_date }");
		    	return false;
		    }
			
		    // 에디터의 내용이 textarea에 적용된다.
		    oEditors.getById["popup_txt"].exec("UPDATE_CONTENTS_FIELD", []);
		    // 에디터의 내용에 대한 값 검증은 이곳에서
		    if ($("#popup_txt").val() == "<br>") {alert("내용을 입력하세요");	return false;}
		    
		    var regUrl="";
			if($("#popup_id").val() != "" && $("#popup_id").val() != null){
				regUrl = "/admin/popupUpdate.dowon";
			}
			else{
				regUrl = "/admin/popupInsert.dowon";
			}
			if(confirm("등록 하시겠습니까?"))
			{
				$("#frm").ajaxSubmit({
					url : regUrl,
					type : "post",
					dataType: "json",
					success: function(result){
						alert("등록 되었습니다.");
						$("form[name=frm]").attr("action","/admin/popupList.dowon");
						$("form[name=frm]").submit();
					},
					error: function(result){
						alert("등록 오류입니다. 관리자에게 문의하세요.");
					}
				});
			}
		});
	/*	//등록	*/
	
		$("#btn_del").bind("click",function(){
			if(confirm("삭제 하시겠습니까?"))
			{
				$("#frm").ajaxSubmit({
					url : "/admin/popupDelete.dowon?arr_popup_id="+$("#popup_id").val(),
					type : "post",
					dataType: "json",
					success: function(result){
						alert("삭제 되었습니다.");
						$("form[name=frm]").attr("action","/admin/popupList.dowon");
						$("form[name=frm]").submit();
					},
					error: function(result){
						alert("삭제 오류입니다. 관리자에게 문의하세요.");
					}
				});
			}
		});
	
		$("#btn_list").click(function(e) {
			$("form[name=frm]").attr("action", "/admin/popupList.dowon");
			$("form[name=frm]").submit();
		});
		
		//달력
		$("#from_date, #to_date").datepicker({
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
			yearRange: '2016:c+20', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
			showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다.
			//currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
			//closeText: '닫기',  // 닫기 버튼 패널
			dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
			showAnim: "slide", //애니메이션을 적용한다.
			showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
			dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.
		});
		
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
	
	<form id="frm" name="frm" method="post" action="">
	    <input type="hidden" name="popup_id" id="popup_id" value="<c:out value='${result.popup_id }' />"/>
		<!-- con3 -->
	    <div class="con3">
	        <table class="modalTable_gongji" border="1" cellspacing="0" cellpadding="3">
				<tr>
					<td class="col100">제목</td>
					<td colspan="3">
						<input type="text" name="popup_title" id="popup_title" size="115" maxlength="100" class="text ui-widget-content ui-corner-all" value='<c:out value="${result.popup_title }" />' />
					</td>
				</tr>
				
				<tr>
					<td class="col100">팝업넓이</td>
					<td>
						<input type="number" name="popup_width" id="popup_width" size="10"  min="1" max="2000" class="text ui-widget-content ui-corner-all" value='<c:out value="${result.popup_width }" />'  readonly="readonly" />px
					</td>
					<td class="col100">팝업높이</td>
					<td>
						<input type="number" name="popup_height" id="popup_height" size="10"  min="1" max="2000" class="text ui-widget-content ui-corner-all" value='<c:out value="${result.popup_height }" />'  readonly="readonly" />px
					</td>
				</tr>
	
				<tr>
					<td class="col100">팝업위치(위)</td>
					<td>
						<input type="number" name="popup_top" id="popup_top" size="10" min="0" max="1000" class="text ui-widget-content ui-corner-all" value='<c:out value="${result.popup_top }" />' />px
					</td>
					<td class="col100">팝업위치(왼쪽)</td>
					<td>
						<input type="number" name="popup_left" id="popup_left" size="10" min="0" max="1000" class="text ui-widget-content ui-corner-all" value='<c:out value="${result.popup_left }" />' />px
					</td>
				</tr>
	
				<tr>
					<td class="col100">팝업시작일</td>
					<td>
						<input type="text" name="from_date" id="from_date" size="10" maxlength="10" class="text ui-widget-content ui-corner-all" value='<c:out value="${result.from_date }" />' />
					</td>
					<td class="col100">팝업종료일</td>
					<td>
						<input type="text" name="to_date" id="to_date" size="10" maxlength="10" class="text ui-widget-content ui-corner-all" value='<c:out value="${result.to_date }" />' />
					</td>
				</tr>
				
				<tr>
					<td class="col100">내용</td>
					<td colspan="3">
						<textarea name="popup_txt" id="popup_txt" rows="8" cols="70" style="width:820px;">${result.popup_txt }</textarea>
					</td>
				</tr>
	        </table>
	    </div>   	
	    <!-- //con3 -->
	</form>
        
	<!-- con5 -->
    <div class="con5">
        <button id="btn_list" class="com_fright">목록</button>
        <button id="btn_del" class="com_fright">삭제</button>
        <button id="btn_reg" class="com_fright">등록</button>
    </div>    
   	<!-- //con5 -->
</div>
<!-- //contens -->
<jsp:include page="/common/admin_footer.dowon" />
</div>
<!-- //wrap -->
</body>

</html>
