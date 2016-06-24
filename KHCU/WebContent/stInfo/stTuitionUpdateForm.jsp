<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>등록금 고지서 정보 수정</title>
</head>
<body>
<form action="/KHCU/stTuitionUpdatePro.khcu?num=${dto.num}&pageNum=${pageNum}" method="post">
<table border="1" align="center">
	<tr>
		<td>년도</td>
		<td>${dto.year }</td>
	</tr>
	<tr>
		<td>학기</td>
		<td>${dto.semester }</td>
	</tr>
	<tr>
		<td>대학</td>
		<td>${dto.college }</td>
	</tr>
	<tr>
		<td>전공</td>
		<td>${dto.major }</td>
	</tr>	
	<tr>
		<td>등록금</td>
		<td><input type="text" value="${dto.money }" name="money"></td>
	</tr>
</table>
<center>
<input type="submit" value="수  정">
<input type="button" value="목록" onclick="javascript:location='stTuitionList.khcu'">
</center>
</form>
</body>
</html>