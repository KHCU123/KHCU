<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> test �������� </title>
</head>

<body>
<center><b> test �������� </b>
<br>
<form method="POST"  action="pftestDeletePro.khcu?pageNum=${pageNum}"> 
	<input type="hidden" name="proNum" value="${proNum}">
	<b>����  ${proNum} </b><br>
	<input type="submit" value="����" >
	<input type="button" value="���" onclick="document.location.href='professorCardList.khcu?pageNum=${pageNum}'">     
</form>
</center>
</body>
</html> 