<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 증명서 발급 </title>
	<script language="JavaScript">
		function Tuition(){
			certificate.action="/KHCU/stTuition.khcu";
			certificate.submit();
		}
	</script>
</head>
<body>
<form name="certificate" method="post" action="/KHCU/stCertificateForm.khcu">
<h1> ${sessionScope.memId}님의 증명서 발급 </h1>
<br/><br/>
<h2> 증명서 종류 </h2>
<table border="1" width="80%" align="center">
	<tr>
		<td>재학,졸업,휴학,성적 증명서</td>
	</tr>
	<tr>
		<td>등록금 고지서</td>
	</tr>
</table>
<br/><br/>
<h2> 발급절차 </h2>
<table border="1" width="80%" align="center">
	<tr>
		<td>FAX민원 발급</td>
		<td>FAX민원 발급:가까운 시,군,구청 또는 주민센터에서 신청</td>
	</tr>
	<tr>
		<td>인터넷 증명발급</td>
		<td>인터넷 증명발급:인터넷 증명발급센터(회원가입)</td>
	</tr>
</table>
<br/><br/>
<center>
<input type="submit" value="증명서 발급">
<input type="button" value="등록금 고지서 출력" onClick="Tuition();"/>
</center>
</form>
</body>
</html>