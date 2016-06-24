<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<link href='http://fonts.googleapis.com/css?family=News+Cycle:400,700' rel='stylesheet' type='text/css'>
<link href="http://fonts.googleapis.com/css?family=Lobster" rel="stylesheet" type="text/css">
<script src="Tab.js" type="text/javascript"></script>
<head>
<script type="text/javascript" language = "javascript">
<!--
// 모바일 웹 주소창 숨기기
window.addEventListener('load', function() {
  // body의 height를 살짝 늘리는 코드
  document.body.style.height = (document.documentElement.clientHeight + 5) + 'px';
  // scroll를 제어 하는 코드
  setTimeout(scrollTo, 0, 0, 1);
}, false);
//-->
</script>
<title> KH사이버대학교 </title>
    <!--jQuery 라이브러리 추가-->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <!--jQuery 플러그인 추가-->
    <script src="js/jquery.banner.js"></script>
    <!--jQuery 플러그인 옵션 설정 추가-->
    <script src="js/script.js"></script>
    <script src="js/prefixfree.min.js"></script>
</head>
<style>
.clsBannerScreen {
    overflow: hidden;
    position: relative;
    height: 150px;
    width: 600px;
    border: 1px solid #e1e1e1;
    cursor: pointer;
    clear: both;
}
 
.clsBannerScreen .images {
    position: absolute;
    display: none;
}
 
ul, li {
    list-style: none;
    margin: 0;
    padding: 0;
    font-size: 10pt;
}
 
.clsBannerButton {
    width: 600px;
    cursor: pointer;
    border-bottom: 1px solid #e1e1e1;
}
 
.clsBannerButton li {
    width: 100px;
    float: left;
    padding: 2px;
    border-right: 1px solid #e1e1e1;
}
 
.clsBannerButton li.fir {
    border-left: 1px solid #e1e1e1;
}
 
.clsBannerButton li.labelOverClass {
    font-weight: bold;
}
.box-radius {
   font-family: Helvetica, Arial, "Lucida Grande", sans-serif;
   font-size: 13px;
   background-color: ivory;
   line-height: 1.5;
   margin: 30px auto;
   width: 200px;
   height: 150px;
   padding: 10px;
   border: 1px solid #cc0000;
   border-radius: 15px;
   -moz-border-radius: 15px;
   -webkit-border-radius: 15px;
   -o-border-radius: 15px;
}

.b{
float : right;
}
</style>
<body>
<center>
<c:if test="${sessionScope.memId == null}">
<form action="loginPro.khcu" method="post">
<table width="400" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="100" height="30" align="right"> 학번 </td>
		<td width="200" height="30" align="center"><input type="text" name="loginNum"></td>
		<td width="100" height="60" align="left" rowspan="2"><input type="submit" value="로그인" style="width:100%; height:60"></td>
	</tr>
	<tr>
		<td width="100" height="30" align="right"> 비밀번호 </td>
		<td width="200" height="30" align="center"><input type="password" name="loginPw"></td>
	</tr>
	<tr><td colspan="3">&nbsp;</td>
	<tr>
		<td width="400" height="30" align="center" colspan="3">
			<input type="button" value="학번 찾기" onclick="javascipt:location='findIdForm.khcu'" style="width:120">
			<input type="button" value="비밀번호 찾기" onclick="javascipt:location='findPwForm.khcu'" style="width:120">
		</td>
	</tr>
</table>
</form>
</c:if>
<c:if test="${sessionScope.memId != null}">
	<b>${sessionScope.memId} 로그인 성공</b><br>
	<input align="left" type="button" value="강의실" onclick="javascript:location='classes.khcu'">
	<input align="left" type="button" value="커뮤니티" onclick="javascript:location='community.khcu'">
	<input align="left" type="button" value="나의정보" onclick="javascript:location='mypage.khcu'">
	<br />
	<input align="left" type="button" value="로그아웃" onclick="javascript:location='logout.khcu'">
	<input align="left" type="button" value="나의강의보기(교수ver)" onclick="javascript:location='classTimeTable.khcu'">
	<input align="left" type="button" value="강의신청하기(교수ver)" onclick="javascript:location='classInputForm.khcu'">
</c:if>
</center>
</body>
</html>