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
<title>�������� ���ɸ�����::ȸ�� ����Ʈ</title>
</head>
<body>

	<span style="font-size: 15px"><b>���� �׸�</b></span>
	<table class="table" cellpadding="0" border="1" cellspacing="0">
            <thead>
                  <tr>
                    <th class="col150">�ڰ����ܱ���</th>
                    <th class="col50">���׹�ȣ</th>
                    <th class="col200">����</th>
                    <th class="col60">�����</th>
                    <th class="col50">�����</th>
                    <th class="col60">������</th>
                    <th class="col50">������</th>
                  </tr>
            </thead>
            <tbody>
			<c:if test="${empty resultList}">
				<tr><td colspan="9">��ϵ� ������ �����ϴ�.</td></tr>
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