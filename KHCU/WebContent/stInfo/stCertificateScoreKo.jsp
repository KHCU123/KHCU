<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>성적증명서</title>
</head>
<script type="text/javascript">
		var fnPrint = function() {
			document.body.innerHTML = selectArea.innerHTML;
			window.print();
		};
	</script>
<body>
<!-- 제외될 영역--> 
<center>
<input type="button" value="인쇄" onClick="fnPrint()" /> 
<input type="button" value="돌아가기" onclick="javascript:location='stCertificateForm.khcu'">
</center>
<!-- 인쇄될 영역--> 
<ul id="selectArea">
	<table border="0" width="80%" align="center">
		<tr>
			<th><h1>성적 증명서</h1></th>
		</tr>
	</table>
	<br/><br/>
	<table border="1" width="60%" align="center">
		<tr>
			<td align="center" width="20%">이름</td>
			<td>${dto.stname }</td>
		</tr>
		<tr>
			<td align="center" width="20%">생년월일</td>
			<td>${dto.stjumin1 }</td>
		</tr>
		<tr>
			<td align="center" width="20%">대학</td>
			<td>${dto.stcollege }</td>
		</tr>
		<tr>
			<td align="center" width="20%">전공</td>
			<td>${dto.stmajor }</td>
		</tr>
	</table>
	<br/><br/>

	<table border="1" width="60%" align="center">
		<tr>
			<td align="center">년도 학기</td>
			<td align="center">강의코드</td>
			<td align="center">과목명</td>
			<td align="center">취득학점</td>
			<td align="center">성적</td>
		</tr>
	<c:forEach var="list" items="${list}">
		<tr>
			<td align="center">${list.year}년 - ${list.semester}학기</td>
			<td align="center">${list.classcode }</td>
			<td align="center">${list.classname }</td>
			<td align="center">${list.credit }</td>
			<td align="center">${list.score }</td>
		</tr>
	</c:forEach>
	</table>
	<br/><br/>	
</ul>
</body>
</html>