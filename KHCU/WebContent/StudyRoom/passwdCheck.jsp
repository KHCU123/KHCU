<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${sessionScope.memId == null}">
	<script>
		alert("로그인이 필요합니다.");
		self.close();
		window.location='/KHCU/main.khcu';
	</script>
</c:if>
	<script>
		function pwCheck(){
			if(!document.passwdCheck.passwd.value){
				alert("비밀번호를 입력하십시요.");
				document.passwdCheck.passwd.focus();
				return false;
			}
		}
	</script>
<form method="POST" name="passwdCheck"  action="passwdCheckPro.khcu" onsubmit="return pwCheck()"> 
<input type="hidden" name="num" value="${num}">

<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
	<tr height="30">
		<td align=center><b> 입장을 위한 비밀번호를 입력해주세요. </b></td>
	</tr>
	<tr height="30">
		<td align=center >비밀번호 :
			<input type="password" name="passwd" size="8" maxlength="12">
		</td>
	</tr>
	<tr height="30">
		<td align=center>
			<input type="submit" value="확인" >
			<input type="button" value="목록" onclick="document.location.href='SrMain.khcu'">     
		</td>
	</tr>
</table>

</form>