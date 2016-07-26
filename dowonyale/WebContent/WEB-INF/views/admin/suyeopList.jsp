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
		$( "#search_type_set, #isuyeop_sex_set, #usuyeop_sex_set" ).buttonset();
		$(".listCell").hover(function(){$(this).attr("bgcolor","#EEEEEE");},function(){$(this).attr("bgcolor","#FFFFFF");});	
		//$("#ugwamok").val("${result_gwamok.gwamok}");
		//$("#usuyeop_gubun").val("${result_suyeop_gubun.suyeop_gubun}");
		
		//숫자만입력
		$(document).on("keyup", "#isuyeop_cnt,#inapip_amt,#usuyeop_cnt,#unapip_amt", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
		$(document).on("blur", "#isuyeop_cnt,#inapip_amt,#usuyeop_cnt,#unapip_amt", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
		
		//등록시 값세팅
		var fDate = new Date();
		var yDate = fDate.getFullYear();
		var mDate = fDate.getMonth()+1;
		mDate < 10?mDate="0"+mDate:mDate=mDate;
		$("#iadong_txt, #uadong_txt").hide();
		$("#isingyu option:eq(2)").attr("selected", "selected");
		$("#inapip_gbn option:eq(1)").attr("selected", "selected");
		$("#iuser_id").val("${sessionScope.USER_ID}");
		//등록시 값세팅
		
		
// 		//달력
		$("#isuyeop_month, #usuyeop_month").datepicker({
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
		$("#inapip_date, #unapip_date").datepicker({
			changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
			changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
			minDate: '-2y', // 현재날짜로부터 100년이전까지 년을 표시한다.
			nextText: '다음 달', // next 아이콘의 툴팁.
			prevText: '이전 달', // prev 아이콘의 툴팁.
			numberOfMonths: [1,2], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
			yearRange: 'c-2:c+2', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
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
					url : "/admin/suyeopDelete.dowon?arr_suyeop_id="+get_chked_values(),
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
					url : "/admin/suyeopDeleteCancel.dowon?arr_suyeop_id="+get_chked_values(),
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
		
		/*	아동선택	*/
		$("#iadong_id").bind("change",function(){
// 			if($(this).val() == '') return;	
			$("#frm").ajaxSubmit({
				url : "/admin/suyeopSelectAdong.dowon?adong_id="+$(this).val(),
				type : "post",
				dataType: "json",
				success: function(result){
					$("#igwamok").val(result.result_voucher.gwamok);
					$("#isuyeop_gubun").val(result.result_voucher.suyeop_gubun);
					$("#isuyeop_cnt").val(result.result_voucher.suyeop_cnt);
					$("#inapip_amt").val(result.result_voucher.suyeop_amt);
					$("#ivoucher_amt").val(result.result_voucher.voucher_amt);
					if(result.result_voucher.voucher_id == ""){
						$("#iadong_txt").hide();
						$("#ivoucher_amt").val(0);
					}
					else{
						$("#iadong_txt").show();
					}
				},
				error: function(result){
					alert("오류!!");
				}
			});
		});
		/*	아동선택	*/
		
		/* s:i금액결산	*/
		$("#isuyeop_gubun, #igwamok").bind("change",function(){
			if($(this).val() == '') return;	
			$("#frm").ajaxSubmit({
				url : "/admin/suyeopSelectSuyeopryo.dowon?suyeop_gubun="+$("#isuyeop_gubun").val()+"&gwamok="+$("#igwamok").val(),
				type : "post",
				dataType: "json",
				success: function(result){
					$("#hcash_charge").val(result.result_suyeopryo.cash_charge);
					$("#hcard_charge").val(result.result_suyeopryo.card_charge);
					icalAmt();
				},
				error: function(result){
					alert("오류!!");
				}
			});
		});
		$("#isuyeop_cnt, #inapip_gbn").bind("change",function(){
			icalAmt();
		});
		$("#isuyeop_cnt").bind("keyup",function(){
			icalAmt();
		});
		/* e:i금액결산	*/
		
		/* s:u금액결산	*/
		$("#usuyeop_gubun, #ugwamok").bind("change",function(){
			if($(this).val() == '') return;	
			$("#frm").ajaxSubmit({
				url : "/admin/suyeopSelectSuyeopryo.dowon?suyeop_gubun="+$("#usuyeop_gubun").val()+"&gwamok="+$("#ugwamok").val(),
				type : "post",
				dataType: "json",
				success: function(result){
					$("#hcash_charge").val(result.result_suyeopryo.cash_charge);
					$("#hcard_charge").val(result.result_suyeopryo.card_charge);
					ucalAmt();
				},
				error: function(result){
					alert("오류!!");
				}
			});
		});
		$("#usuyeop_cnt, #unapip_gbn").bind("change",function(){
			ucalAmt();
		});
		$("#usuyeop_cnt").bind("keyup",function(){
			ucalAmt();
		});
		/* e:i금액결산	*/
		
		/* 엑셀 */
		$("#btn_excel").bind("click",function(){
			if($("#startNum").val() == null || $("#startNum").val() == ''){$("#startNum").val(0);}
			$("form[name=frm]").attr("action","/admin/suyeopListExcel.dowon");
			$("form[name=frm]").submit();			
		});
		/*//엑셀 */
		
		
	/*	등록	*/
		$("#btn_reg").click(function(e) {
			e.preventDefault();
			$("#insert_user_modal").dialog("open");
			$("#isuyeop_month").val(yDate+"-"+mDate);
			$("#inapip_date").val($.datepicker.formatDate($.datepicker.ATOM, new Date()));
		});
		
		$("#insert_user_modal").dialog({
			autoOpen: false,
			width: 350,
			modal: true,
			buttons: {
				"등록": function(){
					if($("#isuyeop_month").val().length < 1) {alert("년월을 확인해 주세요"); $("#isuyeop_month").focus(); return false;}
					if($("#iadong_id").val().length < 1) {alert("아동을 확인해 주세요"); $("#iadong_id").focus(); return false;}
					if($("#igwamok").val().length < 1) {alert("과목을 확인해 주세요"); $("#igwamok").focus(); return false;}
					if($("#iuser_id").val().length < 1) {alert("담당을 확인해 주세요"); $("#iuser_id").focus(); return false;}
					if($("#isuyeop_gubun").val().length < 1) {alert("수업구분을 확인해 주세요"); $("#isuyeop_gubun").focus(); return false;}
					if($("#isuyeop_cnt").val().length < 1) {alert("수업횟수를 확인해 주세요"); $("#isuyeop_cnt").focus(); return false;}
					if($("#inapip_gbn").val().length < 1) {alert("납입구분을 확인해 주세요"); $("#inapip_gbn").focus(); return false;}
					if($("#inapip_date").val().length < 1) {alert("납입일을 확인해 주세요"); $("#inapip_date").focus(); return false;}
					if($("#inapip_amt").val().length < 1) {alert("납입금액을 확인해 주세요"); $("#inapip_amt").focus(); return false;}
					if($("#ivoucher_amt").val().length < 1) {alert("바우처지원금액을 확인해 주세요"); $("#ivoucher_amt").focus(); return false;}
					if(confirm("등록 하시겠습니까?"))
					{
						$("#insertModalForm").ajaxSubmit({
							url : "/admin/suyeopInsert.dowon",
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
			$("#usuyeop_id").val(substr[0]);
			$("#usuyeop_month").val(substr[1]);
			$("#ugwamok").val(substr[2]);
			$("#uuser_id").val(substr[3]);
			$("#usingyu").val(substr[4]);
			$("#usuyeop_gubun").val(substr[5]);
			$("#uadong_id").val(substr[6]);
			$("#usuyeop_cnt").val(substr[7]);
			$("#unapip_gbn").val(substr[8]);
			$("#unapip_date").val(substr[9]);
			$("#unapip_amt").val(substr[10]);
			$("#uvoucher_amt").val(substr[11]);
// 			$("#usuyeopPyeongga").val(substr[12]);
			
			if($("#uvoucher_amt").val() > 0){
				$("#uadong_txt").show();
			}
			
			//금액결산
			$("#frm").ajaxSubmit({
				url : "/admin/suyeopSelectSuyeopryo.dowon?suyeop_gubun="+$("#usuyeop_gubun").val()+"&gwamok="+$("#ugwamok").val(),
				type : "post",
				dataType: "json",
				success: function(result){
					$("#hcash_charge").val(result.result_suyeopryo.cash_charge);
					$("#hcard_charge").val(result.result_suyeopryo.card_charge);
				},
				error: function(result){
					alert("오류!!");
				}
			});
			
			$("#update_user_modal").dialog("open");
		});
		
		$("#update_user_modal").dialog({
			autoOpen: false,
			width: 350,
			modal: true,
			buttons: {
				"수정": function(){
					if($("#usuyeop_month").val().length < 1) {alert("년월을 확인해 주세요"); $("#usuyeop_month").focus(); return false;}
					if($("#uadong_id").val().length < 1) {alert("아동을 확인해 주세요"); $("#uadong_id").focus(); return false;}
					if($("#ugwamok").val().length < 1) {alert("과목을 확인해 주세요"); $("#ugwamok").focus(); return false;}
					if($("#uuser_id").val().length < 1) {alert("담당을 확인해 주세요"); $("#uuser_id").focus(); return false;}
					if($("#usuyeop_gubun").val().length < 1) {alert("수업구분을 확인해 주세요"); $("#usuyeop_gubun").focus(); return false;}
					if($("#usuyeop_cnt").val().length < 1) {alert("수업횟수를 확인해 주세요"); $("#usuyeop_cnt").focus(); return false;}
					if($("#unapip_gbn").val().length < 1) {alert("납입구분을 확인해 주세요"); $("#unapip_gbn").focus(); return false;}
					if($("#unapip_date").val().length < 1) {alert("납입일을 확인해 주세요"); $("#unapip_date").focus(); return false;}
					if($("#unapip_amt").val().length < 1) {alert("납입금액을 확인해 주세요"); $("#unapip_amt").focus(); return false;}
					if($("#uvoucher_amt").val().length < 1) {alert("바우처지원금액을 확인해 주세요"); $("#uvoucher_amt").focus(); return false;}
					
					if(confirm("수정 하시겠습니까?"))
					{
						$("#updateModalForm").ajaxSubmit({
							url : "/admin/suyeopUpdate.dowon",
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
function icalAmt(){
	if($("#inapip_gbn").val() == '1021'){
		$("#inapip_amt").val($("#hcash_charge").val()*$("#isuyeop_cnt").val());
	}
	else if($("#inapip_gbn").val() == '1022' || $("#inapip_gbn").val() == '1023'){
		$("#inapip_amt").val($("#hcard_charge").val()*$("#isuyeop_cnt").val());
	}
	else{
		$("#inapip_amt").val(0);
	}
}
function ucalAmt(){
	if($("#unapip_gbn").val() == '1021'){
		$("#unapip_amt").val($("#hcash_charge").val()*$("#usuyeop_cnt").val());
	}
	else if($("#unapip_gbn").val() == '1022' || $("#unapip_gbn").val() == '1023'){
		$("#unapip_amt").val($("#hcard_charge").val()*$("#usuyeop_cnt").val());
	}
	else{
		$("#unapip_amt").val(0);
	}
}
</script>
</head>

<body>

<!-- wrap -->
<div class="wrap">

<jsp:include page="/common/admin_header.dowon"><jsp:param name="depth1" value="4" /></jsp:include>

<!-- contents -->
<div class="contents">
	<!-- con1 -->
    <div class="con1">수업관리</div>
   	<!-- //con1 -->
	
    <!-- con2 -->
    <div class="con2">
		<form id="frm" name="frm" method="post" action="/admin/suyeopList.dowon">
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
			
			<c:set var="default_url" value="/admin/suyeopList.dowon"></c:set>

			<input type="hidden" id="hcard_charge" value=""/>
			<input type="hidden" id="hcash_charge" value=""/>
			
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
<!--                     <th class="col50">순번</th> -->
                    <th class="col50">년월</th>
                    <th class="col50">과목</th>
                    <th class="col50">담당</th>
                    <th class="col40">신규/<br />종료</th>    
                    <th class="col50">구분</th>
                    <th class="col50">아동</th>
                    <th class="col40">수업<br />횟수</th>
                    <th class="col40">납입<br />구분</th>
                    <th class="col70">납입일</th>
                    <th class="col60">납입금액</th>
                    <th class="col60">바우처<br />지원금액</th>
                    <th class="col70">등록일</th>
                    <th class="col50">등록자</th>
                    <th class="col50">수정일</th>
                    <th class="col50">수정자</th>
                    <th class="col40">삭제<br />여부</th>
                  </tr>
            </thead>
            <tbody>
			<c:if test="${empty resultList}">
				<tr><td colspan="17">등록된 수업내역이 없습니다.</td></tr>
			</c:if>
			<c:if test="${not empty resultList}">
				<c:forEach var="List" items="${ resultList }">
					<tr class="listCell">
						<td><input type="checkbox" name="checkB" id="${List.suyeop_id }"/></td>
<%-- 						<td class="modCell btn" title="${List.suyeop_id }&&${List.suyeop_month }&&${List.gwamok }&&${List.user_id }&&${List.singyu }&&${List.suyeop_gubun }&&${List.adong_id }&&${List.suyeop_cnt }&&${List.napip_gbn }&&${List.napip_date }&&${List.napip_amt }"> --%>
<%-- 							<c:out value="${List.suyeop_id }"/> --%>
<!-- 						</td> -->
						<td class="modCell btn" title="${List.suyeop_id }&&${List.suyeop_month }&&${List.gwamok }&&${List.user_id }&&${List.singyu }&&${List.suyeop_gubun }&&${List.adong_id }&&${List.suyeop_cnt }&&${List.napip_gbn }&&${List.napip_date }&&${List.napip_amt }&&${List.voucher_amt }">
							<c:out value="${List.suyeop_month }"/>
						</td>
						<td class="modCell btn" title="${List.suyeop_id }&&${List.suyeop_month }&&${List.gwamok }&&${List.user_id }&&${List.singyu }&&${List.suyeop_gubun }&&${List.adong_id }&&${List.suyeop_cnt }&&${List.napip_gbn }&&${List.napip_date }&&${List.napip_amt }&&${List.voucher_amt }">
							<c:out value="${List.gwamok_name }"/>
						</td>
						<td><c:out value="${List.user_name }"/></td>
						<td><c:out value="${List.singyu_name }"/></td>
						<td><c:out value="${List.suyeop_gubun_name }"/></td>
						<td><c:out value="${List.adong_name }"/></td>
						<td><c:out value="${List.suyeop_cnt }"/></td>
						<td><c:out value="${List.napip_gbn_name }"/></td>
						<td><c:out value="${List.napip_date }"/></td>
						<td><c:out value="${List.napip_amt }"/></td>
						<td><c:out value="${List.voucher_amt }"/></td>
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
<div id="insert_user_modal" title="수업등록">
	<form name="insertModalForm" id="insertModalForm" method="post">
        <table class="modalTable_user" id="modalTable_user" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<td>년월</td>
				<td>
					<input type="text" name="suyeop_month" id="isuyeop_month" size="20" maxlength="20" class="text ui-widget-content ui-corner-all" tabindex="-1" readonly/>
				</td>
			</tr>
			<tr>				
				<td>아동</td>
				<td>
					<select name="adong_id" id="iadong_id">
						<option value="">= 아동 =</option>
						<c:if test="${not empty result_adongList}">
							<c:forEach var="list" items="${ result_adongList }">
								<option value="${list.adong_id }"><c:out value="${list.adong_name }" /></option>
							</c:forEach>
						</c:if>	
					</select>
					<span id="iadong_txt" style="color:red">바우처지원</span>
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
				<td>담당</td>
				<td>
					<select name="user_id" id="iuser_id">
						<option value="">= 담당 =</option>
						<c:if test="${not empty result_teacherList}">
							<c:forEach var="list" items="${ result_teacherList }">
								<option value="${list.user_id }"><c:out value="${list.user_name }" /></option>
							</c:forEach>
						</c:if>	
					</select>
				</td>
			</tr>
			<tr>				
				<td>신규/종료</td>
				<td>
					<select name="singyu" id="isingyu">
						<option value="">= 선택 =</option>
						<c:if test="${not empty result_singyuList}">
							<c:forEach var="list" items="${ result_singyuList }">
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
				<td>수업횟수</td>
				<td>
					<input type="text" name="suyeop_cnt" id="isuyeop_cnt" size="6" maxlength="6" class="text ui-widget-content ui-corner-all"/>		
				</td>
			</tr>
			<tr>				
				<td>납입구분</td>
				<td>
					<select name="napip_gbn" id="inapip_gbn">
						<option value="">= 납입구분 =</option>
						<c:if test="${not empty result_napip_gbnList}">
							<c:forEach var="list" items="${ result_napip_gbnList }">
								<option value="${list.cd_id }"><c:out value="${list.cd_name }" /></option>
							</c:forEach>
						</c:if>	
					</select>
				</td>
			</tr>
			<tr>
				<td>납입일</td>
				<td>
					<input type="text" name="napip_date" id="inapip_date" size="20" maxlength="20" class="text ui-widget-content ui-corner-all" tabindex="-1" readonly/>
				</td>
			</tr>
			<tr>				
				<td>납입금액</td>
				<td>
					<input type="text" name="napip_amt" id="inapip_amt" size="20" maxlength="10" class="text ui-widget-content ui-corner-all"/>		
				</td>
			</tr>
			<tr>				
				<td>바우처지원금액</td>
				<td>
					<input type="text" name="voucher_amt" id="ivoucher_amt" size="20" maxlength="10" class="text ui-widget-content ui-corner-all"/>		
				</td>
			</tr>
<!-- 			<tr>				 -->
<!-- 				<td>수업평가</td> -->
<!-- 				<td> -->
<!-- 					<textarea name="suyeopPyeongga" id="isuyeopPyeongga" rows="3" cols="40"></textarea>		 -->
<!-- 				</td> -->
<!-- 			</tr> -->
        </table>
	</form>
</div>
<!-- //insert -->

<!-- update -->
<div id="update_user_modal" title="수업수정">
	<form name="updateModalForm" id="updateModalForm" method="post">
		<input type="hidden" name="suyeop_id" id="usuyeop_id"/>
        <table class="modalTable_user" id="modalTable_user" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<td>년월</td>
				<td>
					<input type="text" name="suyeop_month" id="usuyeop_month" size="20" maxlength="20" class="text ui-widget-content ui-corner-all" tabindex="-1" readonly/>
				</td>
			</tr>
			<tr>				
				<td>아동</td>
				<td>
					<select name="adong_id" id="uadong_id" disabled="disabled">
						<option value="">= 아동 =</option>
						<c:if test="${not empty result_adongList}">
							<c:forEach var="list" items="${ result_adongList }">
								<option value="${list.adong_id }"><c:out value="${list.adong_name }" /></option>
							</c:forEach>
						</c:if>	
					</select>
					<span id="uadong_txt" style="color:red">바우처지원</span>
				</td>
			</tr>
			<tr>
				<td>과목</td>
				<td>
					<select name="gwamok" id="ugwamok">
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
				<td>담당</td>
				<td>
					<select name="user_id" id="uuser_id">
						<option value="">= 담당 =</option>
						<c:if test="${not empty result_teacherList}">
							<c:forEach var="list" items="${ result_teacherList }">
								<option value="${list.user_id }"><c:out value="${list.user_name }" /></option>
							</c:forEach>
						</c:if>	
					</select>
				</td>
			</tr>
			<tr>				
				<td>신규/종료</td>
				<td>
					<select name="singyu" id="usingyu">
						<option value="">= 선택 =</option>
						<c:if test="${not empty result_singyuList}">
							<c:forEach var="list" items="${ result_singyuList }">
								<option value="${list.cd_id }"><c:out value="${list.cd_name }" /></option>
							</c:forEach>
						</c:if>	
					</select>
				</td>
			</tr>
			<tr>				
				<td>수업구분</td>
				<td>
					<select name="suyeop_gubun" id="usuyeop_gubun">
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
				<td>수업횟수</td>
				<td>
					<input type="text" name="suyeop_cnt" id="usuyeop_cnt" size="6" maxlength="6" class="text ui-widget-content ui-corner-all"/>		
				</td>
			</tr>
			<tr>				
				<td>납입구분</td>
				<td>
					<select name="napip_gbn" id="unapip_gbn">
						<option value="">= 납입구분 =</option>
						<c:if test="${not empty result_napip_gbnList}">
							<c:forEach var="list" items="${ result_napip_gbnList }">
								<option value="${list.cd_id }"><c:out value="${list.cd_name }" /></option>
							</c:forEach>
						</c:if>	
					</select>
				</td>
			</tr>
			<tr>
				<td>납입일</td>
				<td>
					<input type="text" name="napip_date" id="unapip_date" size="20" maxlength="20" class="text ui-widget-content ui-corner-all" tabindex="-1" readonly/>
				</td>
			</tr>
			<tr>				
				<td>납입금액</td>
				<td>
					<input type="text" name="napip_amt" id="unapip_amt" size="20" maxlength="10" class="text ui-widget-content ui-corner-all"/>		
				</td>
			</tr>
			<tr>				
				<td>바우처지원금액</td>
				<td>
					<input type="text" name="voucher_amt" id="uvoucher_amt" size="20" maxlength="10" class="text ui-widget-content ui-corner-all"/>		
				</td>
			</tr>
<!-- 			<tr>				 -->
<!-- 				<td>수업평가</td> -->
<!-- 				<td> -->
<!-- 					<textarea name="suyeopPyeongga" id="usuyeopPyeongga" rows="3" cols="40"></textarea>		 -->
<!-- 				</td> -->
<!-- 			</tr> -->
        </table>
	</form>
</div>
<!-- //update -->
</body>

</html>
