<%@ page contentType="application/vnd.ms-excel;charset=euc-kr" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Locale" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% 

	SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy.MM.dd HH:mm:ss", Locale.KOREA );
	Date currentTime = new Date ( );
	String mTime = mSimpleDateFormat.format ( currentTime );


    response.setHeader("Content-Disposition", "attachment; filename=jindan_list_"+mTime+".xls"); 
    response.setHeader("Content-Description", "JSP Generated Data"); 
%>
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=ksc5601">
<title>도원예일 언어심리센터::회원 리스트</title>
</head>
<body>

	<span style="font-size: 15px"><b>진단 항목</b></span>
	<table class="table" cellpadding="0" border="1" cellspacing="0">
            <thead>
                  <tr>
                    <th class="col150">자가진단구분</th>
                    <th class="col50">문항번호</th>
                    <th class="col200">문항</th>
                    <th class="col60">등록일</th>
                    <th class="col50">등록자</th>
                    <th class="col60">수정일</th>
                    <th class="col50">수정자</th>
                  </tr>
            </thead>
            <tbody>
			<c:if test="${empty resultList}">
				<tr><td colspan="9">등록된 내용이 없습니다.</td></tr>
			</c:if>
			<c:if test="${not empty resultList}">
				<c:forEach var="List" items="${ resultList }">
					<tr class="listCell" id="${List.jindan_id }">
						<td class="modCell btn" title="${List.jindan_id }&&${List.jindan_gbn }&&${List.jindan_quest_no }">
							<c:out value="${List.jindan_gbn_name }"/>
						</td>
						<td class="modCell btn" title="${List.jindan_id }&&${List.jindan_gbn }&&${List.jindan_quest_no }">
							<c:out value="${List.jindan_quest_no }"/>
						</td>
						<td class="modCell btn" title="${List.jindan_id }&&${List.jindan_gbn }&&${List.jindan_quest_no }">
							<c:out value="${List.jindan_txt }" />
						</td>	
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
					</tr>
				</c:forEach>
			</c:if>
            </tbody>      
</table>
</body>
</html>