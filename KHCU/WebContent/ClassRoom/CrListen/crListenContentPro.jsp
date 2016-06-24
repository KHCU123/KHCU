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
<c:if test="${id==3}">
	<c:if test="${check==2 }">
		<script>
	  	alert("수강 가능한 날짜가 지났습니다.");
      	history.go(-1);
		</script>
	</c:if>
	<c:if test="${check==1 }">
		<c:redirect url="/crListenContent.khcu?classcode=${classcode}&week=${week}"/>
	</c:if>
	<c:if test="${check==0 }">
		<script>
	  	alert("아직 들을 수 없습니다.");
      	history.go(-1);
		</script>
	</c:if>
</c:if>
<c:if test="${id!=3}">
<c:redirect url="/crListenContent.khcu?classcode=${classcode}&week=${week}"/>
</c:if>
</body>
</html>