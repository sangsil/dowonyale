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
			elPlaceHolder: "jindan_txt",
			sSkinURI: "/plugIns/SE2.3.4.O10204/SmartEditor2Skin.html",	
			fOnAppLoad : function(){
				if("${result.jindan_id }" != "" && "${result.jindan_id }" != null){
					oEditors.getById["jindan_txt"].exec("PASTE_HTML", ["${result.jindan_txt }"]);	
				}
			},
			fCreator: "createSEditor2"
		});
		
		$( "#jindan_gbn_set" ).buttonset();
		$("#order_no").numeric;
		
		//버튼 선택
		if("${result.jindan_id }" != "" && "${result.jindan_id }" != null){
			if("${result.jindan_gbn }" == "A"){ $("#jindan_gbn1").click();}
			if("${result.jindan_gbn }" == "S"){ $("#jindan_gbn2").click();}
			if("${result.jindan_gbn }" == "H"){ $("#jindan_gbn3").click();}
		}else{
			$("#jindan_gbn1").click();
		}
		
	/*	등록	*/
		$("#btn_reg").click(function(e) {
			if($("#order_no").val().length < 1) {alert("정렬순서를 입력해 주세요"); $("#order_no").focus(); return false;}
		    // 에디터의 내용이 textarea에 적용된다.
		    oEditors.getById["jindan_txt"].exec("UPDATE_CONTENTS_FIELD", []);
		    // 에디터의 내용에 대한 값 검증은 이곳에서
		    if ($("#jindan_txt").val() == "<br>") {alert("내용을 입력하세요");	return false;}
		    var regUrl="";
			if($("#jindan_id").val() != "" && $("#jindan_id").val() != null){
				regUrl = "/admin/jindanUpdate.dowon";
			}
			else{
				regUrl = "/admin/jindanInsert.dowon";
			}
			if(confirm("등록 하시겠습니까?"))
			{
				$("#frm").ajaxSubmit({
					url : regUrl,
					type : "post",
					dataType: "json",
					success: function(result){
						alert("등록 되었습니다.");
						$("form[name=frm]").attr("action","/admin/jindanList.dowon");
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
					url : "/admin/jindanDelete.dowon?arr_jindan_id="+$("#jindan_id").val(),
					type : "post",
					dataType: "json",
					success: function(result){
						alert("삭제 되었습니다.");
						$("form[name=frm]").attr("action","/admin/jindanList.dowon");
						$("form[name=frm]").submit();
					},
					error: function(result){
						alert("삭제 오류입니다. 관리자에게 문의하세요.");
					}
				});
			}
		});
	
		$("#btn_list").click(function(e) {
			$("form[name=frm]").attr("action", "/admin/jindanList.dowon");
			$("form[name=frm]").submit();
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
    <div class="con1">항목관리</div>
   	<!-- //con1 -->
	
	<form id="frm" name="frm" method="post" action="">
	    <input type="hidden" name="jindan_id" id="jindan_id" value="<c:out value='${result.jindan_id }' />"/>
		<!-- con3 -->
	    <div class="con3">
	        <table class="modalTable_jindan" border="1" cellspacing="0" cellpadding="3">
				<tr>
					<td class="col80">진단구분</td>
					<td>
						<div id="jindan_gbn_set">
							<input type="radio" id="jindan_gbn1" name="jindan_gbn" value="A"><label for="jindan_gbn1">ADHD아동</label></input>
							<input type="radio" id="jindan_gbn2" name="jindan_gbn" value="S"><label for="jindan_gbn2">소아불만</label></input>
							<input type="radio" id="jindan_gbn3" name="jindan_gbn" value="H"><label for="jindan_gbn3">학습/반항성/따돌림</label></input>
						</div>	
					</td>
				</tr>
				<tr>
					<td>정렬순서</td>
					<td>
						<input type="text" name="order_no" id="order_no" size="10" maxlength="2" class="text ui-widget-content ui-corner-all" value='<c:out value="${result.order_no }" />' />
					</td>
				</tr>
<!-- 				<tr> -->
<!-- 					<td>제목</td> -->
<!-- 					<td> -->
<%-- 						<input type="text" name="jindan_title" id="jindan_title" size="135" maxlength="100" class="text ui-widget-content ui-corner-all" value='<c:out value="${result.jindan_title }" />' /> --%>
<!-- 					</td> -->
<!-- 				</tr> -->
				<tr>
					<td>내용</td>
					<td>
						<textarea name="jindan_txt" id="jindan_txt" rows="8" cols="70" style="width:820px;"></textarea>
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
