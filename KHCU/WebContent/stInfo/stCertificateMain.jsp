<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> ���� �߱� </title>
	<script language="JavaScript">
		function Tuition(){
			certificate.action="/KHCU/stTuition.khcu";
			certificate.submit();
		}
	</script>
</head>
<body>
<form name="certificate" method="post" action="/KHCU/stCertificateForm.khcu">
<h1> ${sessionScope.memId}���� ���� �߱� </h1>
<br/><br/>
<h2> ���� ���� </h2>
<table border="1" width="80%" align="center">
	<tr>
		<td>����,����,����,���� ����</td>
	</tr>
	<tr>
		<td>��ϱ� ������</td>
	</tr>
</table>
<br/><br/>
<h2> �߱����� </h2>
<table border="1" width="80%" align="center">
	<tr>
		<td>FAX�ο� �߱�</td>
		<td>FAX�ο� �߱�:����� ��,��,��û �Ǵ� �ֹμ��Ϳ��� ��û</td>
	</tr>
	<tr>
		<td>���ͳ� ����߱�</td>
		<td>���ͳ� ����߱�:���ͳ� ����߱޼���(ȸ������)</td>
	</tr>
</table>
<br/><br/>
<center>
<input type="submit" value="���� �߱�">
<input type="button" value="��ϱ� ������ ���" onClick="Tuition();"/>
</center>
</form>
</body>
</html>