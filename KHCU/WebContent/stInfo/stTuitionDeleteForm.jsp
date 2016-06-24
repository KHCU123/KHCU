<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> 등록금 고지서 정보 삭제 </title>
</head>

<body>
<center><b> 등록금 고지서 정보 삭제 </b>
<br>
<form method="POST"  action="stTuitionDeletePro.khcu?pageNum=${pageNum}"> 
	<input type="hidden" name="num" value="${dto.num}">
	<b>년도 : ${dto.year}, 학기 : ${dto.semester} </b><br>
	<b>대학 : ${dto.college}, 전공 : ${dto.major} </b><br>
	<b>등록금 : ${dto.money} </b><br>
	<input type="submit" value="삭제" >
	<input type="button" value="목록" onclick="javascript:location='stTuitionList.khcu'">     
</form>
</center>
</body>
</html> 