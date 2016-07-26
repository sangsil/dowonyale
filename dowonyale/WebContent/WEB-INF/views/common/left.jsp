<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<script type="text/javascript">
$(function(){
	//서브메뉴 노출
	$("#left_menu_0"+"${param.depth1}").show();
	//선택메뉴 서클이미지 삽입
	$("#left_menu_sub0"+"${param.depth1}"+"_0"+"${param.depth2}"+"_s").css("background-image", "url(/images/sub/menu/circle.png)");
	//선택메뉴 진한글자로 변경
	$("#left_menu_sub0"+"${param.depth1}"+"_0"+"${param.depth2}").css("background-image", "url(/images/sub/menu/02_menu_0"+"${param.depth1}"+"_0"+"${param.depth2}"+"_d.png)");
	
	var curMenu="left_menu_sub0"+"${param.depth1}"+"_0"+"${param.depth2}";
	$("#left_menu_sub01_01,	#left_menu_sub01_02,#left_menu_sub01_03,#left_menu_sub01_04,#left_menu_sub01_05,#left_menu_sub02_01,#left_menu_sub02_02,#left_menu_sub02_03,#left_menu_sub02_04,#left_menu_sub02_05,#left_menu_sub03_01,#left_menu_sub03_02,#left_menu_sub04_01,#left_menu_sub04_02,#left_menu_sub04_03,#left_menu_sub05_01,#left_menu_sub05_02,#left_menu_sub05_03,#left_menu_sub05_04,#left_menu_sub05_05").hover(
			function(){
				//alert($(this).attr('id').substring(13,$(this).attr('id').length)); 아이디 뒤에 숫자뽑기
				//선택된 메뉴가 아니면 이미지 안변함
				if(curMenu != $(this).attr('id')){
					$("#"+$(this).attr('id')).css("background-image", "url(/images/sub/menu/02_menu_"+$(this).attr('id').substring(13,$(this).attr('id').length)+"_d.png)");
				}
			},
			function(){
				if(curMenu != $(this).attr('id')){
					$("#"+$(this).attr('id')).css("background-image", "url(/images/sub/menu/02_menu_"+$(this).attr('id').substring(13,$(this).attr('id').length)+".png)");
				}else{
					return;
				}
			}
		);
	
	
	/*
	var curMenu="";
	$("#menu_01, #menu_02, #menu_03, #menu_04, #menu_05").hover(
		function(){
			if(curMenu != $(this).attr('id')){
				curMenu = $(this).attr('id');
				//$("[class$='_subLi'").hide();
				$(".menu_01_subLi, .menu_02_subLi, .menu_03_subLi, .menu_04_subLi, .menu_05_subLi").hide();
			}
			$("."+$(this).attr('id')+"_subLi").show();
		},
		function(){
			return;	
		}
	);
	*/
	
	$("#left_menu_sub01_01").bind("click",function(){$(location).attr('href', '/user/intro_dowon.dowon');});
	$("#left_menu_sub01_02").bind("click",function(){$(location).attr('href', '/user/intro_wonjang.dowon');});
	$("#left_menu_sub01_03").bind("click",function(){$(location).attr('href', '/user/intro_chiryosa.dowon');});
	$("#left_menu_sub01_04").bind("click",function(){$(location).attr('href', '/user/intro_center.dowon');});
	$("#left_menu_sub01_05").bind("click",function(){$(location).attr('href', '/user/intro_chaja.dowon');});

	$("#left_menu_sub02_01").bind("click",function(){$(location).attr('href', '/user/chiryo_eoneo.dowon');});
	$("#left_menu_sub02_02").bind("click",function(){$(location).attr('href', '/user/chiryo_nolyi.dowon');});
	$("#left_menu_sub02_03").bind("click",function(){$(location).attr('href', '/user/chiryo_inji.dowon');});
	$("#left_menu_sub02_04").bind("click",function(){$(location).attr('href', '/user/chiryo_geurup.dowon');});
	$("#left_menu_sub02_05").bind("click",function(){$(location).attr('href', '/user/chiryo_bumo.dowon');});
	
	$("#left_menu_sub03_01").bind("click",function(){$(location).attr('href', '/user/sangdam_sigan.dowon');});
	$("#left_menu_sub03_02").bind("click",function(){$(location).attr('href', '/user/sangdam_jeolcha.dowon');});

	$("#left_menu_sub04_01").bind("click",function(){$(location).attr('href', '/user/jaga_adhd.dowon');});
	$("#left_menu_sub04_02").bind("click",function(){$(location).attr('href', '/user/jaga_soa.dowon');});
	$("#left_menu_sub04_03").bind("click",function(){$(location).attr('href', '/user/jaga_hakseub.dowon');});
	
	$("#left_menu_sub05_01").bind("click",function(){$(location).attr('href', '/user/keomu_gongji.dowon');});
	$("#left_menu_sub05_02").bind("click",function(){$(location).attr('href', '/user/keomu_gyoyuk.dowon');});
	$("#left_menu_sub05_03").bind("click",function(){$(location).attr('href', '/user/keomu_online.dowon');});
	$("#left_menu_sub05_04").bind("click",function(){$(location).attr('href', '/user/keomu_jayu.dowon');});
	$("#left_menu_sub05_05").bind("click",function(){$(location).attr('href', '/user/keomu_gwanryeon.dowon');});
});
</script>
<!--	left	-->
	<div class="left_menu">
		<div id="left_menu_01">
			<div class="left_menu_title_01"></div>
			<ul class="left_menu_01">
				<li id="left_menu_01_01"><div id="left_menu_sub01_01_s" class="selectedMenu"></div><div id="left_menu_sub01_01" class="btn"></div></li>
				<li id="left_menu_01_02"><div id="left_menu_sub01_02_s" class="selectedMenu"></div><div id="left_menu_sub01_02" class="btn"></div></li>
				<li id="left_menu_01_03"><div id="left_menu_sub01_03_s" class="selectedMenu"></div><div id="left_menu_sub01_03" class="btn"></div></li>
				<li id="left_menu_01_04"><div id="left_menu_sub01_04_s" class="selectedMenu"></div><div id="left_menu_sub01_04" class="btn"></div></li>
				<li id="left_menu_01_05"><div id="left_menu_sub01_05_s" class="selectedMenu"></div><div id="left_menu_sub01_05" class="btn"></div></li>
			</ul>
		</div>
		<div id="left_menu_02">
			<div class="left_menu_title_02"></div>
			<ul class="left_menu_02">
				<li id="left_menu_02_01"><div id="left_menu_sub02_01_s" class="selectedMenu"></div><div id="left_menu_sub02_01" class="btn"></div></li>
				<li id="left_menu_02_02"><div id="left_menu_sub02_02_s" class="selectedMenu"></div><div id="left_menu_sub02_02" class="btn"></div></li>
				<li id="left_menu_02_03"><div id="left_menu_sub02_03_s" class="selectedMenu"></div><div id="left_menu_sub02_03" class="btn"></div></li>
				<li id="left_menu_02_04"><div id="left_menu_sub02_04_s" class="selectedMenu"></div><div id="left_menu_sub02_04" class="btn"></div></li>
				<li id="left_menu_02_05"><div id="left_menu_sub02_05_s" class="selectedMenu"></div><div id="left_menu_sub02_05" class="btn"></div></li>
			</ul>
	 	</div>
		<div id="left_menu_03">
			<div class="left_menu_title_03"></div>
			<ul class="left_menu_03">
				<li id="left_menu_03_01"><div id="left_menu_sub03_01_s" class="selectedMenu"></div><div id="left_menu_sub03_01" class="btn"></div></li>
				<li id="left_menu_03_02"><div id="left_menu_sub03_02_s" class="selectedMenu"></div><div id="left_menu_sub03_02" class="btn"></div></li>
			</ul>
	 	</div>
		<div id="left_menu_04">
			<div class="left_menu_title_04"></div>
			<ul class="left_menu_04">
				<li id="left_menu_04_01"><div id="left_menu_sub04_01_s" class="selectedMenu"></div><div id="left_menu_sub04_01" class="btn"></div></li>
				<li id="left_menu_04_02"><div id="left_menu_sub04_02_s" class="selectedMenu"></div><div id="left_menu_sub04_02" class="btn"></div></li>
				<li id="left_menu_04_03"><div id="left_menu_sub04_03_s" class="selectedMenu"></div><div id="left_menu_sub04_03" class="btn"></div></li>
			</ul>
	 	</div>
		<div id="left_menu_05">
			<div class="left_menu_title_05"></div>
			<ul class="left_menu_05">
				<li id="left_menu_05_01"><div id="left_menu_sub05_01_s" class="selectedMenu"></div><div id="left_menu_sub05_01" class="btn"></div></li>
				<li id="left_menu_05_02"><div id="left_menu_sub05_02_s" class="selectedMenu"></div><div id="left_menu_sub05_02" class="btn"></div></li>
				<li id="left_menu_05_03"><div id="left_menu_sub05_03_s" class="selectedMenu"></div><div id="left_menu_sub05_03" class="btn"></div></li>
				<li id="left_menu_05_04"><div id="left_menu_sub05_04_s" class="selectedMenu"></div><div id="left_menu_sub05_04" class="btn"></div></li>
				<li id="left_menu_05_05"><div id="left_menu_sub05_05_s" class="selectedMenu"></div><div id="left_menu_sub05_05" class="btn"></div></li>
			</ul>
	 	</div>
	</div> 
<!--	//left	--> 
