<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${sessionScope.memId == null}">
	<script>
		alert("�α����� �ʿ��մϴ�.");
		self.close();
		window.location='/KHCU/main.khcu';
	</script>
</c:if>
	<script>
		function pwCheck(){
			if(!document.passwdCheck.passwd.value){
				alert("��й�ȣ�� �Է��Ͻʽÿ�.");
				document.passwdCheck.passwd.focus();
				return false;
			}
		}
	</script>
<form method="POST" name="passwdCheck"  action="passwdCheckPro.khcu" onsubmit="return pwCheck()"> 
<input type="hidden" name="num" value="${num}">

<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
	<tr height="30">
		<td align=center><b> ������ ���� ��й�ȣ�� �Է����ּ���. </b></td>
	</tr>
	<tr height="30">
		<td align=center >��й�ȣ :
			<input type="password" name="passwd" size="8" maxlength="12">
		</td>
	</tr>
	<tr height="30">
		<td align=center>
			<input type="submit" value="Ȯ��" >
			<input type="button" value="���" onclick="document.location.href='SrMain.khcu'">     
		</td>
	</tr>
</table>

</form>