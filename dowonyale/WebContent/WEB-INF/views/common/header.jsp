<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<script type="text/javascript">
$(function(){
	//서브메뉴 노출
	$(".menu_0"+"${param.depth1}"+"_subLi").show();
	//서브메뉴 선택된항목 생상
	$(".menu #menu_sub ul .menu_0"+"${param.depth1}"+"_subLi div:eq("+"${param.depth2-1}"+")").css("background-image", "url(/images/menu/01_sub0"+"${param.depth1}"+"_0"+"${param.depth2}"+"_d.png)");
	
	var curMenu="";
	//depth1
	$("#menu_01, #menu_02, #menu_03, #menu_04, #menu_05").hover(
		function(){
			if(curMenu != $(this).attr('id')){
				curMenu = $(this).attr('id');
				$(".menu_01_subLi, .menu_02_subLi, .menu_03_subLi, .menu_04_subLi, .menu_05_subLi").hide();
			}
			$("."+$(this).attr('id')+"_subLi").show();
		},
		function(){
			return;	
		}
	);
	
	//depth2
	var curMenu2="menu_sub0"+"${param.depth1}"+"_0"+"${param.depth2}";
	$("#menu_sub01_01, #menu_sub01_02, #menu_sub01_03, #menu_sub01_04, #menu_sub01_05,#menu_sub02_01, #menu_sub02_02, #menu_sub02_03, #menu_sub02_04, #menu_sub02_05, #menu_sub03_01, #menu_sub03_02,#menu_sub04_01, #menu_sub04_02, #menu_sub04_03,#menu_sub05_01, #menu_sub05_02, #menu_sub05_03, #menu_sub05_04, #menu_sub05_05").hover(
			function(){
				//alert($(this).attr('id').substring(8,$(this).attr('id').length)); //아이디 뒤에 숫자뽑기
				//선택된 메뉴가 아니면 이미지 안변함
				if(curMenu2 != $(this).attr('id')){
					$("#"+$(this).attr('id')).css("background-image", "url(/images/menu/01_sub"+$(this).attr('id').substring(8,$(this).attr('id').length)+"_d.png)");
				}
			},
			function(){
				if(curMenu2 != $(this).attr('id')){
					$("#"+$(this).attr('id')).css("background-image", "url(/images/menu/01_sub"+$(this).attr('id').substring(8,$(this).attr('id').length)+".png)");
				}else{
					return;
				}
			}
		);
	
	
	
	$(".logo").bind("click",function(){$(location).attr('href', '/');});
	
	$("#menu_sub01_01").bind("click",function(){$(location).attr('href', '/user/intro_dowon.dowon');});
	$("#menu_sub01_02").bind("click",function(){$(location).attr('href', '/user/intro_wonjang.dowon');});
	$("#menu_sub01_03").bind("click",function(){$(location).attr('href', '/user/intro_chiryosa.dowon');});
	$("#menu_sub01_04").bind("click",function(){$(location).attr('href', '/user/intro_center.dowon');});
	$("#menu_sub01_05").bind("click",function(){$(location).attr('href', '/user/intro_chaja.dowon');});

	$("#menu_sub02_01").bind("click",function(){$(location).attr('href', '/user/chiryo_eoneo.dowon');});
	$("#menu_sub02_02").bind("click",function(){$(location).attr('href', '/user/chiryo_nolyi.dowon');});
	$("#menu_sub02_03").bind("click",function(){$(location).attr('href', '/user/chiryo_inji.dowon');});
	$("#menu_sub02_04").bind("click",function(){$(location).attr('href', '/user/chiryo_geurup.dowon');});
	$("#menu_sub02_05").bind("click",function(){$(location).attr('href', '/user/chiryo_bumo.dowon');});
	
	$("#menu_sub03_01").bind("click",function(){$(location).attr('href', '/user/sangdam_sigan.dowon');});
	$("#menu_sub03_02").bind("click",function(){$(location).attr('href', '/user/sangdam_jeolcha.dowon');});

	$("#menu_sub04_01").bind("click",function(){$(location).attr('href', '/user/jaga_adhd.dowon');});
	$("#menu_sub04_02").bind("click",function(){$(location).attr('href', '/user/jaga_soa.dowon');});
	$("#menu_sub04_03").bind("click",function(){$(location).attr('href', '/user/jaga_hakseub.dowon');});
	
	$("#menu_sub05_01").bind("click",function(){$(location).attr('href', '/user/keomu_gongji.dowon');});
	$("#menu_sub05_02").bind("click",function(){$(location).attr('href', '/user/keomu_gyoyuk.dowon');});
	$("#menu_sub05_03").bind("click",function(){$(location).attr('href', '/user/keomu_online.dowon');});
	$("#menu_sub05_04").bind("click",function(){$(location).attr('href', '/user/keomu_jayu.dowon');});
	$("#menu_sub05_05").bind("click",function(){$(location).attr('href', '/user/keomu_gwanryeon.dowon');});

});

