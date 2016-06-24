<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<title> �������� </title>
</head>

<body>
<center><b> �������� </b>
<br>

<form>
<table width="400" border="1" cellspacing="0" cellpadding="5"  align="center">  
	<tr height="30">
		<td align="center" width="100">�۹�ȣ</td>
		<td align="center" width="100" align="center">${article.num}</td>
		<td align="center" width="100">��ȸ��</td>
		<td align="center" width="100" align="center">${article.readcount}</td>
	</tr>
	<tr height="30">
		<td align="center" width="100">�ۼ���¥</td>
		<td align="center" width="300" align="center" colspan="3">
			<fmt:formatDate value="${article.reg_date}" type="both"  pattern="yyyy-MM-dd"/>
		</td>
	</tr>
	<tr height="30">
		<td align="center" width="100">����</td>
		<td align="center" width="300" align="center" colspan="3">${article.title}</td>
	</tr>
	<tr>
		<td align="left" width="400" colspan="4"><pre>${article.content}</pre></td>
	</tr>
	<tr height="30">      
		<td colspan="4" align="right">
		<c:if test="${id==2 }">
			<input type="button" value="����"
				onclick="document.location.href='crNoticeModifyForm.khcu?num=${article.num}&pageNum=${pageNum}&classcode=${classcode}'">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="����"
				onclick="document.location.href='crNoticeDeleteForm.khcu?num=${article.num}&pageNum=${pageNum}&classcode=${classcode}'">
			&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
			<input type="button" value="���" onclick="document.location.href='crNoticeList.khcu?pageNum=${pageNum}&classcode=${classcode}'">
		</td>
	</tr>
</table>
</form>

</center>
</body>
</html>
