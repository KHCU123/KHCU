<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<html>
<head>
<title>시험</title>
</head>
<body>
<form action="/KHCU/crExam.khcu" name="form1" id="form1" method="post">
<center>
<table border="1" width="80%" align="center">
	<tr>
		<td colspan="5">학생 정보</td>
	</tr>
	<tr>
		<td rowspan="5" width="100"><img src="<c:url value="/stInfo/stProfile/${stDTO.stprofilename}"/>" width="100" height="130"></td>
	<tr>
		<td width="70">이름</td>
		<td>${stDTO.stname }</td>
		<td width="70">학번</td>
		<td>${stDTO.studentnum }</td>
	</tr>
	<tr>
		<td width="70">대학</td>
		<td>${stDTO.stcollege }</td>
		<td width="70">학과</td>
		<td>${stDTO.stmajor }</td>
	</tr>
	<tr>
		<td width="70">전공</td>
		<td>${stDTO.stminor }</td>
		<td width="70">학년</td>
		<td>${stDTO.stgrade }</td>
	</tr>
	<tr>
		<td width="70">학기</td>
		<td>${stDTO.stsemester }</td>
		<td width="70">주민번호</td>
		<td>${stDTO.stjumin1 } - ${stDTO.stjumin2 }</td>
	</tr>
</table><br/><br/>
<center>
<input type="button" value="나의 시험지" onclick="javascipt:location='crExamContent.khcu'">
</center>
<hr>
<br/><br/>
<table border="1" width="90%">
	<tr>
		<td colspan="9">나의 강의실</td>
	</tr>
	<tr>
		<td width="10%">강의코드</td>
		<td width="10%">담당교수</td>
		<td width="10%">전공</td>
		<td width="10%">강의이름</td>
		<td width="10%">학년</td>
		<td width="10%">학점</td>
		<td width="10%">강의시간</td>
		<td width="10%">시험지 작성</td>
	</tr>

	<c:forEach var="list" items="${articleList}">
	
	<tr>
		<td>${list.classCode}</td> 
		<td>${list.pfName }</td> 
		<td>${list.major}</td> 
		<td>${list.className}</td> 
		<td>${list.classGrade}</td> 
		<td>${list.credit}</td> 
		<td>${list.classTime}</td> 
		<td><input type="button" value="시험지 작성" onclick="javascipt:location='crExamInputForm.khcu?classCode=${list.classCode}'"></td>  
	</tr>
	
	</c:forEach>
</table>
</center>
</form>
</body>
</html>