<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<title> ����/�亯 </title>
</head>

<body>
<center><b> ����/�亯 </b>
<br>

<form>
<table width="400" border="1" cellspacing="0" cellpadding="5"  align="center">  
<input type="hidden" name="classcode" value="${classcode}"/>
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
	<tr height="30">
		<td align="center" width="100">�ۼ���</td>
		<td align="center" width="300" colspan="3">${article.writer }</td>
	</tr>
	<tr>
		<td align="left" width="400" height="300"colspan="4"><pre>${article.content}</pre></td>
	</tr>
	<tr height="30">      
		<td colspan="4" align="right">
		<c:if test="${id==2 }">
			<input type="button" value="�亯"
				onclick="document.location.href='crQnAWriteForm.khcu?num=${article.num}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level }&classcode=${classcode }'">
			&nbsp;&nbsp;&nbsp;&nbsp;
		</c:if>
		<c:if test="${article.writer==sessionScope.memId}">
			<input type="button" value="����"
				onclick="document.location.href='crQnAModifyForm.khcu?num=${article.num}&pageNum=${pageNum}&classcode=${classcode}'">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="����"
				onclick="document.location.href='crQnADeleteForm.khcu?num=${article.num}&pageNum=${pageNum}&classcode=${classcode}'">
			&nbsp;&nbsp;&nbsp;&nbsp;
		</c:if>
			<input type="button" value="���" onclick="document.location.href='crQnAList.khcu?classcode=${classcode}'">
		</td>
	</tr>
</table>
</form>

</center>
</body>
</html>
