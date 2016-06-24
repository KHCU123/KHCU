<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title> 스터디룸 </title>
</head>
<script>
function check(){
	var userinput = eval("document.userinput");
	
    if(!userinput.roomTitle.value) {
        alert("개설할 스터디룸의 이름을 입력하세요.");
        return false;
    }
    if(!userinput.passwd.value) {
        alert("스터디룸은 비공개입니다. 비밀번호를 등록하세요!");
        return false;
    }
}



</script>

<body>
<center>
<form name="userinput" action="createStudyRoomPro.khcu" method="post" onsubmit="return check();">
<table width="300">
	<tr height="30">
		<td align="center" width="300" colspan="2"><b>스터디룸 만들기</b></td>
	</tr>
	<tr height="30">
		<td align="center" width="100">방 이름</td>
		<td align="left"><input type="text" name="roomTitle" style="width:200"/></td>
	</tr>
	<tr height="30">
		<td align="center" width="100">비밀번호</td>
		<td align="left">
			<input type="password" name="passwd" style="width:200">
		</td>
	</tr>
	<tr height="30">
		<td align="center" width="300" colspan="2">
			<input type="submit" value="만들기" style="width:100"/> &nbsp;
			<input type="button" value="취소" style="width:100" onclick="window.close()"/>
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>