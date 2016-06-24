<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> 학생 정보 삭제 </title>
</head>

<body>
<center><b> 학생 정보 삭제 </b>
<br>
<form method="POST"  action="stCardDeletePro.khcu?pageNum=${pageNum}"> 
	<input type="hidden" name="studentnum" value="${studentnum}">
	<b>학번 : ${studentnum}, 이름 : ${stname} </b><br>
	<input type="submit" value="삭제" >
	<input type="button" value="목록" onclick="document.location.href='stCardList.khcu?pageNum=${pageNum}'">     
</form>
</center>
</body>
</html> 