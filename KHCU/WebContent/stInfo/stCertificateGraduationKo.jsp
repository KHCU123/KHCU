<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>졸업증명서</title>
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
	<c:if test="${dto.ststate != '졸업'}">
	<table border="0" width="80%" align="center">
		<tr>
			<td align="center">
				아직 졸업하시지 않으셨습니다.
			</td>
		</tr>
	</table>
	</c:if>
	
	<c:if test="${dto.ststate == '졸업'}">
	<table border="0" width="80%" align="center">
		<tr>
			<th><h1>졸업 증명서</h1></th>
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
			<td align="center" width="20%">학위등록번호</td>
			<td>학위등록번호</td>
		</tr>
	</table>
	<br/><br/>
	<table border="0" width="80%" align="center">
		<tr>
			<td align="center"><p>학점인정등에 관한 법률 제9조 및 학칙 제100조</p></td>
		</tr>
		<tr>
			<td align="center"><p> 및 101조 규정에 의하여 위의 사실을 증명함.</p></td>
		</tr>
	</table>
	<br/><br/>
	<table border="0" width="80%" align="center">
		<tr>
			<td align="center">${dTime }</td>
		</tr>
	</table>
	<br/><br/>
	<table border="0" width="80%" align="center">
		<tr>
			<th><h1>KH사이버 대학교 교무처장</h1></th>
		</tr>
	</table>
	<br/><br/>
	<center>
	
	</center>
	</c:if>
</ul>
</body>
</html>