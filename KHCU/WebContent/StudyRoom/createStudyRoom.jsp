<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title> ���͵�� </title>
</head>
<script>
function check(){
	var userinput = eval("document.userinput");
	
    if(!userinput.roomTitle.value) {
        alert("������ ���͵���� �̸��� �Է��ϼ���.");
        return false;
    }
    if(!userinput.passwd.value) {
        alert("���͵���� ������Դϴ�. ��й�ȣ�� ����ϼ���!");
        return false;
    }
}



</script>

<body>
<center>
<form name="userinput" action="createStudyRoomPro.khcu" method="post" onsubmit="return check();">
<table width="300">
	<tr height="30">
		<td align="center" width="300" colspan="2"><b>���͵�� �����</b></td>
	</tr>
	<tr height="30">
		<td align="center" width="100">�� �̸�</td>
		<td align="left"><input type="text" name="roomTitle" style="width:200"/></td>
	</tr>
	<tr height="30">
		<td align="center" width="100">��й�ȣ</td>
		<td align="left">
			<input type="password" name="passwd" style="width:200">
		</td>
	</tr>
	<tr height="30">
		<td align="center" width="300" colspan="2">
			<input type="submit" value="�����" style="width:100"/> &nbsp;
			<input type="button" value="���" style="width:100" onclick="window.close()"/>
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>