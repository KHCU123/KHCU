<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> 질문답변 </title>
	<script>
		function writeCheck(){
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
<center><b> 질문답변 작성 </b>
<br>
<form method="post" name="writeForm" action="crQnAModifyPro.khcu" onsubmit="return writeCheck()">
<input type="hidden" name="classcode" value="${classcode }"/>
<input type="hidden" name="num" value="${num}">
<input type="hidden" name="pageNum" value="${pageNum }"/>

<table width="400" border="1" cellspacing="0" cellpadding="0"  align="center">
	<tr>
		<td align="right" colspan="2">
			<a href="crQnAList.khcu?classcode=${classcode}"> 글목록</a> 
		</td>
	</tr>
	<tr>
		<td width="100" align="center" >제 목</td>
		<td width="300">
			<input type="text" name="title" size="40" value=${article.title }>
		</td>
	</tr>
	<tr>
		<td width="100" align="center"> 작성자</td>
		<td width="300" align="center">${article.writer}</td>
	</tr>
	<tr>
		<td width="400" colspan="2" align="center"><textarea name="content" rows="13" cols="60">${article.content }</textarea></td>
	</tr>
	<tr>
		<td width="100" align="center">비밀번호</td>
		<td width="300" align="center"><input type="password" name="passwd"/></td>
	</tr>
	<tr>
		<td align="center" colspan="2"> 
			<input type="submit" value="작성">
			<input type="button" value="목록" OnClick="window.location='crQnAList.khcu?classcode=${classcode}'">
		</td>
	</tr>
</table>

</form>
</center>
</body>
</html>