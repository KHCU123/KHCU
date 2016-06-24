<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="1" align="center">
	<c:forEach items="${list2}" var="list2">
		<tr>
			<td>
				${list2}
			</td>
		</tr>
		</c:forEach>
	</table>

</body>
</html>