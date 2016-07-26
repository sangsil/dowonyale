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

		$("#searchYear").val("${searchVo.searchYear }");

		var str = "";
		// 년도 설정
		for (var i="${searchVo.fromYear }"; i<= "${searchVo.toYear }"; i++) {
			
			if(i == "${searchVo.searchYear }"){
				str += "<option value='" + i + "' selected='selected'>" + i + "</option>";
			}else{
				str += "<option value='" + i + "' >" + i + "</option>";
			}
		}
		$("#searchYear").html(str);		
		
		/*	검색	*/
		$("#searchYear").on("change", function(){
			$("form[name=frm]").submit();
		});
		/*	//검색	*/
		
		
		// 누적 방문자
		// 프론트
		<c:forEach items="${resultList_logVisitor_0}" var="item" varStatus="status">
			var dataPointsA = { "x": new Date("${searchVo.searchYear }", "${item.title -1}", 1), "y": parseInt("${item.cnt1}") };
			dataPointsArray_0.push(dataPointsA);
			menu_name_0 = "${item.menu_name}";
			total_logVisitor_0 += parseInt("${item.cnt1}");
			rows = parseInt("${status.count}");
		</c:forEach>
		// 어드민
		<c:forEach items="${resultList_logVisitor_1}" var="item">
		var dataPointsA = { "x": new Date("${searchVo.searchYear }", "${item.title -1}", 1), "y": parseInt("${item.cnt1}") };
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
			// 누적 방문자
			var resultList_logVisitor = new CanvasJS.Chart("resultList_logVisitor",
			{
				title:{
			        text: "방문자수",
			        fontColor: "#695A42"
				},
                animationEnabled: true,
				axisX:{
					gridColor: "Silver",
					tickColor: "silver",
					valueFormatString: "MMM"
				},                        
                toolTip:{
                  shared:true
                },
				theme: "theme2",
				axisY: {
					gridColor: "Silver",
					tickColor: "silver"
				},
				legend:{
					verticalAlign: "center",
					horizontalAlign: "right"
				},
				data: [
				{        
					type: "line",
					showInLegend: true,
					lineThickness: 2,
					name:menu_name_0,
					markerType: "square",
					color: "#F08080",
					dataPoints: dataPointsArray_0
				},
				{        
					type: "line",
					showInLegend: true,
					name:menu_name_1,
					color: "#20B2AA",
					lineThickness: 2,
					dataPoints: dataPointsArray_1
				}
				],
	          legend:{
	            cursor:"pointer",
	            itemclick:function(e){
	              if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
	              	e.dataSeries.visible = false;
	              }
	              else{
	                e.dataSeries.visible = true;
	              }
	              chart.render();
	            }
	          }
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
    <div class="con1">월간로그차트</div>
   	<!-- //con1 -->
	
	
    <!-- con2 -->
    <div class="con2">
		<form id="frm" name="frm" method="post" action="/admin/logMonthGraph.dowon">
			<div class="con2_1">
			</div>
			<div class="con2_2">
				<select name="searchYear" id="searchYear" class="ui-widget-content ui-corner-all search_value"></select>
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
