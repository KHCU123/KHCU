<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> �����亯 </title>
	<script>
		function writeCheck(){
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
<center><b> �����亯 �ۼ� </b>
<br>
<form method="post" name="writeForm" action="crQnAWritePro.khcu" onsubmit="return writeCheck()">
<input type="hidden" name="classcode" value="${classcode }"/>
<input type="hidden" name="num" value="${num}">
<input type="hidden" name="ref" value="${ref}">
<input type="hidden" name="re_step" value="${re_step}">
<input type="hidden" name="re_level" value="${re_level }">

<table width="400" border="1" cellspacing="0" cellpadding="0"  align="center">
	<tr>
		<td align="right" colspan="2">
			<a href="crQnAList.khcu?classcode=${classcode}"> �۸��</a> 
		</td>
	</tr>
	<tr>
		<td width="100" align="center" >�� ��</td>
		<td width="300">
		<c:if test="${num==0}"><input type="text" name="title" size="40"></c:if>
		<c:if test="${num!=0 }"><input type="text" size="40" maxlength="50" name="title" value="[�亯]"></c:if>
		</td>
	</tr>
	<tr>
		<td width="100" align="center"> �ۼ���</td>
		<td width="300" align="center">${sessionScope.memId }</td>
	</tr>
	<tr>
		<td width="400" colspan="2" align="center"><textarea name="content" rows="13" cols="60"></textarea></td>
	</tr>
	<tr>
		<td width="100" align="center">��й�ȣ</td>
		<td width="300" align="center"><input type="password" name="passwd"/></td>
	</tr>
	<tr>      
		<td align="center" colspan="2"> 
			<input type="submit" value="�ۼ�">
			<input type="button" value="���" OnClick="window.location='crQnAList.khcu?classcode=${classcode}'">
		</td>
	</tr>
</table>

</form>
</center>
</body>
</html>