<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>��ϱ� ������ ���� ����</title>
</head>
<body>
<form action="/KHCU/stTuitionUpdatePro.khcu?num=${dto.num}&pageNum=${pageNum}" method="post">
<table border="1" align="center">
	<tr>
		<td>�⵵</td>
		<td>${dto.year }</td>
	</tr>
	<tr>
		<td>�б�</td>
		<td>${dto.semester }</td>
	</tr>
	<tr>
		<td>����</td>
		<td>${dto.college }</td>
	</tr>
	<tr>
		<td>����</td>
		<td>${dto.major }</td>
	</tr>	
	<tr>
		<td>��ϱ�</td>
		<td><input type="text" value="${dto.money }" name="money"></td>
	</tr>
</table>
<center>
<input type="submit" value="��  ��">
<input type="button" value="���" onclick="javascript:location='stTuitionList.khcu'">
</center>
</form>
</body>
</html>