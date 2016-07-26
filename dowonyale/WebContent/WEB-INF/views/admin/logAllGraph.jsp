<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>도원예일언어심리센터::관리자</title>
<link rel="icon" href="/images/favicon.ico" type="image/x-icon"/>
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

<script type="text/javascript" src="/plugIns/canvas/canvasjs.min.js"></script>

<!-- 
막대그래프 : http://canvasjs.com/html5-javascript-column-chart/
 -->

<!-- 차트 -->
	<script>
	
	var menu_name_0;
	var menu_name_1;
	var menu_name_2;
	var dataPointsArray_0 = new Array();
	var dataPointsArray_1 = new Array();
	
	var rows = 0;
	var total_logVisitor_0 = 0;
	var total_logVisitor_1 = 0;
	
	
	var dataPointsArray_logVisitorUrl_front = new Array();
	var dataPointsArray_logVisitorUrl_admin = new Array();
	
	var dataPointsArray_resultList_join_gbn = new Array();
	var dataPointsArray_resultList_logBrowser_gbn = new Array();
	var dataPointsArray_resultList_logMobine_gbn = new Array();
	
	$(function(){

		$("#fromYear" ).val("${searchVo.fromYear }");
		$("#toYear" ).val("${searchVo.toYear }");
		
		//달력
		$("#fromYear, #toYear").datepicker({
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
			yearRange: '2016:c', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
			showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다.
			//currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
			closeText: '닫기',  // 닫기 버튼 패널
			dateFormat: "yy", // 텍스트 필드에 입력되는 날짜 형식.
			showAnim: "slide", //애니메이션을 적용한다.
			showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
			dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.
			
// 			onClose: function(dateText, inst){ 
// 				var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val(); 
// 				var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val(); 
// 				$(this).datepicker('setDate', new Date(year, month, 1)); 
				
// 				month = new Number(month) + 1;
				
// 				if(month < 10) {
// 					month = "0" + new String(month);
// 				}
// 				$("#dataId1").val(month + "-" + year);
				
// 			},
// 			beforeShow: function (){ 
// 				var selectDate = $("#periodDate").val().split("-");
// 				var year = Number(selectDate[0]);
// 				var month = Number(selectDate[1]) - 1;
// 				$(this).datepicker( "option", "defaultDate", new Date(year, month, 1) );
				
// 			} 
			
		});
		
		
		/*	검색	*/
		$("#fromYear, #toYear").on("change", function(){
			
			if($("#fromYear").val() > $("#toYear").val()){
				alert("검색 날짜를 확인 해 주세요");
				$("#fromYear" ).val("${searchVo.fromYear }");
				$("#toYear" ).val("${searchVo.toYear }");
				return;
			}
			
			$("form[name=frm]").submit();
		});
		/*	//검색	*/
		
		
		// 누적 방문자
		// 프론트
		<c:forEach items="${resultList_logVisitor_0}" var="item" varStatus="status">
			var dataPointsA = {  "y": parseInt("${item.cnt1}"), "x": new Date ("${item.title}",0)};
			dataPointsArray_0.push(dataPointsA);
			menu_name_0 = "${item.menu_name}";
			total_logVisitor_0 += parseInt("${item.cnt1}");
			rows = parseInt("${status.count}");
		</c:forEach>
		// 어드민
		<c:forEach items="${resultList_logVisitor_1}" var="item">
			var dataPointsA = {  "y": parseInt("${item.cnt1}"), "x": new Date ("${item.title}",0)};
			dataPointsArray_1.push(dataPointsA);
			menu_name_1 = "${item.menu_name}";
			total_logVisitor_1 += parseInt("${item.cnt1}");
		</c:forEach>
			
		getInterval = function(tot_0, tot_1){
			var result = 0;
			var sumVal = tot_0 + tot_1;
			var totalVal = sumVal * rows;
			return totalVal / 10;
		}	
			
		// 메뉴별 로그수
		<c:forEach items="${resultList_logVisitorUrl_front}" var="item" varStatus="status">
			var dataPointsA = {  "y": parseInt("${item.cnt1}"), "legendText":"${item.title}", "label": "${item.title}" }
			dataPointsArray_logVisitorUrl_front.push(dataPointsA);
		</c:forEach>
		// 메뉴별 로그수
		<c:forEach items="${resultList_logVisitorUrl_admin}" var="item">
			var dataPointsA = {  "y": parseInt("${item.cnt1}"), "legendText":"${item.title}", "label": "${item.title}" }
			dataPointsArray_logVisitorUrl_admin.push(dataPointsA);
		</c:forEach>
		
		// 회원가입
		<c:forEach items="${resultList_join_gbn}" var="item">
			var dataPointsA = {  "y": parseInt("${item.cnt1}"), "legendText":"${item.title}", "label": "${item.title}" }
			dataPointsArray_resultList_join_gbn.push(dataPointsA);
		</c:forEach>
		
		// 브라우저구분
		<c:forEach items="${resultList_logBrowser_gbn}" var="item">
		var dataPointsA = {  "y": parseInt("${item.cnt1}"), "indexLabel": "${item.title} {y}%" }
		dataPointsArray_resultList_logBrowser_gbn.push(dataPointsA);
		</c:forEach>
		
		// 모바일구분
		<c:forEach items="${resultList_logMobine_gbn}" var="item">
		var dataPointsA = {  "y": parseInt("${item.cnt1}"), "indexLabel": "${item.title} {y}%" }
		dataPointsArray_resultList_logMobine_gbn.push(dataPointsA);
		</c:forEach>
		
		
		
	});

	
	
	
	  window.onload = function () {
		  	// 누적 로그
		    var resultList_logVisitor = new CanvasJS.Chart("resultList_logVisitor",
		    {
		      title:{
		        text: "방문자수",
		        fontFamily: "Nanum Gothic black",
		        fontColor: "#695A42"

		      },
		     animationEnabled: true,
		      toolTip: {
		        shared: true,
		        content: function(e){
		          var str = '';
		          var total = 0 ;
		          var str3;
		          var str2 ;
		          for (var i = 0; i < e.entries.length; i++){
		            var  str1 = "<span style= 'color:"+e.entries[i].dataSeries.color + "'> " + e.entries[i].dataSeries.name + "</span>: <strong>"+  e.entries[i].dataPoint.y + "</strong> 건<br/>" ; 
		            total = parseInt(e.entries[i].dataPoint.y) + total;
		            str = str.concat(str1);
		          }
		          str2 = "<span style = 'color:DodgerBlue; '><strong>"+ (e.entries[0].dataPoint.x).getFullYear() + "</strong></span><br/>";
		          total = Math.round(total*100)/100 
		          str3 = "<span style = 'color:Tomato '>Total:</span><strong>" + total + "</strong> <br/>";
		          
		          return (str2.concat(str)).concat(str3);
		        }
		      },
		      axisY:{
		        valueFormatString:"#0건", 
		        interval: getInterval(total_logVisitor_0, total_logVisitor_1),
		        gridColor: "#B6B1A8",
		        tickColor: "#B6B1A8",
		        interlacedColor: "rgba(182,177,168,0.2)"

		      },
		      axisX: {
		        interval: 1,
		        intervalType: "year"
		      },
		      data: [
		      {        
		       type: "stackedColumn",       
		       showInLegend:true,
		       color: "#696661",
		       name:menu_name_0,
		       dataPoints: dataPointsArray_0
		     },
		     {        
		       type: "stackedColumn",       
		       showInLegend:true,
		       color: "#EDCA93",
		       name:menu_name_1,
		       dataPoints: dataPointsArray_1
		     }
		     
		     ]
		   });

	    resultList_logVisitor.render();
		
		
		// 메뉴별 로그(프론트)
		var resultList_logVisitorUrl_front = new CanvasJS.Chart("resultList_logVisitorUrl_front",
		{
			title:{
				text: "메뉴별 로그(프론트)"
			},
	                animationEnabled: true,
			legend:{
				verticalAlign: "center",
				horizontalAlign: "left",
				fontSize: 20,
				fontFamily: "Helvetica"        
			},
			theme: "theme2",
			data: [
			{        
				type: "pie",       
				indexLabelFontFamily: "Garamond",       
				indexLabelFontSize: 20,
				indexLabel: "{label} {y}%",
				startAngle:-20,      
				showInLegend: true,
				toolTipContent:"{legendText} {y}%",
				dataPoints: dataPointsArray_logVisitorUrl_front
			}
			]
		});
		resultList_logVisitorUrl_front.render();
		
		// 메뉴별 로그(어드민)
		var resultList_logVisitorUrl_admin = new CanvasJS.Chart("resultList_logVisitorUrl_admin",
		{
			title:{
				text: "메뉴별 로그(관리자)"
			},
	                animationEnabled: true,
			legend:{
				verticalAlign: "center",
				horizontalAlign: "left",
				fontSize: 20,
				fontFamily: "Helvetica"        
			},
			theme: "theme2",
			data: [
			{        
				type: "pie",       
				indexLabelFontFamily: "Garamond",       
				indexLabelFontSize: 20,
				indexLabel: "{label} {y}%",
				startAngle:-20,      
				showInLegend: true,
				toolTipContent:"{legendText} {y}%",
				dataPoints: dataPointsArray_logVisitorUrl_admin
			}
			]
		});
		resultList_logVisitorUrl_admin.render();
		
		// 회원가입 경로
		var resultList_join_gbn = new CanvasJS.Chart("resultList_join_gbn",
				{
					title:{
						text: "회원가입 경로"
					},     
			                animationEnabled: true,     
					data: [
					{        
						type: "doughnut",
						startAngle: 60,                          
						toolTipContent: "{legendText}: {y} - <strong>#percent% </strong>", 					
						showInLegend: true,
						dataPoints: dataPointsArray_resultList_join_gbn
					}
					]
				});
		resultList_join_gbn.render();
		
		// 브라우저 구분
		var resultList_logBrowser_gbn = new CanvasJS.Chart("resultList_logBrowser_gbn",
				{
					title:{
						text: "접속 브라우저 구분"
					},
		                        animationEnabled: true,
					theme: "theme2",
					data: [
					{        
						type: "doughnut",
						indexLabelFontFamily: "Garamond",       
						indexLabelFontSize: 20,
						startAngle:0,
						indexLabelFontColor: "dimgrey",       
						indexLabelLineColor: "darkgrey", 
						toolTipContent: "{y} %", 					
		
						dataPoints: dataPointsArray_resultList_logBrowser_gbn
					}
					]
				});
		resultList_logBrowser_gbn.render();

		// 브라우저 구분
		var resultList_logMobine_gbn = new CanvasJS.Chart("resultList_logMobine_gbn",
		{
			title:{
				text: "접속디바이스 모바일 구분"
			},
                        animationEnabled: true,
			theme: "theme2",
			data: [
			{        
				type: "doughnut",
				indexLabelFontFamily: "Garamond",       
				indexLabelFontSize: 20,
				startAngle:0,
				indexLabelFontColor: "dimgrey",       
				indexLabelLineColor: "darkgrey", 
				toolTipContent: "{y} %", 					

				dataPoints: dataPointsArray_resultList_logMobine_gbn
			}
			]
		});

		resultList_logMobine_gbn.render();
		
		
		
		
		}
	
	
	// 메뉴별 로그수
	</script>
	
