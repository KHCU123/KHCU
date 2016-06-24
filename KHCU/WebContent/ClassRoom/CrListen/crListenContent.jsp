<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>${dto.classtitle}</title>
</head>
<body>

	<center><h2>${week}주차 ${dto.classtitle}</h2></center>
	<c:if test="${dto==null}">
	<c:if test="${id==2}">
	<table align="center" width="700">
		<tr>
			<td align="right"><a href="crInputForm.khcu?classcode=${classcode}&week=${week}">강의 내용 입력</a></td>
		</tr>
	</table>
	</c:if>
	</c:if>
	<c:if test="${dto!=null}">
	<c:if test="${id==2}">
	<table align="center" width="700">
		<tr>
			<td align="right"><a href="crModifyForm.khcu?classcode=${classcode}&week=${week}">강의 내용 수정</a></td>
		</tr>
	</table>
	</c:if>
	</c:if>
	
	<table align="center" width="700" border="1">
		<tr>
			<td align="center" width="100">강의제목</td>
			<td align="center" width="300">${dto.classtitle }</td>
		</tr>
		<tr>
			<td align="center" width="70%" colspan="2">
				<video controls="controls">
				<source src="<c:url value="/ClassRoom/CrListen/Video/${dto.filename }"/>" type="video/mp4"/>
				</video>
			</td>
		</tr>
		<tr>
			<td align="center" width="100">강의 자료</td>
			<td align="center" width="300"><a href="http://localhost:8080/KHCU/crListenContentDown.khcu?referencename=${dto.referencename }">${dto.referencename }</a></td>
		</tr>
	</table>
	<br/>
	<table align="center">
		<tr>
			<td align="center" colspan="2"><input type="button" value="강의목록으로" onClick="javascript:history.back()"></td>
		</tr>
	</table>
</body>
</html>