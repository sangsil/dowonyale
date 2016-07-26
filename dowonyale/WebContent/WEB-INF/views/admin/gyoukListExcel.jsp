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


    response.setHeader("Content-Disposition", "attachment; filename=gyouk_list_"+mTime+".xls"); 
    response.setHeader("Content-Description", "JSP Generated Data"); 
%>
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=ksc5601">
<title>�������� ���ɸ�����::ȸ�� ����Ʈ</title>
</head>
<body>

	<span style="font-size: 15px"><b>�������� ����Ʈ</b></span>
	<table class="table" cellpadding="0" border="1" cellspacing="0">
            <thead>
                  <tr>
                    <th class="col40">NO</th>
                    <th class="col200">����</th>
                    <th class="col300">����</th>
                    <th class="col70">�����</th>
                    <th class="col100">�����</th>
                    <th class="col50">������</th>
                    <th class="col60">������</th>
                    <th class="col60">��ȸ��</th>
                    <th class="col50">��������</th>
                  </tr>
            </thead>
            <tbody>
			<c:if test="${empty resultList}">
				<tr><td colspan="9">��ϵ� ������ �����ϴ�.</td></tr>
			</c:if>
			<c:if test="${not empty resultList}">
				<c:forEach var="List" items="${ resultList }">
					<tr class="listCell">
						<td><c:out value="${List.board_id }"/></td>
						<td><c:out value="${List.board_title }"/></td>
						<td>"${List.board_txt }"</td>
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
						<td><c:out value="${List.hit_cnt }"/></td>
						<td>
							<c:if test="${List.del_yn eq 'N'}"></c:if>
							<c:if test="${List.del_yn eq 'Y'}">����</c:if>
						</td>						
					</tr>
				</c:forEach>
			</c:if>
            </tbody>      
</table>
</body>
</html>