<style type="text/css">
/* table.ui-datepicker-calendar { display:none; } */
</style>
	
</head>

<body>

<!-- wrap -->
<div class="wrap">

<jsp:include page="/common/admin_header.dowon"><jsp:param name="depth1" value="7" /></jsp:include>

<!-- contents -->
<div class="contents">
	<!-- con1 -->
    <div class="con1">연간로그차트</div>
   	<!-- //con1 -->
	
	
    <!-- con2 -->
    <div class="con2">
		<form id="frm" name="frm" method="post" action="/admin/logAllGraph.dowon">
			<div class="con2_1">
			</div>
			<div class="con2_2">
				검색범위
				<input type="text" name="toYear" id="toYear" size="10" maxlength="20" class="ui-widget-content ui-corner-all search_value" readonly/>~
				<input type="text" name="fromYear" id="fromYear" size="10" maxlength="20" class="ui-widget-content ui-corner-all search_value" readonly/>
			</div>
		</form>
    </div>    
   	<!-- //con2 -->
	
	
	<!-- con3 -->
    <div class="con3">
    
		<!-- 누적 방문자 -->
		<div id="resultList_logVisitor" style="height: 300px; width: 100%;" class="chartC"> </div>

		<!-- 메뉴별 로그 -->
		<div id="resultList_logVisitorUrl_front" style="height: 300px; width: 100%;" class="chartC"></div>
		<div id="resultList_logVisitorUrl_admin" style="height: 300px; width: 100%;" class="chartC"></div>
		
		<!-- 회원가입 경로 -->
		<div id="resultList_join_gbn" style="height: 300px; width: 100%;" class="chartC"></div>
		
		<!-- 브라우저구분 -->
		<div id="resultList_logBrowser_gbn" style="height: 300px; width: 100%;" class="chartC"></div>
		<!-- 모바일구분 -->
		<div id="resultList_logMobine_gbn" style="height: 300px; width: 100%;" class="chartC"></div>
		
    </div>   	
    <!-- //con3 -->
        
</div>
<!-- //contens -->

<jsp:include page="/common/admin_footer.dowon" />

</div>
<!-- //wrap -->

</body>

</html>
