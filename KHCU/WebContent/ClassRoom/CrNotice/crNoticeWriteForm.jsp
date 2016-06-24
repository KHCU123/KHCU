<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> 공지사항 </title>
	<script>
		function writeCheck(){
			if(!document.writeForm.category.value){
				alert("분류를 선택하세요");
				return false;
			}
			if(!document.writeForm.title.value){
				alert("제목을 입력하세요");
				return false;
			}
			if(!document.writeForm.content.value){
				alert("내용을 입력하세요");
				return false;
			}
		}
	</script>
</head>
   
<body>  
<center><b> 공지사항 작성 </b>
<br>
<form method="post" name="writeForm" action="crNoticeWritePro.khcu" onsubmit="return writeCheck()">
<input type="hidden" name="classcode" value="${classcode }"/>
<input type="hidden" name="num" value="${num}">

<table width="400" border="1" cellspacing="0" cellpadding="0"  align="center">
	<tr>
		<td align="right" colspan="2">
			<a href="crNoticeList.khcu?classcode=${classcode}"> 글목록</a> 
		</td>
	</tr>
	<tr>
		<td width="100" align="center">분 류</td>
		<td width="300">
			<select name="category">
	   			<option value="학점공지">학점공지</option>
	   			<option value="일반공지">일반공지</option>
			</select>
		</td>
	</tr>
	<tr>
		<td width="100" align="center" >제 목</td>
		<td width="300"><input type="text" name="title" size="50">
	</tr>
	<tr>
		<td width="400" colspan="2"><textarea name="content" rows="13" cols="60"></textarea></td>
	</tr>
	<tr>      
		<td align="center" colspan="2"> 
			<input type="submit" value="작성">
			<input type="button" value="목록" OnClick="window.location='crNoticeList.khcu?classcode=${classcode}'">
		</td>
	</tr>
</table>

</form>
</center>
</body>
</html>