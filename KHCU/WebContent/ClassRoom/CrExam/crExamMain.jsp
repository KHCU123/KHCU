<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<html>
<head>
<title>����</title>
</head>
<body>
<form action="/KHCU/crExam.khcu" name="form1" id="form1" method="post">
<center>
<table border="1" width="80%" align="center">
	<tr>
		<td colspan="5">�л� ����</td>
	</tr>
	<tr>
		<td rowspan="5" width="100"><img src="<c:url value="/stInfo/stProfile/${stDTO.stprofilename}"/>" width="100" height="130"></td>
	<tr>
		<td width="70">�̸�</td>
		<td>${stDTO.stname }</td>
		<td width="70">�й�</td>
		<td>${stDTO.studentnum }</td>
	</tr>
	<tr>
		<td width="70">����</td>
		<td>${stDTO.stcollege }</td>
		<td width="70">�а�</td>
		<td>${stDTO.stmajor }</td>
	</tr>
	<tr>
		<td width="70">����</td>
		<td>${stDTO.stminor }</td>
		<td width="70">�г�</td>
		<td>${stDTO.stgrade }</td>
	</tr>
	<tr>
		<td width="70">�б�</td>
		<td>${stDTO.stsemester }</td>
		<td width="70">�ֹι�ȣ</td>
		<td>${stDTO.stjumin1 } - ${stDTO.stjumin2 }</td>
	</tr>
</table><br/><br/>
<center>
<input type="button" value="���� ������" onclick="javascipt:location='crExamContent.khcu'">
</center>
<hr>
<br/><br/>
<table border="1" width="90%">
	<tr>
		<td colspan="9">���� ���ǽ�</td>
	</tr>
	<tr>
		<td width="10%">�����ڵ�</td>
		<td width="10%">��米��</td>
		<td width="10%">����</td>
		<td width="10%">�����̸�</td>
		<td width="10%">�г�</td>
		<td width="10%">����</td>
		<td width="10%">���ǽð�</td>
		<td width="10%">������ �ۼ�</td>
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
		<td><input type="button" value="������ �ۼ�" onclick="javascipt:location='crExamInputForm.khcu?classCode=${list.classCode}'"></td>  
	</tr>
	
	</c:forEach>
</table>
</center>
</form>
</body>
</html>