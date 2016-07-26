<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>도원예일언어심리센터</title>
<link rel="icon" href="/images/favicon.ico" type="image/x-icon"/>
<link type="text/css" href="/css/style_list.css" rel="stylesheet"/>
<script type="text/javascript" src="/js/paging.js"></script>
<script type="text/javascript">
$(function(){
	$(paging($("#totalPages").val(),$("#cPage").val()));
	
	//paging start
	$("#first").live("click",(function(){
		$("#startNum").val("0");
		$("#cPage").val("1");
		goSubmit();
	}));

	$("#pre").live("click",(function(){
		var cPage = $("#cPage").val();
		var maxRows = $("#maxRows").val();
		var startNum = $("#startNum").val();
		var intGrp = Math.floor((cPage-1)/10);
		$("#startNum").val((intGrp-1)*10*maxRows);
		$("#cPage").val((intGrp-1)*10+1);
		goSubmit();
	}));

	$("#next").live("click",(function(){
		var cPage = $("#cPage").val();
		var maxRows = $("#maxRows").val();
		var startNum = $("#startNum").val();
		var intGrp = Math.floor((cPage-1)/10+1);
		$("#startNum").val((intGrp*10+1)*maxRows);
		$("#cPage").val(intGrp*10+1);
		goSubmit();
	}));
	
	$("#last").live("click",(function(){
		alert('12345');
		var maxRows = $("#maxRows").val();
		$("#startNum").val(Math.floor($("#totalPages").val()-1)*maxRows);
		$("#cPage").val(Math.floor($("#totalPages").val()));
		goSubmit();
	}));
	
	
	//first
	firstImgfunc = function(){
		$("#startNum").val("0");
		$("#cPage").val("1");
		goSubmit();		
	}
	
	//pre
	preImgfunc = function(){
		var cPage = $("#cPage").val();
		var maxRows = $("#maxRows").val();
		var startNum = $("#startNum").val();
		var intGrp = Math.floor((cPage-1)/10);
		$("#startNum").val((intGrp-1)*10*maxRows);
		$("#cPage").val((intGrp-1)*10+1);
		goSubmit();
	}
	
	//next
	nextImgfunc = function(){
		var cPage = $("#cPage").val();
		var maxRows = $("#maxRows").val();
		var startNum = $("#startNum").val();
		var intGrp = Math.floor((cPage-1)/10+1);
		$("#startNum").val((intGrp*10+1)*maxRows);
		$("#cPage").val(intGrp*10+1);
		goSubmit();
	}
	
	//last
	lastImgfunc = function() {
		var maxRows = $("#maxRows").val();
		$("#startNum").val(Math.floor($("#totalPages").val()-1)*maxRows);
		$("#cPage").val(Math.floor($("#totalPages").val()));
		goSubmit();
	};
	
	
	
	//paging end
	gopage = function(cPage){
		var maxRows = $("#maxRows").val();
		$("#startNum").val((cPage-1)*maxRows);
		$("#cPage").val(cPage);
		goSubmit();
	};
		
	goSubmit = function(){
		$("#listForm").ajaxSubmit({
			url : "/user/list.dowon",
			type : "post",
			dataType: "html",
			success: function(result) {
				$("#list").empty();
				$("#list").append(result);
			},
			error: function(result) {				
				alert("데이터 오류입니다. 관리자에게 문의하세요.");
			}
		});
	};
	
	
	editUsr = function(p_event_sn){
		if($("[name='editCmnt']").val().length > 35)
		{
			alert("댓글은 35자 이내로 입력 해 주십시오.");
			return;
		}
		
		if(confirm("수정 하시겠습니까?"))
			{
				$("#listForm").ajaxSubmit({
					url : "/user/editUser.dowon",
					type : "post",
					data:
						({
							event_sn : p_event_sn,
							cmnt : $("#fnNormal_"+p_event_sn+" [name='editCmnt']").val()
						}),
					dataType: "html",
					success: function(result) {
						alert("수정 되었습니다.");
						$("#list").empty();
						$("#list").append(result);
					},
					error: function(result) {				
						alert("데이터 오류입니다. 관리자에게 문의하세요.");
					}
				});	
		}
	}
	
	delUsr = function(p_event_sn){
		if(confirm("삭제 하시겠습니까?\n삭제 시 복구가 불가능 합니다"))
		{	
			$("#listForm").ajaxSubmit({
				url : "/user/deleteUser.dowon",
				type : "post",
				data:
					({
						event_sn : p_event_sn
					}),
				dataType: "html",
				success: function(result) {
					alert("삭제 되었습니다.");
					$("#list").empty();
					$("#list").append(result);
				},
				error: function(result) {				
					alert("데이터 오류입니다. 관리자에게 문의하세요.");
				}
			});
		}	
	}
		

	recommend = function (p_event_sn){
		if(confirm("추천하시겠습니까?")){
			$("#listForm").ajaxSubmit({
				url : "/user/recommend.dowon",
				type : "post",
				data:
					({
						event_sn : p_event_sn
					}),
				dataType: "html",
				success: function(result) {
					alert("추천 되었습니다.");
					$("#list").empty();
					$("#list").append(result);
					gopage($("#cPage").val());
				},
				error: function(result) {				
					alert("데이터 오류입니다. 관리자에게 문의하세요.");
				}
			});
		}else{
			return;
		}
	}
	
	
	
	
	
	
	
	
});
</script>
</head>
<body>

