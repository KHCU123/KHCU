<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> test �а� ���� ���� </title>
</head>

<body>
<center><b> test �а� ���� ���� </b>
<br>
<form method="POST"  action="testCollegeDeletePro.khcu?pageNum=${pageNum}"> 
	<input type="hidden" name="majCode" value="${majCode}">
	<b>�а��ڵ� : ${majCode}, �а��̸� : ${majName} </b><br>
	<input type="submit" value="����" >
	<input type="button" value="���" onclick="document.location.href='collegeList.khcu?pageNum=${pageNum}'">     
</form>
</center>
</body>
</html> 