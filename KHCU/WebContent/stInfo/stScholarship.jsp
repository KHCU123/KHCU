<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<title>���б� ��������</title>
</head>
<body>
   <table border="1" width="90%" align="center">
		<tr>
         	<td colspan="9" align="center">���б� ��������</td>
      	</tr>
      	<tr>
      		<td width="10%" align="center">��ȣ</td>
         	<td width="10%" align="center">�⵵</td>
         	<td width="10%" align="center">�б�</td>
         	<td width="10%" align="center">���б�</td>
         	<td width="10%" align="center">��ϱ�</td>
         	<td width="10%" align="center">���бݾ�</td>
         	<td width="10%" align="center">���ޱ���</td>
         	<td width="10%" align="center">�й�</td>
      	</tr>      
		<c:forEach var="list" items="${list}">
		<tr align="center">
			<td align="center">${list.num }</td>
           	<td align="center"><fmt:formatDate value="${list.year}" pattern="yyyy"/>��</td>
            <td align="center">${list.semester }</td>
            <td align="center"></td>
            <td align="center"></td>
            <td align="center">${list.money}</td>
            <td align="center">${list.schtype }</td>
            <td align="center">${list.studentnum }</td>
      	</tr>
        </c:forEach>   
	</table>
</body>
</html>