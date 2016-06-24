<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> 공지사항 </title>

	<script>
		function pwCheck(){	
			if(document.deleteForm.pw.value==''){
				alert("비밀번호를 입력하십시요.");
				document.delForm.pw.focus();
				return false;
			}
		}
	</script>
</head>

<body>
<center><b> 공지사항 삭제 </b>
<br>
<form method="POST" name="deleteForm"  action="crNoticeDeletePro.khcu?pageNum=${pageNum}" onsubmit="return pwCheck()"> 
<input type="hidden" name="num" value="${num}">
<input type="hidden" name="classcode" value="${classcode }">

<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
	<tr height="30">
		<td align=center><b> 공지사항 글 삭제를 하시겠습니까? </b></td>
	</tr>
	<tr height="30">
		<td align=center>
			<input type="submit" value="삭제" >
			<input type="button" value="목록" onclick="document.location.href='crNoticeList.khcu?pageNum=${pageNum}&classcode=${classcode }'">     
		</td>
	</tr>
</table>

</form>
</center>
</body>
</html> 
