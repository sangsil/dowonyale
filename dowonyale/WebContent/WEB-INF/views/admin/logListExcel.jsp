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


    response.setHeader("Content-Disposition", "attachment; filename=log_list_"+mTime+".xls"); 
    response.setHeader("Content-Description", "JSP Generated Data"); 
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>�������Ͼ��ɸ�����::�α׸���Ʈ</title>
</head>

<body>

	<span style="font-size: 15px"><b>�α׸���Ʈ</b></span>
        <table class="table" cellpadding="0" border="1" cellspacing="0">
            <thead>
                  <tr>
                    <th class="col150">URL</th>
                    <th class="col60">������</th>
                    <th class="col50">����Ͽ���</th>
                    <th class="col50">������</th>
                    <th class="col50">���̵�</th>    
                    <th class="col50">����Ͻ�</th>
                  </tr>
            </thead>
            <tbody>
			<c:if test="${empty resultList}">
				<tr><td colspan="6">��ϵ� �αװ� �����ϴ�.</td></tr>
			</c:if>
			<c:if test="${not empty resultList}">
				<c:forEach var="List" items="${ resultList }">
					<tr class="listCell">
						<td>${List.log_url }</td>
						<td>${List.device_gbn }</td>
						<td>
							<c:if test="${List.mobile_yn eq 'Y'}">�����</c:if>
							<c:if test="${List.mobile_yn eq 'N'}">PC</c:if>
						</td>
						<td>${List.in_ip }</td>
						<td>${List.in_user }</td>
						<td>
							<fmt:parseDate var="dateTempParse" value="${List.in_date }" pattern="yyyy-MM-dd HH:mm:ss.S"/>
							<fmt:formatDate value="${dateTempParse }" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
					</tr>
				</c:forEach>
			</c:if>
            </tbody>      
        </table>
</body>

</html>
