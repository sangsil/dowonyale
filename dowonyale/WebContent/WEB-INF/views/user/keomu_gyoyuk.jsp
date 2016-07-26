<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>도원예일언어심리센터</title>
<link rel="icon" href="/images/favicon.ico" type="image/x-icon"/>
<link href="/css/redmond/jquery-ui-1.10.2.custom.min.css" rel="stylesheet"/>
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/sub_contents.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/js/jquery.form.js"></script>
<script src="/js/jquery.alphanumeric.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript">
$(function(){
	$(".fnDetail").bind("click",function(){
		$("input[name=board_id]").val($(this).parent().attr("id"));
		$("form[name=frm]").attr("action","/user/keomu_gyoyuk_detail.dowon");
		$("form[name=frm]").submit();
	});
	
});
</script>
</head>


<body>
<!--	wrap	-->
<div class="wrap">
	<!--	container	-->
	<div class="container">
		<jsp:include page="/common/header.dowon" ><jsp:param name="depth1" value="5" /><jsp:param name="depth2" value="2" /></jsp:include>

		<!--	contents	-->
		<div class="contents"> 
		
			<!--	header Img	-->
			<div class="header_bg" style="background-color: #e7f2fa;"><img src="/images/sub/02_bg05.png"  class="header_img"/></div>
			<!--	//header Img	-->

			<!--	navi	-->
			<div class="navi">
				<span class="navigator">Home &gt; 커뮤니티 &gt; <span class="navi_menu2">교육공지</span></span>
			</div>  
			<!--	//navi	-->     
			<!--	cont	-->
			<div class="cont">
				<jsp:include page="/common/left.dowon"><jsp:param name="depth1" value="5" /><jsp:param name="depth2" value="2" /></jsp:include>

				<!--	con_body	-->
				<div class="con_body">
					<form id="frm" name="frm" method="post" action="">
						<input type="hidden" name="board_id" />
						<img src="/images/sub/02_content_05_02.png" alt="교육공지"/>
						<div id="keomu_gongji">
					        <table cellspacing="0" cellpadding="3">
					            <thead>
					                  <tr>
					                    <th class="col70">번호</th>
					                    <th>제목</th>
					                    <th class="col110">등록일</th>
					                    <th class="col90">등록자</th>
					                    <th class="col50">조회수</th>
					                  </tr>
					            </thead>
					            <tbody>
								<c:if test="${empty resultList}">
									<tr><td colspan="5" style="text-align:center">등록된 글이 없습니다.</td></tr>
								</c:if>
								<c:if test="${not empty resultList}">
									<c:forEach var="List" items="${ resultList }">
										<tr class="listCell" id="${List.board_id }">
											<td class="a_center"><c:out value="${List.board_id }"/></td>
											<td class="btn fnDetail"><c:out value="${List.board_title }"/></td>
											<td class="a_center">
												<fmt:parseDate var="dateTempParse" value="${List.in_date }" pattern="yyyy-MM-dd HH:mm:ss.S"/>
												<fmt:formatDate value="${dateTempParse }" pattern="yyyy-MM-dd"/>
											</td>
											<td class="a_center"><c:out value="${List.in_user_name }"/></td>
											<td class="a_center"><c:out value="${List.hit_cnt }"/></td>
										</tr>
									</c:forEach>
								</c:if>
					            </tbody>      
					        </table>
						</div>
					</form>
				</div>
				<!--	con_body	-->            
			</div>
			<!--	//cont	-->        

		</div>
	<!--	contents	-->
		<jsp:include page="/common/footer.dowon" />
	</div>
	<!--	//container	-->
</div>
<!--	//wrap	-->
<div class="footer_bg"></div>
</body>
</html>
