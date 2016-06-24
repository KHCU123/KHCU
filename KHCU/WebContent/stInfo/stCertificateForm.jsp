<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 증명서 종류 </title>
</head>
<body>
<br/><br/>
<center>
<c:if test="${sessionScope.memId != null}">
	<b>${sessionScope.memId}님 환영합니다!</b>
	<br/><br/>
	<table border="1">
	<tr>
		<td><input type="button" value="재학증명서" onclick="javascript:location='stCertificateInCollegeKo.khcu'"></td>
		<td><input type="button" value="졸업증명서" onclick="javascript:location='stCertificateGraduationKo.khcu'"></td>
		<td><input type="button" value="휴학증명서" onclick="javascript:location='stCertificateAbsenceKo.khcu'"></td>
		<td><input type="button" value="성적증명서" onclick="javascript:location='stCertificateScoreKo.khcu'"></td>
	</tr>
	</table>
	<br/><br/>
</c:if>
</center>
</body>
</html>