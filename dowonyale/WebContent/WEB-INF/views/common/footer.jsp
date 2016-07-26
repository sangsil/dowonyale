<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="true" %>

<!-- 카카오 로그인 스크립트  -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="//connect.facebook.net/en_US/all.js"></script>

<spring:eval expression="@config['KAKAO_LOGIN_APP_ID']" var="kakao_login_app_id" />
<spring:eval expression="@config['FACEBOOK_LOGIN_APP_ID']" var="facebook_login_app_id" />
<spring:eval expression="@config['LOGIN_GBN_00']" var="login_gbn_00" />		<!-- Mee  -->
<spring:eval expression="@config['LOGIN_GBN_01']" var="login_gbn_01" />		<!-- 네이버  -->
<spring:eval expression="@config['LOGIN_GBN_02']" var="login_gbn_02" />		<!-- 카카오  -->
<spring:eval expression="@config['LOGIN_GBN_03']" var="login_gbn_03" />		<!-- 구글  -->
<spring:eval expression="@config['LOGIN_GBN_04']" var="login_gbn_04" />		<!-- 페이스북  -->

<spring:eval expression="@config['FACEBOOK_LOGIN_APP_ID']" var="facebook_login_app_id" />

<script type="text/javascript">
$(function(){
	var left_position=0;
	$('#footer_left').click(function(){
		left_position += 300;
		//alert(left_position+"px");
		$('#footer_slideConteiner').animate({left:left_position+"px"},"slow");
	});
	$('#footer_right').click(function(){
		left_position -= 300;
		//alert(left_position+"px");
		$('#footer_slideConteiner').animate({left:left_position+"px"},"slow");
	});
	$("#footerLink1_1, #footerLink2_1, #footerLink3_1").bind("click",function(){window.open("http://www.kasla.or.kr/", "_blank")});
	$("#footerLink1_2, #footerLink2_2, #footerLink3_2").bind("click",function(){window.open("http://www.ksha1990.or.kr/", "_blank")});
	$("#footerLink1_3, #footerLink2_3, #footerLink3_3").bind("click",function(){window.open("http://www.kasa1986.or.kr/", "_blank")});
	$("#footerLink1_4, #footerLink2_4, #footerLink3_4").bind("click",function(){window.open("http://www.playtherapy.or.kr/", "_blank")});
	$("#footerLink1_5, #footerLink2_5, #footerLink3_5").bind("click",function(){window.open("http://www.playtherapykorea.or.kr/", "_blank")});
	$("#footerLink1_6, #footerLink2_6, #footerLink3_6").bind("click",function(){window.open("http://www.kacpt.or.kr/", "_blank")});
	$("#footerLink1_7, #footerLink2_7, #footerLink3_7").bind("click",function(){window.open("http://www.autism..or.kr/", "_blank")});
	$("#footerLink1_8, #footerLink2_8, #footerLink3_8").bind("click",function(){window.open("http://www.speechsciences.or.kr/", "_blank")});
	$("#footerLink1_9, #footerLink2_9, #footerLink3_9").bind("click",function(){window.open("http://www.korl.or.kr/", "_blank")});
	$("#footerLink1_9, #footerLink2_10, #footerLink3_10").bind("click",function(){window.open("http://www.kslp.org ", "_blank")}); 
	
	/**
	 * 로그인/아웃 다이알로그
	 * **/
	$("#logInDialog").dialog({autoOpen:false,modal:true,bgiframe: true});
	$("#logoutDialog").dialog({autoOpen:false,modal:true,bgiframe: true});
	$("#insert_user_modal").dialog({autoOpen:false,modal:true,bgiframe: true});
	$("#update_user_modal").dialog({autoOpen:false,modal:true,bgiframe: true});
	
	//아이디중복체크
	$("#duplChk").button({icons: {primary: "ui-icon-check"}})
	.click(function(){
		if($("#iuser_id").val().length < 1) {alert("아이디를 확인해 주세요"); $("#iuser_id").focus(); return false;}
		$("#insertModalForm").ajaxForm({
			url : "/user/userDuplChk.dowon",
			type : "post",
			dataType: "json",
			success: function(result){
				if(result.result == 0)
				{
					alert("사용 가능한 ID 입니다.");
					$("#user_id_dup").val($("#iuser_id").val());
				}
				else
				{
					alert("존재하는 ID 입니다.\n다른 ID를 입력 해 주십시오.");
					$("#user_id_dup").val("");
				}
			},
			error: function(result){
				alert("오류입니다. 관리자에게 문의하세요.");
			}
		});
	});
	/*등록시 이메일 중복체크*/
	$("#iEmailduplChk").button({icons: {primary: "ui-icon-check"}})
	.click(function(){
		if($("#iemail1").val().length < 1) {alert("이메일을 확인해 주세요"); $("#iemail1").focus(); return false;}
		if($("#iemail2").val().length < 1) {alert("이메일을 확인해 주세요"); $("#iemail2").focus(); return false;}
		$("#insertModalForm").ajaxForm({
			url : "/user/userEmailDuplChk.dowon",
			type : "post",
			dataType: "json",
			success: function(result){
				if(result.result == 0)
				{
					alert("사용 가능한 Email 입니다.");
					$("#iemail1_dup").val($("#iemail1").val());
					$("#iemail2_dup").val($("#iemail2").val());
				}
				else
				{
					alert("존재하는 Email 입니다.\n다른 Email을 입력 해 주십시오.");
					$("#iemail1_dup, #iemail1_dup").val("");
				}
			},
			error: function(result){
				alert("오류입니다. 관리자에게 문의하세요.");
			}
		});
	});
	/*수정시 이메일 중복체크*/
	$("#uEmailduplChk").button({icons: {primary: "ui-icon-check"}})
	.click(function(){
		if($("#uemail1").val().length < 1) {alert("이메일을 확인해 주세요"); $("#uemail1").focus(); return false;}
		if($("#uemail2").val().length < 1) {alert("이메일을 확인해 주세요"); $("#uemail2").focus(); return false;}
		$("#updateModalForm").ajaxForm({
			url : "/user/userEmailDuplChk.dowon",
			type : "post",
			dataType: "json",
			success: function(result){
				if(result.result == 0)
				{
					alert("사용 가능한 Email 입니다.");
					$("#uemail1_dup").val($("#uemail1").val());
					$("#uemail2_dup").val($("#uemail2").val());
				}
				else
				{
					alert("존재하는 Email 입니다.\n다른 Email을 입력 해 주십시오.");
					$("#uemail1_dup, #uemail1_dup").val("");
				}
			},
			error: function(result){
				alert("오류입니다. 관리자에게 문의하세요.");
			}
		});
	});
	
	$("#iuser_id,#iuser_pw,#iuser_pw_confirm,#uuser_pw,#uuser_pw_confirm").alphanumeric();
	$("#iphone1,#iphone2,#iphone3,#uphone1,#uphone2,#uphone3").numeric;

	//회원정보수정
	$("#loginInfo").bind("click", function(){
		$("#update_user_modal").show();
		$.ajax({
			url : "/user/userDetail.dowon",
			type : "post",
			dataType: "json",
			success: function(result){
				$("#suuser_id").text(result.result.user_id);
				$("#uemail1_dup").val(result.result.email1);
				$("#uemail2_dup").val(result.result.email2);
				$("#uuser_id").val(result.result.user_id);
				$("#uuser_name").val(result.result.user_name);
				$("#uuser_pw, #uuser_pw_confirm").val(result.result.user_pw);
				$("#uemail1").val(result.result.email1);
				$("#uemail2").val(result.result.email2);
				$("#uphone1").val(result.result.phone1);
				$("#uphone2").val(result.result.phone2);
				$("#uphone3").val(result.result.phone3);
				$("#uchild_name").val(result.result.child_name);
				$("#update_user_modal").dialog("open");
			},
			error: function(result){
				alert("수정 오류입니다. 관리자에게 문의하세요.");
			}
		});
	});
	$("#update_user_modal").dialog({
		autoOpen: false,
		width: 470,
		modal: true,
		buttons: {
			"수정": function(){
				if($("#uuser_name").val().length < 1 || $("#uuser_name").val().length > 50) {alert("이름을 확인해 주세요"); $("#uuser_name").focus(); return false;}
				
				// 자체 등록자에 한
				if("${sessionScope.LOGIN_GBN}" == "${login_gbn_00}"){
					if($("#uuser_pw").val().length < 1 || $("#uuser_pw").val().length > 20) {alert("비밀번호를 확인해 주세요"); $("#uuser_pw").focus(); return false;}
					if($("#uuser_pw_confirm").val().length < 1) {alert("비밀번호를 확인해 주세요"); $("#uuser_pw_confirm").focus(); return false;}
					if($("#uemail1").val().length < 1 || $("#uemail1").val().length > 20) {alert("이메일을 확인해 주세요"); $("#uemail1").focus(); return false;}
					if($("#uemail2").val().length < 1 || $("#uemail2").val().length > 20) {alert("이메일을 확인해 주세요"); $("#uemail2").focus(); return false;}
//	 				if($("#uphone1").val().length < 1 || $("#uphone1").val().length > 3) {alert("전화번호를 확인해 주세요"); $("#uphone1").focus(); return false;}
//	 				if($("#uphone2").val().length < 1 || $("#uphone2").val().length > 4) {alert("전화번호를 확인해 주세요"); $("#uphone2").focus(); return false;}
//	 				if($("#uphone3").val().length < 1 || $("#uphone3").val().length > 4) {alert("전화번호를 확인해 주세요"); $("#uphone3").focus(); return false;}
					if($("#uuser_pw").val() != $("#uuser_pw_confirm").val()) {alert("비밀번호가 일치하지 않습니다."); $("#uuser_pw_confirm").focus(); return false;}
					if($("#uemail1").val() != $("#uemail1_dup").val()) {alert("이메일 중복 확인을 해 주십시오"); return false;}
					if($("#uemail2").val() != $("#uemail2_dup").val()) {alert("이메일 중복 확인을 해 주십시오"); return false;}
				}

				if(confirm("수정 하시겠습니까?"))
				{
					$("#updateModalForm").ajaxSubmit({
						url : "/user/userUpdate.dowon",
						type : "post",
						dataType: "json",
						success: function(result){
							alert("수정 되었습니다.");
							location.reload();
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
	//회원정보수정 end
	
	//s:아이디 패스 찾기다이알로그
	$("#idPwDialog").dialog({
			autoOpen: false,
			width: 360,
			modal: true,
			buttons: {
	        "임시비밀번호발송" : function() {
				$("#idPwForm").ajaxSubmit({
					url : "/user/idpwSendMail.dowon",
					type : "post",
					dataType: "json",
					success: function(result){
						if(result.resultStr == "Y"){
							alert("메일로 임시비밀번호가 전송되었습니다.");
							$("#idPwDialog").dialog("close");
						}
						else if(result.resultStr == "N"){
							alert("정보가 일치하지 않습니다\n메일 주소를 확인해 주세요.");
						}
						else{
							alert("메일전송  오류입니다. 관리자에게 문의하세요.");
							$("#idPwDialog").dialog("close");
						}
					},
					error: function(result){
						alert("메일전송   오류입니다. 관리자에게 문의하세요.");
						$(this).dialog("close");
					}
				});
	        },
	        "취소" : function() {
	            $(this).dialog("close");
	            }
	        }}
	);
	//e:아이디 패스 찾기다이알로그
	
});

/*
 * s:로그아웃
 */
function goLogOut(){
	$("#logoutDialog").show();
	$("#logoutDialog").dialog('option', 'buttons', {
	        "확인" : function() {
	        	//$(location).attr("href","/user/logout.dowon");
					$("#logForm").ajaxSubmit({
						url : "/user/logout.dowon",
						type : "post",
						dataType: "text",
						success: function(result){
							if(result == "Y"){
								
								
								
								if("${sessionScope.LOGIN_GBN}" == "${login_gbn_01}"){
									//네이버로그아웃 
									goMain();
								}else if("${sessionScope.LOGIN_GBN}" == "${login_gbn_02}"){
									//카카오로그아웃 
									  // 사용할 앱의 JavaScript 키를 설정해 주세요.
// 									  Kakao.init("${kakao_login_app_id }");
									  // 카카오 로그인 버튼을 생성합니다.
									  Kakao.Auth.logout(goMain);
								}else if("${sessionScope.LOGIN_GBN}" == "${login_gbn_04}"){
									goMain();
// 								    FB.getLoginStatus(function(response) {
// 								        statusChangeCallback(response);
// 							      	});
// 									FB.logout(function(response) {
// 										   // Person is now logged out 
// 										goMain();
// 									});
								}else{
									goMain();
								}
								
							}
							else{
								alert("로그아웃  오류입니다. 관리자에게 문의하세요.");
								$(this).dialog("close");
							}
						},
						error: function(result){
							alert("로그아웃  오류입니다. 관리자에게 문의하세요.\n"+result);
							$(this).dialog("close");
						}
					});
	            },
	        "취소" : function() {
	            $(this).dialog("close");
	            }
	        });
	$("#logoutDialog").dialog("open");
}

goMain = function(){
	alert("로그아웃 되었습니다.");
	$(location).attr("href","/user/main.dowon");
};

/**
 * e:로그아웃
 */

/**
 * s:로그인
 */
function goLogIn(){
	$("#logInDialog").show();
	$("#logInDialog").dialog('option', 'buttons', {
        "확인" : function() {
        	//$(location).attr("href","/user/logout.dowon");
        		if($("#user_id").val() == ""){alert("아이디를 입력하세요."); $("#user_id").focus(); return;}
        		if($("#user_pw").val() == ""){alert("비밀번호를 입력하세요."); $("#user_pw").focus(); return;}
				$("#logForm").ajaxSubmit({
					url : "/user/login.dowon",
					type : "post",
					dataType: "text",
					data: { "user_id" : $('#user_id').val(),  "user_pw" : $('#user_pw').val() },
					success: function(result){
						if(result == "Y"){
							alert("로그인 되었습니다.");
							location.reload();
							//$("#logInDialog").dialog("close");
						}
						else{
							alert("로그인 실패입니다. \n 아이디와 비밀번호를 확인해 주세요");
							$("#user_id, #user_pw").val("");
							$("#logInDialog").dialog("close");
						}
					},
					error: function(result){
						alert("로그인  오류입니다. 관리자에게 문의하세요.");
						$("#user_id, #user_pw").val("");
						$("#logInDialog").dialog("close");
					}
				});
            },
        "취소" : function() {
            $(this).dialog("close");
            },
        "비밀번호찾기" : function() {
        	$(this).dialog("close");
        	$("#idPwDialog").dialog("open");
	   		}
        });
	$("#logInDialog").dialog("open");
}

//네이버 로그인 
var goNaverUrl = "/user/form_naver.dowon";
loginWithNaver = function(){
	$.ajax({
		type:"post",
		async:true,
		url:goNaverUrl,
		data:$("form[name=logForm]").serialize(),
		dataType:"json",
		success:function(data){
			if(data.rCode == "0000"){
				//alert("naver_req_url:"+data.naver_req_url);
				location.href = data.naver_req_url;
			}else{
				alert(data.rMsg);
				return;
			}	
		},
		error:function(){
			alert("오류입니다.");
			return;						
		}
	});
};

/**
 * e:로그인
 */
 
	/**
	* s:회원가입
	*/
function insertForm(){
	$("#insert_user_modal").show();
	$("#insert_user_modal").dialog({
		autoOpen: false,
		width: 470,
		modal: true,
		buttons: {
			"등록": function(){
				if($("#iuser_id").val().length < 1 || $("#iuser_id").val().length > 20) {alert("아이디를 확인해 주세요"); $("#iuser_id").focus(); return false;}
				if($("#iuser_name").val().length < 1 || $("#iuser_name").val().length > 50) {alert("이름을 확인해 주세요"); $("#iuser_name").focus(); return false;}
				if($("#iuser_pw").val().length < 1 || $("#iuser_pw").val().length > 20) {alert("비밀번호를 확인해 주세요"); $("#iuser_pw").focus(); return false;}
				if($("#iuser_pw_confirm").val().length < 1) {alert("비밀번호를 확인해 주세요"); $("#iuser_pw_confirm").focus(); return false;}
				if($("#iemail1").val().length < 1 || $("#iemail1").val().length > 20) {alert("이메일을 확인해 주세요"); $("#iemail1").focus(); return false;}
				if($("#iemail2").val().length < 1 || $("#iemail2").val().length > 20) {alert("이메일을 확인해 주세요"); $("#iemail2").focus(); return false;}
// 				if($("#iphone1").val().length < 1 || $("#iphone1").val().length > 3) {alert("전화번호를 확인해 주세요"); $("#iphone1").focus(); return false;}
// 				if($("#iphone2").val().length < 1 || $("#iphone2").val().length > 4) {alert("전화번호를 확인해 주세요"); $("#iphone2").focus(); return false;}
// 				if($("#iphone3").val().length < 1 || $("#iphone3").val().length > 4) {alert("전화번호를 확인해 주세요"); $("#iphone3").focus(); return false;}
				if($("#iuser_pw").val() != $("#iuser_pw_confirm").val()) {alert("비밀번호가 일치하지 않습니다."); $("#iuser_pw_confirm").focus(); return false;}
				if($("#iuser_id").val() != $("#user_id_dup").val()) {alert("ID 중복 확인을 해 주십시오"); return false;}
				if($("#iemail1").val() != $("#iemail1_dup").val()) {alert("이메일 중복 확인을 해 주십시오"); return false;}
				if($("#iemail2").val() != $("#iemail2_dup").val()) {alert("이메일 중복 확인을 해 주십시오"); return false;}
				
				if(confirm("등록 하시겠습니까?"))
				{
					$("#insertModalForm").ajaxSubmit({
						url : "/user/userInsert.dowon",
						type : "post",
						dataType: "json",
						success: function(result){
							alert("등록 되었습니다.");
							
							//if($("#startNum").val() == null || $("#startNum").val() == ''){$("#startNum").val(0);}
							//$("form[name=frm]").attr("action","${default_url}");
							//$("form[name=frm]").submit();
							$("#insert_user_modal").dialog("close");
							$("#insertModalForm input").val("");
						},
						error: function(result){
							alert("등록 오류입니다. 관리자에게 문의하세요.");
							$("#insert_user_modal").dialog("close");
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
	$("#insert_user_modal").dialog("open");
}	
	/**
	 * e: 회원가입
	 */

/**
 * 포탈 로그인
 */
 var goKakaoUrl = "/user/loginCallback.dowon";
 
 
//카카오톡로그인 
// 사용할 앱의 JavaScript 키를 설정해 주세요.
var kakaoAouth;
var kakaoProfile;
Kakao.init('${kakao_login_app_id }');
loginWithKakao = function() {
	// 로그인 창을 띄웁니다.
	Kakao.Auth.login({
		success: function(authObj) {
			//alert(JSON.stringify(authObj));
			kakaoAouth = JSON.stringify(authObj)
		      Kakao.API.request({
		          url: '/v1/user/me',
		          success: function(res) {
		            //alert(JSON.stringify(res));
		        	  kakaoProfile = JSON.stringify(res);
		        	  loginKakao();
		          },
		          fail: function(error) {
		            alert(JSON.stringify(error))
		          }
		        });
		},
		fail: function(err) {
			alert(JSON.stringify(err))
		}
	});
}

//카카오 API로 로그인/회원정보를 이용해 로그인 처
loginKakao = function(){
	$("input[name=param_login_gbn]").val("${login_gbn_02 }");
	$("input[name=param_kakaoAouth]").val(kakaoAouth);
	$("input[name=param_kakaoProfile]").val(kakaoProfile);
	$("form[name=logForm]").attr("action", goKakaoUrl);
	//$("form[name=frm]").attr('target', '_self');
	$("form[name=logForm]").submit();
}
</script>


<!-- 페이스북아이디로그인  -->
<script>
var goFacebookUrl = "/user/loginCallback.dowon";

  window.fbAsyncInit = function() {
    FB.init({
      appId      : '${facebook_login_app_id }',
      xfbml      : true,
      version    : 'v2.5'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
  
  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function loginWithFacebook() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
    
    //추가요청할 정보기재 
	FB.login(function(response) {
		statusChangeCallback(response); //반드시추가 *_*
	} , {scope: "email,user_birthday, user_photos"} );
  }
  
  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
//     alert("statusChangeCallback:\n"+JSON.stringify(response));
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
//       alert("OK");
      testAPI(response);
    } else if (response.status === 'not_authorized') {
      // The person is logged into Facebook, but not your app.
//       document.getElementById('status').innerHTML = 'Please log into this app.';
//       alert("Please log into this app.");
    	console.log('Please log into this app.');
    } else {
      // The person is not logged into Facebook, so we're not sure if
      // they are logged into this app or not.
//       document.getElementById('status').innerHTML = 'Please log into Facebook.';
//       alert("Please log into Facebook.");
    	console.log('Please log into Facebook.');
    }
  }
  
  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI(responseStats) {
    console.log('Welcome!  Fetching your information.... ');
    ///me/permissions
    FB.api('/me', {fields: 'email, name'}, function(responseMe) {
          if (responseMe && !responseMe.error) {
            /* handle the result */
//             alert("me"+"\n"+JSON.stringify(responseMe));
	       	    document.logForm.param_login_gbn.value = "${login_gbn_04 }";
	       	    document.logForm.param_facebooMe.value = JSON.stringify(responseMe);
	       	    document.logForm.param_facebookStats.value = JSON.stringify(responseStats);
	       	    document.logForm.action = goFacebookUrl;
	       	    document.logForm.submit();
          }else{
        	alert("페이스북 로그인 오류입니다. 관리자에게 문의 바랍니다.\n" + responseMe.error);
          }
    });
  }
</script>




	<div class="footer">
		<div id="footer_group">
			<div id="footer_left" class="btn"></div>
			<div id="footer_slide">
				<div id="footer_slideConteiner">
				<!-- Start carousel-demo2 -->
					<img src="/images/footer/01_footer_link01.png" id="footerLink1_1" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link10.png" id="footerLink1_10" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link02.png" id="footerLink1_2" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link03.png" id="footerLink1_3" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link04.png" id="footerLink1_4" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link05.png" id="footerLink1_5" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link06.png" id="footerLink1_6" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link07.png" id="footerLink1_7" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link08.png" id="footerLink1_8" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link09.png" id="footerLink1_9" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link01.png" id="footerLink2_1" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link10.png" id="footerLink2_10" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link02.png" id="footerLink2_2" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link03.png" id="footerLink2_3" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link04.png" id="footerLink2_4" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link05.png" id="footerLink2_5" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link06.png" id="footerLink2_6" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link07.png" id="footerLink2_7" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link08.png" id="footerLink2_8" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link09.png" id="footerLink2_9" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link01.png" id="footerLink3_1" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link10.png" id="footerLink3_10" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link02.png" id="footerLink3_2" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link03.png" id="footerLink3_3" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link04.png" id="footerLink3_4" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link05.png" id="footerLink3_5" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link06.png" id="footerLink3_6" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link07.png" id="footerLink3_7" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link08.png" id="footerLink3_8" class="btn" alt="한국 언어장애 전문과 협회" />
					<img src="/images/footer/01_footer_link09.png" id="footerLink3_9" class="btn" alt="한국 언어장애 전문과 협회" />
				</div>
			</div>
			<div id="footer_right" class="btn"></div>
		</div>
	</div>
	
	
<form id="logForm" name="logForm">

		<input type="hidden" name="param_login_gbn" />
		<input type="hidden" name="param_kakaoAouth" />
		<input type="hidden" name="param_kakaoProfile" />
		<input type="hidden" name="param_facebooMe" />
		<input type="hidden" name="param_facebookStats" />
		
	<!-- 로그인 -->
	<div id="logInDialog" title="로그인"  style="display:none">
		<table>
			<tr>
				<td style="text-align:right">아이디 :</td><td><input type="text" name="user_id" id="user_id" maxlength="20" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
			<tr>	
				<td style="text-align:right">비밀번호 :</td><td><input type="password" name="user_pw" id="user_pw" maxlength="20" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
		</table>
		<!-- 카카오버튼 -->
		<a href="javascript:loginWithKakao()" ><img src="http://mud-kage.kakao.co.kr/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="250px" height="50px"/></a>
		<br>
		<!-- 페이스북 버튼 -->
		<a href="javascript:loginWithFacebook()" ><img alt="페이스북아이디로로그인" src="/images/login/loginIcon_facebook.png" width="250px" height="50px"></a>
		<br>
		<!-- 네이버 -->
		<a href="javascript:loginWithNaver()" ><img src="/images/login/loginIcon_naver.PNG" width="250px" height="50px"/></a>
		
	</div>
	<!-- 로그아웃 -->
	<div id="logoutDialog" title="로그아웃"  style="display:none">
		로그아웃 하시겠습니까?
	</div>
</form>
<!-- s:idpw -->
<div id="idPwDialog" title="아이디/패스워드찾기" style="display:none">
	<form id="idPwForm" name="idPwForm">
		<table>
			<tr>
				<td align="right">이름:</td>
				<td>
					<input type="text" name="user_name" id="ipuser_name" size="10" maxlength="20" class="text ui-widget-content ui-corner-all"/>
				</td>
			</tr>
			<tr>
				<td align="right">이메일:</td>
				<td>
					<input type="text" name="email1" id="ipemail1" size="10" maxlength="20" class="text ui-widget-content ui-corner-all"/>
					@
					<input type="text" name="email2" id="ipemail2" size="13" maxlength="20" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
			<tr><td colspan="2">※가입시 기재했던 이메일 주소를 입력해 주세요</td></tr>
		</table>
	</form>
</div>
<!-- e:idpw -->
<!-- insert -->
<div id="insert_user_modal" title="회원등록" style="display:none">
	<form name="insertModalForm" id="insertModalForm" method="post">
		<input type="hidden" id="user_id_dup" name="user_id_dup" value=""/>
		<input type="hidden" id="iemail1_dup" name="iemail1_dup" value=""/>
		<input type="hidden" id="iemail2_dup" name="iemail2_dup" value=""/>
        <table class="modalTable_user" id="modalTable_user" border="0" cellspacing="0" cellpadding="3">
			<tr>
				<td class="col80" align="right">아이디:</td>
				<td>
					<input type="text" name="user_id" id="iuser_id" size="13" maxlength="20" class="text ui-widget-content ui-corner-all requireText" title="영문,숫자 만 입력 가능합니다."/>
					<button id="duplChk">중복확인 </button>
				</td>
			</tr>
			<tr>
				<td align="right">이름:</td>
				<td><input type="text" name="user_name" id="iuser_name" size="20" maxlength="20" class="text ui-widget-content ui-corner-all requireText"/></td>
			</tr>
			<tr>
				<td align="right">비밀번호:</td>
				<td><input type="password" name="user_pw" id="iuser_pw" size="20" maxlength="20" class="text ui-widget-content ui-corner-all requireText"/></td>
			</tr>
			<tr>				
				<td align="right">확인:</td>
				<td><input type="password" name="user_pw_confirm" id="iuser_pw_confirm" size="20" maxlength="20" class="text ui-widget-content ui-corner-all requireText"/></td>
			</tr>
			<tr>
				<td align="right">이메일:</td>
				<td>
					<input type="text" name="email1" id="iemail1" size="10" maxlength="20" class="text ui-widget-content ui-corner-all requireText"/>
					@
					<input type="text" name="email2" id="iemail2" size="13" maxlength="20" class="text ui-widget-content ui-corner-all requireText"/>
					<button id="iEmailduplChk">중복확인 </button>	
				</td>
			</tr>
			<tr>
				<td align="right">전화번호:</td>
				<td>
					<input type="text" name="phone1" id="iphone1" size="6" maxlength="3" class="text ui-widget-content ui-corner-all"/>
					<input type="text" name="phone2" id="iphone2" size="6" maxlength="4" class="text ui-widget-content ui-corner-all"/>
					<input type="text" name="phone3" id="iphone3" size="6" maxlength="4" class="text ui-widget-content ui-corner-all"/>
				</td>
			</tr>
			<tr>
				<td align="right">자녀이름:</td>
				<td><input type="text" name="child_name" id="ichild_name" size="20" maxlength="20" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
        </table>
	</form>
</div>
<!-- //insert -->

<!-- update -->
<div id="update_user_modal" title="회원정보수정" style="display:none">
	<form name="updateModalForm" id="updateModalForm" method="post">
		<input type="hidden" id="uemail1_dup" name="uemail1_dup" value=""/>
		<input type="hidden" id="uemail2_dup" name="uemail2_dup" value=""/>
        <table class="modalTable_user" border="0" cellspacing="0" cellpadding="3">
			<tr>
				<td class="col60">아이디</td>
				<td class="col80">
					<span id="suuser_id"></span><input type="hidden" name="user_id" id="uuser_id"/>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="user_name" id="uuser_name" size="20" maxlength="20" class="text ui-widget-content ui-corner-all requireText"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="user_pw" id="uuser_pw" size="20" maxlength="20" class="text ui-widget-content ui-corner-all requireText"/></td>
			</tr>
			<tr>				
				<td>확인</td>
				<td><input type="password" name="user_pw_confirm" id="uuser_pw_confirm" size="20" maxlength="20" class="text ui-widget-content ui-corner-all requireText"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" name="email1" id="uemail1" size="10" maxlength="20" class="text ui-widget-content ui-corner-all requireText"/>
					@
					<input type="text" name="email2" id="uemail2" size="13" maxlength="20" class="text ui-widget-content ui-corner-all requireText"/>
					<button id="uEmailduplChk">중복확인 </button>
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
<!-- 					<select id="uphone1" name="phone1" class="select60"> -->
<!-- 						<option value="10">010</option> -->
<!-- 						<option value="11">011</option> -->
<!-- 						<option value="16">016</option> -->
<!-- 						<option value="17">017</option> -->
<!-- 						<option value="19">019</option> -->
<!-- 					</select> -->
					<input type="text" name="phone1" id="uphone1" size="6" maxlength="3" class="text ui-widget-content ui-corner-all"/>
					<input type="text" name="phone2" id="uphone2" size="6" maxlength="4" class="text ui-widget-content ui-corner-all"/>
					<input type="text" name="phone3" id="uphone3" size="6" maxlength="4" class="text ui-widget-content ui-corner-all"/>
				</td>
			</tr>
			<tr>
				<td>자녀이름</td>
				<td><input type="text" name="child_name" id="uchild_name" size="20" maxlength="20" class="text ui-widget-content ui-corner-all"/></td>
			</tr>
        </table>
	</form>
</div>
<!-- //update -->

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-74214337-1', 'auto');
  ga('send', 'pageview');

</script>