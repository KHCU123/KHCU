<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${todayMessage==0 }">
	</c:if>
	<c:if test="${todayMessage!=0 }">
	<script>
		function MessageCheck(){
			window.open("/KHCU/crMessageCheck.khcu?classcode=${classcode}", "confirm", 
                    "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
		}
	</script>
	<a href="#" onClick = "MessageCheck()">출석체크</a>
	</c:if>
</body>
</html>