<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��������</title>
<script>
	function exit(){
		self.close();
	}
</script>
</head>
<body>
	<form method="post" name="submitForm" action="crHwSubmitPro.khcu" enctype="multipart/form-data">
		<input type="hidden" name="classcode" value="${classcode }"/>
		<input type="hidden" name="num" value="${num }"/>
		<input type="hidden" name="type" value="${type }"/>
		<center>�� �� �� ��</center>
		<br/>
		<table width="500" border="1"  cellspacing="0" cellpadding="5"  align="center">
			<tr>
			<td width="100" align="center">��������</td>
			<td width="400" align="center">${type }</td>
			</tr>
			<tr>
			<td width="500" align="center" colspan="2">�� ��</td>
			</tr>
			<tr>
			<td width="500" align="center" colspan="2"><textarea name="title"  rows="13" cols="60"></textarea></td>
			</tr>
			<tr>
			<td width="100" align="center">÷������</td>
			<td width="400" align="center"><input type="file" name="submitfile"/></td>
			</tr>
			<tr>
			<td width="500" align="center" colspan="2">
				<input type="submit" value="�� ��"/>&nbsp;&nbsp;&nbsp;
				<input type="button" value="�� ��" onclick="exit()"/>
			</td>
			</tr>
		</table>
	</form>
</body>
</html>