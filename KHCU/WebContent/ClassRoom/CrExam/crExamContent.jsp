<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
<title>����</title>
</head>
<body>
<center>
<table border="1" width="80%" cellpadding="5" cellspacing="0" align="center">
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



<table border="1" width="700" cellpadding="5" cellspacing="0" align="center"> 
	<tr height="30"> 
		<td align="center"  width="100" >�����ȣ</td> 
		<td align="center"  width="100" >�����ڵ�</td> 
		<td align="center"  width="100" >����Ÿ��</td>
		<td align="center"  width="100" >����</td>
	</tr>

	<c:forEach var="article" items="${articleList}">
	<tr height="30">
		<td align="center"  width="100"> ${article.num} </td>
		<td align="center"  width="100"> ${article.classCode} </td>
		<input type="hidden" name="classcode" value="${article.classCode }">
		<td align="center"  width="100"> ${article.examType} </td>
		<td align="center"  width="100" ><input type="submit" value="������ Ǯ��" onclick="javascipt:location='crExamForm.khcu?num=${article.num}'"></td>
		<input type="hidden" name="num" value="${article.num }">
	</tr>
	</c:forEach>
	
</table>
<br>
</center>
</body>
</html>