function goAdmin(){
	$(location).attr('href', '/admin/main.dowon');
}


 
</script>
        <!--	log	-->
        <div class="log">
        	<div id="logInfo">
                <c:choose>
                	<c:when test="${empty sessionScope.USER_ID}">
		        		<a href="javascript:insertForm()"><img src="/images/01_top_menu_01.png" width="78px" height="21px" alt="회원등록"/></a>
		        		<a href="javascript:goLogIn()"><img src="/images/01_top_menu_02.png" width="78px" height="21px" id="logIn" alt="로그인"/></a>
                	</c:when>
                	<c:otherwise>
                		<div id="loginInfo" class="btn"><c:out value="${sessionScope.USER_NAME}"></c:out> 님</div>
		        		<a href="javascript:goLogOut()"><img src="/images/01_top_menu_03.png" width="78px" height="21px" id="logOut" alt="로그아웃"/></a>
                	</c:otherwise>
                </c:choose>
        		<a href="javascript:goAdmin()"><img src="/images/01_top_menu_04.png" width="88px" height="21px" id="logOut" alt="관리자"/></a>
        	</div>

        </div>
        <!--	log	-->
        <!--	top	-->
        <div class="top">
            <div class="logo btn"></div>
            <!--	menu	-->
            <div class="menu">
                <div id="menu_top">
                    <ul id="MenuBar">
	                    <li id="menu_01"><a href="/user/intro_dowon.dowon"><img src="/images/menu/01_top_menu01.png" width="101" height="17" alt="도원예일소개" /></a></li>
	                    <li id="menu_02"><a href="/user/chiryo_eoneo.dowon"><img src="/images/menu/01_top_menu02.png" width="101" height="17" alt="치료프로그램" /></a></li>
	                    <li id="menu_03"><a href="/user/sangdam_sigan.dowon"><img src="/images/menu/01_top_menu03.png" width="101" height="17" alt="상담이용안내" /></a></li>
	                    <li id="menu_04"><a href="/user/jaga_adhd.dowon"><img src="/images/menu/01_top_menu04.png" width="68" height="17" alt="자가진단" /></a></li>
	                    <li id="menu_05"><a href="/user/keomu_gongji.dowon"><img src="/images/menu/01_top_menu05.png" width="65" height="17" alt="커뮤니티" /></a></li>
                    </ul>
                </div>
            	
                <div id="menu_sub">
                    <ul>
	                    <li class="menu_01_subLi">
	                      <div id="menu_sub01_01"></div>
	                      <div id="menu_sub01_02"></div>
	                      <div id="menu_sub01_03"></div>
	                      <div id="menu_sub01_04"></div>
	                      <div id="menu_sub01_05"></div>
	                     </li>
	                    <li class="menu_02_subLi">
	                      <div id="menu_sub02_01"></div>
	                      <div id="menu_sub02_02"></div>
	                      <div id="menu_sub02_03"></div>
	                      <div id="menu_sub02_04"></div>
	                      <div id="menu_sub02_05"></div>  
	                    </li>
	                    <li class="menu_03_subLi">
	                      <div id="menu_sub03_01"></div>
	                      <div id="menu_sub03_02"></div>
	                    </li>
	                    <li class="menu_04_subLi">
	                      <div id="menu_sub04_01"></div>
	                      <div id="menu_sub04_02"></div>
	                      <div id="menu_sub04_03"></div>
	                    </li>
	                    <li class="menu_05_subLi">
	                      <div id="menu_sub05_01"></div>
	                      <div id="menu_sub05_02"></div>
	                      <div id="menu_sub05_03"></div>
	                      <div id="menu_sub05_04"></div>
	                      <div id="menu_sub05_05"></div>
	                    </li>
                    </ul>
                </div>
                
       	  </div>
            <!--	menu	-->
        </div>
    	<!--	top	-->


