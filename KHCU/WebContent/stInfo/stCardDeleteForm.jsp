<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> �л� ���� ���� </title>
</head>

<body>
<center><b> �л� ���� ���� </b>
<br>
<form method="POST"  action="stCardDeletePro.khcu?pageNum=${pageNum}"> 
	<input type="hidden" name="studentnum" value="${studentnum}">
	<b>�й� : ${studentnum}, �̸� : ${stname} </b><br>
	<input type="submit" value="����" >
	<input type="button" value="���" onclick="document.location.href='stCardList.khcu?pageNum=${pageNum}'">     
</form>
</center>
</body>
</html> 