<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> ��ϱ� ������ ���� ���� </title>
</head>

<body>
<center><b> ��ϱ� ������ ���� ���� </b>
<br>
<form method="POST"  action="stTuitionDeletePro.khcu?pageNum=${pageNum}"> 
	<input type="hidden" name="num" value="${dto.num}">
	<b>�⵵ : ${dto.year}, �б� : ${dto.semester} </b><br>
	<b>���� : ${dto.college}, ���� : ${dto.major} </b><br>
	<b>��ϱ� : ${dto.money} </b><br>
	<input type="submit" value="����" >
	<input type="button" value="���" onclick="javascript:location='stTuitionList.khcu'">     
</form>
</center>
</body>
</html> 