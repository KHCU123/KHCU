<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> 대학정보 입력 </title>
	<script>
		function Check(){
			if(!document.inputForm.majName.value){
				alert("등록할 학과 이름을 입력하세요");
				return false;
			}
		}
	</script>
</head>
   
<body>  
<center><b> 대학정보 입력 </b>
<br>
<form method="post" name="inputForm" action="collegeInputPro.khcu" onsubmit="return Check()">

<table width="500" border="1" cellspacing="0" cellpadding="0"  align="center">
	<tr>
		<td align="right" colspan="2">
			<a href="collegeList.khcu"> 대학정보 모두 보기 </a> 
		</td>
	</tr>
	<tr>
		<td width="200" align="center">단과 대학 분류</td>
		<td width="300">
			<select name="colName">
	   			<option value="공과대학">공과대학</option>
	   			<option value="법과대학">법과대학</option>
	   			<option value="사회과학대학">사회과학대학</option>
	   			<option value="예술대학">예술대학</option>
	   			<option value="인문대학">인문대학</option>
	   			<option value="자연과학대학">자연과학대학</option>
			</select>
		</td>
	</tr>
	<tr>
		<td width="200" align="center" >학과 이름</td>
		<td width="300"><input type="text" name="majName" size="50">
	</tr>
	<tr>      
		<td align="center" colspan="2"> 
			<input type="submit" value="등록">
			<input type="button" value="목록" OnClick="window.location='collegeList.khcu'">
		</td>
	</tr>
</table>

</form>
</center>
</body>
</html>