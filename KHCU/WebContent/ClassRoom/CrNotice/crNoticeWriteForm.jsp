<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> �������� </title>
	<script>
		function writeCheck(){
			if(!document.writeForm.category.value){
				alert("�з��� �����ϼ���");
				return false;
			}
			if(!document.writeForm.title.value){
				alert("������ �Է��ϼ���");
				return false;
			}
			if(!document.writeForm.content.value){
				alert("������ �Է��ϼ���");
				return false;
			}
		}
	</script>
</head>
   
<body>  
<center><b> �������� �ۼ� </b>
<br>
<form method="post" name="writeForm" action="crNoticeWritePro.khcu" onsubmit="return writeCheck()">
<input type="hidden" name="classcode" value="${classcode }"/>
<input type="hidden" name="num" value="${num}">

<table width="400" border="1" cellspacing="0" cellpadding="0"  align="center">
	<tr>
		<td align="right" colspan="2">
			<a href="crNoticeList.khcu?classcode=${classcode}"> �۸��</a> 
		</td>
	</tr>
	<tr>
		<td width="100" align="center">�� ��</td>
		<td width="300">
			<select name="category">
	   			<option value="��������">��������</option>
	   			<option value="�Ϲݰ���">�Ϲݰ���</option>
			</select>
		</td>
	</tr>
	<tr>
		<td width="100" align="center" >�� ��</td>
		<td width="300"><input type="text" name="title" size="50">
	</tr>
	<tr>
		<td width="400" colspan="2"><textarea name="content" rows="13" cols="60"></textarea></td>
	</tr>
	<tr>      
		<td align="center" colspan="2"> 
			<input type="submit" value="�ۼ�">
			<input type="button" value="���" OnClick="window.location='crNoticeList.khcu?classcode=${classcode}'">
		</td>
	</tr>
</table>

</form>
</center>
</body>
</html>