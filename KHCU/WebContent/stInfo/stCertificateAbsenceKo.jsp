<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>휴학증명서</title>
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

	<c:if test="${dto.ststate == '재학'}">
	<table border="0" width="80%" align="center">
		<tr>
			<td align="center">
				재학중 입니다.
			</td>
		</tr>
	</table>
	</c:if>
	
	<c:if test="${dto.ststate == '졸업'}">
	<table border="0" width="80%" align="center">
		<tr>
			<td align="center">
				졸업 하셨습니다.
			</td>
		</tr>
	</table>
	</c:if>
	
	<c:if test="${dto.ststate == '휴학'}">
	<table border="0" width="80%" align="center">
		<tr>
			<th><h1>휴학 증명서</h1></th>
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
		<tr>
			<td align="center" width="20%">학년</td>
			<td>${dto.stgrade }</td>
		</tr>
		<tr>
			<td align="center" width="20%">학번</td>
			<td>${dto.studentnum }</td>
		</tr>
	</table>
	<br/><br/>
	<table border="0" width="80%" align="center">
		<tr>
			<td align="center"><p>위의 사실을 증명함.</p></td>
		</tr>
	</table>
	<br/><br/>
	
	<table border="0" width="80%" align="center">
		<tr>
			<td align="center"><p>${dTime }</p></td>
		</tr>
	</table>
	<br/><br/>
	
	<table border="0" width="80%" align="center">
		<tr>
			<th><h1>KH사이버 대학교 교무처장</h1></th>
		</tr>
	</table>
	<br/><br/>
	</c:if>
</ul>
</body>
</html>