<form id="listForm" name="listForm" method="get" action="/user/list.dowon">
<input type="hidden" name="account" value="${memberInfo.account }"/>
<c:if test="${startNum eq '' or empty startNum}"><c:set var="intStartNum" value="0"/></c:if>
<input type="hidden" id="startNum" name="startNum" value="${intStartNum }"/>
<input type="hidden" id="maxRows" name="maxRows" value="10"/>
<!-- <input type="hidden" id="maxRows" name="maxRows" value="7"/> -->
<input type="hidden" id="allCnt" name="allCnt" value="${allCnt }"/>
<c:set var="maxRows" value="10"/>
<c:set var="rmd" value="${allCnt%maxRows }"/>
<c:if test="${rmd > 0}">
	<c:set var="totalPages" value="${allCnt/maxRows+1 }"/> 
</c:if>
<c:if test="${rmd == 0}">
	<c:set var="totalPages" value="${allCnt/maxRows }"/> 
</c:if>
<input type="hidden" id="totalPages" name="totalPages" value="${totalPages }"/>
<c:set var="cPage" value="${param.cPage }"/>
<c:if test="${empty param.cPage}">
	<c:set var="cPage" value="1"/>
</c:if>
<input type="hidden" id="cPage" name="cPage" value="${cPage }"/>
</form>

<div id="listTable">
	<table width="830">
    <tbody>

		<c:if test="${empty resultList }">
			<tr></tr>
		</c:if>

	<!-- 강추 -->
<%-- 		<c:if test="${not empty resultList_topRecommend}"> --%>
<%-- 			<c:forEach var="List" items="${ resultList_topRecommend }"> --%>
<!-- 				<tr class="recommendColor"> -->
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${List.account eq memberInfo.account}"> --%>
<!-- 							내가쓴글 -->
<%-- 							<td align="left" width="420" valign="top"><textarea class="cmntTextArea" name="editCmnt" rows="2" cols="50">${List.cmnt }</textarea></td> --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<!-- 							남이쓴글 -->
<%-- 							<td align="left" width="420" height="25" class="recommend">${List.cmnt }</td> --%>
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
					
<%-- 					<td align="center" width="80">${List.member_name }님</td> --%>
<!-- 					<td align="right" width="100"> -->
<%-- 						<c:out value="${fn:substring(List.reg_dtti,0,4)}"/>-<c:out value="${fn:substring(List.reg_dtti,4,6)}"/>-<c:out value="${fn:substring(List.reg_dtti,6,8)}"/> --%>
<!-- 					</td> -->
<!-- 					<td class="fnBtn"> -->
<%-- 						<a href="javascript:recommend('${List.event_sn}')"><img src="/images/btn_like.png"/></a> --%>
<!-- 						내가쓴글 -->
<%-- 						<c:if test="${List.account eq memberInfo.account}"> --%>
<%-- 							<a href="javascript:editUsr('${List.event_sn}')"><img src="/images/btn_fix.png"/></a> --%>
<%-- 							<a href="javascript:delUsr('${List.event_sn}')"><img src="/images/btn_delete.png"/></a> --%>
<%-- 						</c:if>	 --%>
<!-- 					</td> -->
					
<%-- <%-- 	추천수				<td align="center" width="17">${List.recommend }</td> --%>
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
<%-- 		</c:if> --%>
	<!-- 강추 -->
		
	<!-- 비강추 -->
		<c:if test="${not empty resultList}">
			<c:forEach var="List" items="${ resultList }">
				<tr id="fnNormal_${List.event_sn}">
					<c:choose>
						<c:when test="${List.account eq memberInfo.account}">
							<!-- 내가쓴글 -->
							<td align="left" width="320" class="recommend_me"><textarea class="cmntTextArea" name="editCmnt" rows="2" cols="35">${List.cmnt }</textarea></td>
						</c:when>
						<c:otherwise>
							<!-- 남이쓴글 -->
							<td align="left" width="320" class="recommend">${List.cmnt }</td>
						</c:otherwise>
					</c:choose>
					
					<td align="center" width="60" class="recommendEtc">${List.member_name } 님</td>
					<td align="right" width="100" class="recommendEtc">
						<c:out value="${fn:substring(List.reg_dtti,0,4)}"/>-<c:out value="${fn:substring(List.reg_dtti,4,6)}"/>-<c:out value="${fn:substring(List.reg_dtti,6,8)}"/>
					</td>
					<td align="center" width="60" class="recommend">${List.recommend }</td>
					<td class="fnBtn">
					<c:choose>
						<c:when test="${List.account eq memberInfo.account}">
							<!-- 내가쓴글 -->
							<img src="/images/btn_like.png" class="recommendBtn"/>
							<a href="javascript:editUsr('${List.event_sn}')"><img src="/images/btn_fix.png"/></a>
							<a href="javascript:delUsr('${List.event_sn}')"><img src="/images/btn_delete.png"/></a>
						</c:when>
						<c:otherwise>
							<!-- 남이쓴글 -->
							<a href="javascript:recommend('${List.event_sn}')"><img src="/images/btn_like.png"/></a>
						</c:otherwise>
					</c:choose>

<%-- 						<a href="javascript:recommend('${List.event_sn}')"><img src="/images/btn_like.png"/></a> --%>
<!-- 						내가쓴글 -->
<%-- 						<c:if test="${List.account eq memberInfo.account}"> --%>
<%-- 							<a href="javascript:editUsr('${List.event_sn}')"><img src="/images/btn_fix.png"/></a> --%>
<%-- 							<a href="javascript:delUsr('${List.event_sn}')"><img src="/images/btn_delete.png"/></a> --%>
<%-- 						</c:if>	 --%>

					</td>
					
				</tr>
			</c:forEach>
		</c:if>
	<!-- 비강추 -->
			
	</tbody>
	</table>
</div>
<div id="paging" align="center"></div>
</body>
</html>