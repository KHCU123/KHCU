<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��������</title>
</head>
<script type="text/javascript">
		var fnPrint = function() {
			document.body.innerHTML = selectArea.innerHTML;
			window.print();
		};
	</script>
<body>
<!-- ���ܵ� ����--> 
<center>
<input type="button" value="�μ�" onClick="fnPrint()" /> 
<input type="button" value="���ư���" onclick="javascript:location='stCertificateForm.khcu'">
</center>
<!-- �μ�� ����--> 
<ul id="selectArea">
	<table border="0" width="80%" align="center">
		<tr>
			<th><h1>���� ����</h1></th>
		</tr>
	</table>
	<br/><br/>
	<table border="1" width="60%" align="center">
		<tr>
			<td align="center" width="20%">�̸�</td>
			<td>${dto.stname }</td>
		</tr>
		<tr>
			<td align="center" width="20%">�������</td>
			<td>${dto.stjumin1 }</td>
		</tr>
		<tr>
			<td align="center" width="20%">����</td>
			<td>${dto.stcollege }</td>
		</tr>
		<tr>
			<td align="center" width="20%">����</td>
			<td>${dto.stmajor }</td>
		</tr>
	</table>
	<br/><br/>

	<table border="1" width="60%" align="center">
		<tr>
			<td align="center">�⵵ �б�</td>
			<td align="center">�����ڵ�</td>
			<td align="center">�����</td>
			<td align="center">�������</td>
			<td align="center">����</td>
		</tr>
	<c:forEach var="list" items="${list}">
		<tr>
			<td align="center">${list.year}�� - ${list.semester}�б�</td>
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