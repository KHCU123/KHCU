<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title> 공지사항 </title>
	<script>
		function modifyCheck(){
			if(!document.modifyForm.category.value){
				alert("분류를 선택하세요");
				return false;
			}
			if(!document.modifyForm.title.value){
				alert("제목을 입력하세요");
				return false;
			}
			if(!document.modifyForm.content.value){
				alert("내용을 입력하세요");
				return false;
			}
		}
	</script>
</head>
<style>
h1{
text-align:center;
}
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;  
}
#customers td, #customers th {
    border: 1px solid #EAEAEA;
    text-align: left;
    padding: 8px;
}
#customers tr:nth-child(even){
	background-color: #FFFFFF
}
#customers tr:hover {
	background-color: #EAEAEA;
}
#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    background-color: #FFFFFF;
    color: white;
}
#customers a{
	text-decoration:none; 
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
}
</style>
<body>  
<center><b> 공지사항 수정</b>
<br>
<form method="post" name="modifyForm" action="comNoticeModifyPro.khcu?pageNum=${pageNum}" onsubmit="return modifyCheck()">
<input type="hidden" name="num" value="${article.num}"></td>

<table id="customers" width="400" border="1" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td align="right" colspan="2">
			<a href="comNoticeList.khcu"> 글목록</a> 
		</td>
	</tr>
	<tr>
		<td  width="100" align="center">분 류</td>
		<td  width="300">
			<select name="category">
				<c:if test="${article.category == '학사공지'}">
					<option value="학사공지" selected>학사공지</option>
				</c:if>
				<c:if test="${article.category != '학사공지'}">
					<option value="학사공지" >학사공지</option>
				</c:if>
				<c:if test="${article.category == '일반공지'}">
					<option value="일반공지" selected>일반공지</option>
				</c:if>
				<c:if test="${article.category != '일반공지'}">
					<option value="일반공지" >일반공지</option>
				</c:if>
			</select>
		</td>
	</tr>
	<tr>
		<td  width="100" align="center" >제 목</td>
		<td  width="300"><input type="text" name="title" size="50" value="${article.title}"></td>
	</tr>
	<tr>
		<td  width="400" colspan="2"><textarea name="content" rows="13" cols="60">${article.content}</textarea></td>
	</tr>
	<tr>      
		<td colspan=2 align="center"> 
			<input type="submit" value="수정">
			<input type="button" value="목록" OnClick="window.location='comNoticeList.khcu?pageNum=${pageNum}'">
		</td>
	</tr>
</table>

</form>
</center>
</body>
</html>      
