<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> test 학과 정보 삭제 </title>
</head>

<body>
<center><b> test 학과 정보 삭제 </b>
<br>
<form method="POST"  action="testCollegeDeletePro.khcu?pageNum=${pageNum}"> 
	<input type="hidden" name="majCode" value="${majCode}">
	<b>학과코드 : ${majCode}, 학과이름 : ${majName} </b><br>
	<input type="submit" value="삭제" >
	<input type="button" value="목록" onclick="document.location.href='collegeList.khcu?pageNum=${pageNum}'">     
</form>
</center>
</body>
</html> 