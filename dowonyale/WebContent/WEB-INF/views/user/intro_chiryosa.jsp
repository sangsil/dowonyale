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
	
});
</script>
</head>


<body>
<!--	wrap	-->
<div class="wrap">
	<!--	container	-->
	<div class="container">
		<jsp:include page="/common/header.dowon" ><jsp:param name="depth1" value="1" /><jsp:param name="depth2" value="3" /></jsp:include>

		<!--	contents	-->
		<div class="contents"> 
		
			<!--	header Img	-->
			<div class="header_bg" style="background-color: #e7f2fa;"><img src="/images/sub/02_bg01.png"  class="header_img"/></div>
			<!--	//header Img	-->

			<!--	navi	-->
			<div class="navi">
				<span class="navigator">Home &gt; 도원예일소개 &gt; <span class="navi_menu2">치료사소개</span></span>
			</div>  
			<!--	//navi	-->     
			<!--	cont	-->
			<div class="cont">
				<jsp:include page="/common/left.dowon"><jsp:param name="depth1" value="1" /><jsp:param name="depth2" value="3" /></jsp:include>

				<!--	con_body	-->
				<div class="con_body">
				<div id="intro_chiryosa">
					<div class="intro_chiryosa">
						<c:if test="${not empty resultList0 }">
							<div class="intro_chiryosa_carr">
								<img src="/images/sub/noImage.png" class="chiryosaPic"/>
								<ul>
									<c:forEach var="result" items="${resultList0 }" varStatus="status">
										<c:if test="${status.first }">
											<li class="chiryosaFirst">${result.user_job } ${result.user_name } 선생님 </li>
										</c:if>
										<li class="chiryosaCarr">${result.chiryosa_carr }</li>
									</c:forEach>
								</ul>
							</div>
						</c:if>
						<c:if test="${not empty resultList1 }">
							<div class="intro_chiryosa_carr">
								<img src="/images/sub/noImage.png" class="chiryosaPic"/>
								<ul>
									<c:forEach var="result" items="${resultList1 }" varStatus="status">
										<c:if test="${status.first }">
											<li class="chiryosaFirst">${result.user_job } ${result.user_name } 선생님 </li>
										</c:if>
										<li class="chiryosaCarr">${result.chiryosa_carr }</li>
									</c:forEach>
								</ul>
							</div>
						</c:if>
						<c:if test="${not empty resultList2 }">
							<div class="intro_chiryosa_carr">
								<img src="/images/sub/noImage.png" class="chiryosaPic"/>
								<ul>
									<c:forEach var="result" items="${resultList2 }" varStatus="status">
										<c:if test="${status.first }">
											<li class="chiryosaFirst">${result.user_job } ${result.user_name } 선생님 </li>
										</c:if>
										<li class="chiryosaCarr">${result.chiryosa_carr }</li>
									</c:forEach>
								</ul>
							</div>
						</c:if>
						<c:if test="${not empty resultList3 }">
							<div class="intro_chiryosa_carr">
								<img src="/images/sub/noImage.png" class="chiryosaPic"/>
								<ul>
									<c:forEach var="result" items="${resultList3 }" varStatus="status">
										<c:if test="${status.first }">
											<li class="chiryosaFirst">${result.user_job } ${result.user_name } 선생님 </li>
										</c:if>
										<li class="chiryosaCarr">${result.chiryosa_carr }</li>
									</c:forEach>
								</ul>
							</div>
						</c:if>
						<c:if test="${not empty resultList4 }">
							<div class="intro_chiryosa_carr">
								<img src="/images/sub/noImage.png" class="chiryosaPic"/>
								<ul>
									<c:forEach var="result" items="${resultList4 }" varStatus="status">
										<c:if test="${status.first }">
											<li class="chiryosaFirst">${result.user_job } ${result.user_name } 선생님 </li>
										</c:if>
										<li class="chiryosaCarr">${result.chiryosa_carr }</li>
									</c:forEach>
								</ul>
							</div>
						</c:if>
						<c:if test="${not empty resultList5 }">
							<div class="intro_chiryosa_carr">
								<img src="/images/sub/noImage01.png" class="chiryosaPic"/>
								<ul>
									<c:forEach var="result" items="${resultList5 }" varStatus="status">
										<c:if test="${status.first }">
											<li class="chiryosaFirst">${result.user_job } ${result.user_name } 선생님 </li>
										</c:if>
										<li class="chiryosaCarr">${result.chiryosa_carr }</li>
									</c:forEach>
								</ul>
							</div>
						</c:if>
						<c:if test="${not empty resultList6 }">
							<div class="intro_chiryosa_carr">
								<img src="/images/sub/noImage.png" class="chiryosaPic"/>
								<ul>
									<c:forEach var="result" items="${resultList6 }" varStatus="status">
										<c:if test="${status.first }">
											<li class="chiryosaFirst">${result.user_job } ${result.user_name } 선생님 </li>
										</c:if>
										<li class="chiryosaCarr">${result.chiryosa_carr }</li>
									</c:forEach>
								</ul>
							</div>
						</c:if>
						<c:if test="${not empty resultList7 }">
							<div class="intro_chiryosa_carr">
								<img src="/images/sub/noImage.png" class="chiryosaPic"/>
								<ul>
									<c:forEach var="result" items="${resultList7 }" varStatus="status">
										<c:if test="${status.first }">
											<li class="chiryosaFirst">${result.user_job } ${result.user_name } 선생님 </li>
										</c:if>
										<li class="chiryosaCarr">${result.chiryosa_carr }</li>
									</c:forEach>
								</ul>
							</div>
						</c:if>
					</div>
				</div>
					
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
