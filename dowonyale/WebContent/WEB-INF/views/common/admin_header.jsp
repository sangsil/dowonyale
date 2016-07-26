<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<script type="text/javascript">

$(function(){
	/**
	 * 메뉴
	 * **/
	$("#mainNav").buttonset();
	
	/**
	 * 상단버튼
	 * **/	
	$( "#btn_logout" ).button({icons: {primary: "ui-icon-power"}});
	$("#btn_site").button({icons: {primary: "ui-icon-heart"}});
	
	/**
	 * 테이블 하단 버튼
	 * **/	
	$("#btn_excel").button({icons: {primary: "ui-icon-document"}});
	$("#btn_list").button({icons: {primary: "ui-icon-document"}});
	$("#btn_del").button({icons: {primary: "ui-icon-trash"}});
	$("#btn_reg").button({icons: {primary: "ui-icon-plusthick"}});
	$("#btn_del_cancel").button({icons: {primary: "ui-icon-plusthick"}});
	
	$("#btn_site").bind("click",function(){$(location).attr("href","/");});
	
	/**
	 * 로그아웃 다이알로그
	 * **/
	$("#logoutDialog").dialog({autoOpen:false,modal:true,bgiframe: true});
	
	$("#btn_logout").click(function(e) {
		e.preventDefault();
		
		$("#logoutDialog").dialog('option', 'buttons', {
		        "확인" : function() {
		        	$(location).attr("href","/admin/logout.dowon");
		            },
		        "취소" : function() {
		            $(this).dialog("close");
		            }
		        });
		$("#logoutDialog").dialog("open");
	});

	$(".header_logo").bind("click",function(){$(location).attr('href', '/admin');});
	
	//상단메뉴 자동선택
	$("#menu${param.depth1}").click();
	
	$("#menu1").bind("click",function(){$(location).attr('href', '/admin/userList.dowon');});
// 	$("#menu2").bind("click",function(){$(location).attr('href', '/admin/jindanList.dowon');});
	$("#menu2_1").bind("click",function(){$(location).attr('href', '/admin/jindanList.dowon');});
	$("#menu2_2").bind("click",function(){$(location).attr('href', '/admin/jindanAnsList.dowon');});
// 	$("#menu3").bind("click",function(){$(location).attr('href', '/admin/gongjiList.dowon');});
	$("#menu3_1").bind("click",function(){$(location).attr('href', '/admin/gongjiList.dowon');});
	$("#menu3_2").bind("click",function(){$(location).attr('href', '/admin/gyoukList.dowon');});
	$("#menu3_3").bind("click",function(){$(location).attr('href', '/admin/onlineList.dowon');});
	$("#menu3_4").bind("click",function(){$(location).attr('href', '/admin/jayuList.dowon');});
// 	$("#menu4").bind("click",function(){$(location).attr('href', '/admin/adongList.dowon');});
	$("#menu4_1").bind("click",function(){$(location).attr('href', '/admin/adongList.dowon');});
	$("#menu4_2").bind("click",function(){$(location).attr('href', '/admin/suyeopList.dowon');});
// 	$("#menu5").bind("click",function(){$(location).attr('href', '/admin/comcdList.dowon');});
	$("#menu5_1").bind("click",function(){$(location).attr('href', '/admin/comcdList.dowon');});
	$("#menu5_2").bind("click",function(){$(location).attr('href', '/admin/popupList.dowon');});
	$("#menu5_3").bind("click",function(){$(location).attr('href', '/admin/suyeopryoList.dowon');});
	$("#menu5_4").bind("click",function(){$(location).attr('href', '/admin/voucherList.dowon');});
	$("#menu5_5").bind("click",function(){$(location).attr('href', '/admin/chiryosaList.dowon');});
	$("#menu5_6").bind("click",function(){$(location).attr('href', '/admin/biyongList.dowon');});
// 	$("#menu7").bind("click",function(){$(location).attr('href', '/admin/logAllGraph.dowon');});
	$("#menu7_1").bind("click",function(){$(location).attr('href', '/admin/logAllGraph.dowon');});
	$("#menu7_2").bind("click",function(){$(location).attr('href', '/admin/logMonthGraph.dowon');});
	$("#menu7_3").bind("click",function(){$(location).attr('href', '/admin/logList.dowon');});
	
});
</script>
<!-- header -->
<div class="header">
  <div class="header_logo btn"></div>
  <div class="header_info">
	<button id="btn_logout" class="com_fright">로그아웃</button>
    <button id="btn_site" class="com_fright">사이트이동</button>
	<div id="logIn_info" class="com_fright"><c:out value="${sessionScope.USER_NAME}" /> 님</div>          
  </div>
</div>
<!-- //header -->

