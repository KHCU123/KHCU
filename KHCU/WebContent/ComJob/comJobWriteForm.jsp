<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> ������� </title>
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
   <style>
h1{
text-align:center;
}
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;  
}
#customers td, #customers th {
    border: 1px solid #EAEAEA;
    text-align: left;
    padding: 8px;
}
#customers tr:nth-child(even){
	background-color: #FFFFFF
}
#customers tr:hover {
	background-color: #EAEAEA;
}
#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    background-color: #FFFFFF;
    color: white;
}
#customers a{
	text-decoration:none; 
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
}
</style>
<body>  
<center><b> ������� �ۼ� </b>
<br>
<form method="post" name="writeForm" action="comJobWritePro.khcu" onsubmit="return writeCheck()">
<input type="hidden" name="num" value="${num}">

<table id="customers" width="400" border="1" cellspacing="0" cellpadding="0"  align="center">
	<tr>
		<td align="right" colspan="2">
			<a href="comJobList.khcu"> �۸��</a> 
		</td>
	</tr>
	<tr>
		<td width="100" align="center">�� ��</td>
		<td width="300">
			<select name="category">
	   			<option value="�Ƹ�����Ʈ">�Ƹ�����Ʈ</option>
	   			<option value="����">����</option>
	   			<option value="����">����</option>
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
			<input type="button" value="���" OnClick="window.location='comJobList.khcu'">
		</td>
	</tr>
</table>

</form>
</center>
</body>
</html>