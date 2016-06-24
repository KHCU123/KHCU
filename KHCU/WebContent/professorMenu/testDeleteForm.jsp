<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> test 교수삭제 </title>
</head>

<body>
<center><b> test 교수삭제 </b>
<br>
<form method="POST"  action="pftestDeletePro.khcu?pageNum=${pageNum}"> 
	<input type="hidden" name="proNum" value="${proNum}">
	<b>교번  ${proNum} </b><br>
	<input type="submit" value="삭제" >
	<input type="button" value="목록" onclick="document.location.href='professorCardList.khcu?pageNum=${pageNum}'">     
</form>
</center>
</body>
</html> 