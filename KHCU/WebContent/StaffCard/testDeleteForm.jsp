<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> test ���������� </title>
</head>

<body>
<center><b> test ���������� </b>
<br>
<form method="POST"  action="testDeletePro.khcu?pageNum=${pageNum}"> 
	<input type="hidden" name="staffNum" value="${staffNum}">
	<b>���  ${staffNum} </b><br>
	<input type="submit" value="����" >
	<input type="button" value="���" onclick="document.location.href='staffCardList.khcu?pageNum=${pageNum}'">     
</form>
</center>
</body>
</html> 