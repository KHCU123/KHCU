<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> �������� </title>
	<script>
		function modifyCheck(){
			if(!document.modifyForm.category.value){
				alert("�з��� �����ϼ���");
				return false;
			}
			if(!document.modifyForm.title.value){
				alert("������ �Է��ϼ���");
				return false;
			}
			if(!document.modifyForm.content.value){
				alert("������ �Է��ϼ���");
				return false;
			}
		}
	</script>
</head>

<body>  
<center><b> �������� ����</b>
<br>
<form method="post" name="modifyForm" action="crNoticeModifyPro.khcu?pageNum=${pageNum}" onsubmit="return modifyCheck()">
<input type="hidden" name="num" value="${article.num}"></td>
<input type="hidden" name="classcode" value="${classcode }">

<table width="400" border="1" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td align="right" colspan="2">
			<a href="crNoticeList.khcu?classcode=${classcode }"> �۸��</a> 
		</td>
	</tr>
	<tr>
		<td  width="100" align="center">�� ��</td>
		<td  width="300">
			<select name="category">
				<c:if test="${article.category == '�л����'}">
					<option value="�л����" selected>�л����</option>
				</c:if>
				<c:if test="${article.category != '�л����'}">
					<option value="�л����" >�л����</option>
				</c:if>
				<c:if test="${article.category == '�Ϲݰ���'}">
					<option value="�Ϲݰ���" selected>�Ϲݰ���</option>
				</c:if>
				<c:if test="${article.category != '�Ϲݰ���'}">
					<option value="�Ϲݰ���" >�Ϲݰ���</option>
				</c:if>
			</select>
		</td>
	</tr>
	<tr>
		<td  width="100" align="center" >�� ��</td>
		<td  width="300"><input type="text" name="title" size="50" value="${article.title}"></td>
	</tr>
	<tr>
		<td  width="400" colspan="2"><textarea name="content" rows="13" cols="60">${article.content}</textarea></td>
	</tr>
	<tr>      
		<td colspan=2 align="center"> 
			<input type="submit" value="����">
			<input type="button" value="���" OnClick="window.location='crNoticeList.khcu?pageNum=${pageNum}&classcode=${classcode }'">
		</td>
	</tr>
</table>

</form>
</center>
</body>
</html>      
