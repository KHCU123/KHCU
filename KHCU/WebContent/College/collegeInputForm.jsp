<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> �������� �Է� </title>
	<script>
		function Check(){
			if(!document.inputForm.majName.value){
				alert("����� �а� �̸��� �Է��ϼ���");
				return false;
			}
		}
	</script>
</head>
   
<body>  
<center><b> �������� �Է� </b>
<br>
<form method="post" name="inputForm" action="collegeInputPro.khcu" onsubmit="return Check()">

<table width="500" border="1" cellspacing="0" cellpadding="0"  align="center">
	<tr>
		<td align="right" colspan="2">
			<a href="collegeList.khcu"> �������� ��� ���� </a> 
		</td>
	</tr>
	<tr>
		<td width="200" align="center">�ܰ� ���� �з�</td>
		<td width="300">
			<select name="colName">
	   			<option value="��������">��������</option>
	   			<option value="��������">��������</option>
	   			<option value="��ȸ���д���">��ȸ���д���</option>
	   			<option value="��������">��������</option>
	   			<option value="�ι�����">�ι�����</option>
	   			<option value="�ڿ����д���">�ڿ����д���</option>
			</select>
		</td>
	</tr>
	<tr>
		<td width="200" align="center" >�а� �̸�</td>
		<td width="300"><input type="text" name="majName" size="50">
	</tr>
	<tr>      
		<td align="center" colspan="2"> 
			<input type="submit" value="���">
			<input type="button" value="���" OnClick="window.location='collegeList.khcu'">
		</td>
	</tr>
</table>

</form>
</center>
</body>
</html>