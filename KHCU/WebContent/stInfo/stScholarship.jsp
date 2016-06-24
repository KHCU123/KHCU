<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<title>장학금 수혜내역</title>
</head>
<body>
   <table border="1" width="90%" align="center">
		<tr>
         	<td colspan="9" align="center">장학금 수혜내역</td>
      	</tr>
      	<tr>
      		<td width="10%" align="center">번호</td>
         	<td width="10%" align="center">년도</td>
         	<td width="10%" align="center">학기</td>
         	<td width="10%" align="center">입학금</td>
         	<td width="10%" align="center">등록금</td>
         	<td width="10%" align="center">장학금액</td>
         	<td width="10%" align="center">지급구분</td>
         	<td width="10%" align="center">학번</td>
      	</tr>      
		<c:forEach var="list" items="${list}">
		<tr align="center">
			<td align="center">${list.num }</td>
           	<td align="center"><fmt:formatDate value="${list.year}" pattern="yyyy"/>년</td>
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