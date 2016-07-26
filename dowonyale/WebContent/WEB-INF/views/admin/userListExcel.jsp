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

    response.setHeader("Content-Disposition", "attachment; filename=user_list_"+mTime+".xls"); 
    response.setHeader("Content-Description", "JSP Generated Data"); 
%>
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=ksc5601">
<title>�������� ���ɸ�����::ȸ�� ����Ʈ</title>
</head>
<body>

	<span style="font-size: 15px"><b>ȸ�� ����Ʈ</b></span>
	<table class="table" cellpadding="0" border="1" cellspacing="0">
        <th class="col50">���̵�</th>
        <th class="col40">�̸�</th>
        <th class="col70">��ȭ��ȣ</th>
        <th class="col100">�̸���</th>
        <th class="col50">�ڳ��̸�</th>
        <th class="col50">�α���Ƚ��</th>
        <th class="col50">�ֱٷα���</th>
        <th class="col50">������</th>
        <th class="col40">����</th>    
        <th class="col40">Ż�𿩺�</th>
	<thead>
			<c:if test="${empty resultList}">
				<tr><td colspan="10">��ϵ� ȸ���� �����ϴ�.</td></tr>
			</c:if>
			<c:if test="${not empty resultList}">
				<c:forEach var="List" items="${ resultList }">
					<tr id="${List.user_id }" class="listCell">
						<td>
							<c:out value="${List.user_id }"/>
						</td>
						<td>
							<c:out value="${List.user_name }"/>
						</td>
						<td><c:out value="${List.phone1 }"/>-<c:out value="${List.phone2 }"/>-<c:out value="${List.phone3 }"/></td>
						<td><c:out value="${List.email1 }"/>@<c:out value="${List.email2 }"/></td>
						<td><c:out value="${List.child_name }"/></td>
						<td><c:out value="${List.login_cnt }"/></td>
						<td>
							<fmt:parseDate var="dateTempParse" value="${List.login_date }" pattern="yyyy-MM-dd HH:mm:ss.S"/>
							<fmt:formatDate value="${dateTempParse }" pattern="yyyy-MM-dd"/>
						</td>
						<td>
							<fmt:parseDate var="dateTempParse" value="${List.in_date }" pattern="yyyy-MM-dd HH:mm:ss.S"/>
							<fmt:formatDate value="${dateTempParse }" pattern="yyyy-MM-dd"/>
						</td>
						<td>
							<c:if test="${List.user_type eq 'U'}">ȸ��</c:if>
							<c:if test="${List.user_type eq 'T'}">������</c:if>
							<c:if test="${List.user_type eq 'A'}">��ü������</c:if>
						</td>
						<td>
							<c:if test="${List.del_yn eq 'N'}"></c:if>
							<c:if test="${List.del_yn eq 'Y'}">Ż��</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:if>
            </tbody>      
</table>
</body>
</html>