<!-- menu -->
<div class="topMenu">
<div id="mainNav">
	<c:choose>
		<c:when test="${sessionScope.USER_TYPE eq 'A'}">
		    <input type="radio" id="menu1" name="menu" /><label for="menu1">회원관리</label>
		    <div class="menu-item">
		        <input type="radio" id="menu2" name="menu" />
		        <label for="menu2">자가진단관리</label>
		        <div class="hover-menu">
		            <div class="menu-item">
		                <input type="radio" id="menu2_1" name="subMenu3" />
		                <label for="menu2_1">항목관리</label>
		            </div>
		            <div class="menu-item">
		                <input type="radio" id="menu2_2" name="subMenu3" />
		                <label for="menu2_2">진단결과</label>
		            </div>
		        </div>
		    </div>
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>

		    <div class="menu-item">
		        <input type="radio" id="menu3" name="menu" />
		        <label for="menu3">커뮤니티관리</label>
		        <div class="hover-menu">
		            <div class="menu-item">
		                <input type="radio" id="menu3_1" name="subMenu4" />
		                <label for="menu3_1">공지사항</label>
		            </div>
		            <div class="menu-item">
		                <input type="radio" id="menu3_2" name="subMenu4" />
		                <label for="menu3_2">교육공지</label>
		            </div>
		            <div class="menu-item">
		                <input type="radio" id="menu3_3" name="subMenu4" />
		                <label for="menu3_3">온라인상담</label>
		            </div>
		            <div class="menu-item">
		                <input type="radio" id="menu3_4" name="subMenu4" />
		                <label for="menu3_4">자유게시판</label>
		            </div>
		        </div>
		    </div>
		    <div class="menu-item">
		        <input type="radio" id="menu4" name="menu" />
		        <label for="menu4">아동/수업</label>
		        <div class="hover-menu">
		            <div class="menu-item">
		                <input type="radio" id="menu4_1" name="subMenu4" />
		                <label for="menu4_1">아동관리</label>
		            </div>
		            <div class="menu-item">
		                <input type="radio" id="menu4_2" name="subMenu4" />
		                <label for="menu4_2">수업관리</label>
		            </div>
		            <div class="menu-item">
		                <input type="radio" id="menu4_3" name="subMenu4" />
		                <label for="menu4_3">시간표관리</label>
		            </div>
		        </div>
		    </div>
    
	<c:choose>
		<c:when test="${sessionScope.USER_TYPE eq 'A'}">
		    <div class="menu-item">
		        <input type="radio" id="menu5" name="menu" />
		        <label for="menu5">사이트관리</label>
		        <div class="hover-menu">
		            <div class="menu-item">
		                <input type="radio" id="menu5_1" name="subMenu4" />
		                <label for="menu5_1">코드관리</label>
		            </div>
   		            <div class="menu-item">
		                <input type="radio" id="menu5_2" name="subMenu4" />
		                <label for="menu5_2">팝업관리</label>
		            </div>
		            <div class="menu-item">
		                <input type="radio" id="menu5_3" name="subMenu4" />
		                <label for="menu5_3">수업료관리</label>
		            </div>
		            <div class="menu-item">
		                <input type="radio" id="menu5_4" name="subMenu4" />
		                <label for="menu5_4">바우처관리</label>
		            </div>
		            <div class="menu-item">
		                <input type="radio" id="menu5_5" name="subMenu4" />
		                <label for="menu5_5">치료사관리</label>
		            </div>
		            <div class="menu-item">
		                <input type="radio" id="menu5_6" name="subMenu4" />
		                <label for="menu5_6">비용관리</label>
		            </div>
		            <div class="menu-item">
		                <input type="radio" id="menu5_7" name="subMenu4" />
		                <label for="menu5_7">지출관리</label>
		            </div>
		        </div>
		    </div>
		    <div class="menu-item">
		        <input type="radio" id="menu6" name="menu" />
		        <label for="menu6">통계관리</label>
		        <div class="hover-menu">
		            <div class="menu-item">
		                <input type="radio" id="menu6_1" name="subMenu4" />
		                <label for="menu6_1">아동현황</label>
		            </div>
		            <div class="menu-item">
		                <input type="radio" id="menu6_2" name="subMenu4" />
		                <label for="menu6_2">수입현황</label>
		            </div>
		            <div class="menu-item">
		                <input type="radio" id="menu6_3" name="subMenu4" />
		                <label for="menu6_3">지출현황</label>
		            </div>
		            <div class="menu-item">
		                <input type="radio" id="menu6_4" name="subMenu4" />
		                <label for="menu6_4">그래프</label>
		            </div>
		        </div>
		    </div>
   		    <div class="menu-item">
		        <input type="radio" id="menu7" name="menu" />
		        <label for="menu7">로그현황</label>
		        <div class="hover-menu">
 		            <div class="menu-item">
		                <input type="radio" id="menu7_1" name="subMenu4" />
		                <label for="menu7_1">연간차트</label>
		            </div>
 		            <div class="menu-item">
		                <input type="radio" id="menu7_2" name="subMenu4" />
		                <label for="menu7_2">월간차트</label>
		            </div>
		            <div class="menu-item">
		                <input type="radio" id="menu7_3" name="subMenu4" />
		                <label for="menu7_3">로그데이타</label>
		            </div>
		        </div>
		    </div>
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>	    
</div>
</div>
<!-- //menu -->

<div id="logoutDialog" title="로그아웃">
	로그아웃 하시겠습니까?
</div>