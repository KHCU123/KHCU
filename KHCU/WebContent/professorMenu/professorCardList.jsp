<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title> 교수 정보 리스트 </title>
</head>

<body>
<center><b> 교수 정보 리스트 </b>

<table width="700">
	<tr>
		<td align="center">
			<input type="button" value="교수 등록하기" onclick="javascript:location='professorCardInputForm.khcu'">			
		</td>
	</tr>
</table>

<c:if test="${count == 0}">
<table width="700" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">
			등록된 교수 정보가 없습니다.
		</td>
	</tr>
</table>
</c:if>

<c:if test="${count > 0}">
<table border="1" width="900" cellpadding="5" cellspacing="0" align="center"> 
	<tr height="30"> 
		<td align="center"  width="50"  >교 번</td> 
		<td align="center"  width="100" >소 속 단 대</td>
		<td align="center"  width="100" >소 속 학 과</td> 
		<td align="center"  width="100" >이 름</td>
		<td align="center"  width="100" >주민번호</td>
		<td align="center"  width="100" >전화번호</td> 
		<td align="center"  width="250" >주소</td>
		<td align="center"  width="100" >재직상태</td>
		<td align="center"  width="100" >날 짜</td>
		<td align="center"  width="100" >시간표</td>
		
	</tr>

	<c:forEach var="article" items="${articleList}">
	
	<tr>
		<td align="center" colspan="8">
			<input type="button" value="테스트 교수 삭제" onclick="javascipt:location='pftestDeleteForm.khcu?proNum=${article.proNum}&pageNum=${currentPage}'">
			<input type="button" value="교수 입장 정보변경" onclick="javascipt:location='professorCardModifyForm.khcu?proNum=${article.proNum}&pageNum=${currentPage}'">
		</td>
	</tr>
	
	<tr height="30">
		<td align="center"  width="50"> ${article.proNum} </td>
		<td align="center"  width="100" rowspan="2"> ${article.proCollege} </td>
		<td align="center"  width="100" rowspan="2"> ${article.proMajor} </td>
		<td align="center"  width="100" rowspan="2"> ${article.proName} </td>
		<td align="center"  width="100" rowspan="2"> ${article.proJumin1} - * </td>
		<td align="center"  width="100" rowspan="2"> ${article.proPhone} </td>
		<td align="center"  width="250" rowspan="2"> ${article.proPostcode} <br>
										 ${article.proAddress1} &nbsp;&nbsp; ${article.proAddress2} <br>
										 ${article.proEmail} </td>
		
		<td align="center"  width="100"> ${article.proState} </td>							
		<td align="center"  width="100" rowspan="2">
			<fmt:formatDate value="${article.proReg_date}" type="both"  pattern="yyyy-MM-dd"/></td>
		<td><input type="button" value="강의시간표" onclick="javascript:location='classTimeTable.khcu?pfNum=${article.proNum}'"> </td>
	</tr>
	<tr>
		<td align="center" width="50">
			<img src="/KHCU/professorMenu/photo/${article.proProfileName}" width="50" height="50">
		</td>
		<td align="center" width="100">
			<input type="button" value="퇴사" onclick="javascript:location='professorCardStateUpdatePro.khcu?proNum=${article.proNum}'">
		</td>
	</tr>

	
			
	</c:forEach>
	
</table>
</c:if>

<br>

<c:if test="${count > 0}">
	<c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
	<c:set var="pageBlock" value="${10}"/>
	<fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
	<c:set var="startPage" value="${result * 10 + 1}" />
	<c:set var="endPage" value="${startPage + pageBlock-1}"/>
	<c:if test="${endPage > pageCount}">
		<c:set var="endPage" value="${pageCount}"/>
	</c:if> 
          
	<c:if test="${startPage > 10}">
		<a href="professorCardList.khcu?pageNum=${startPage - 10 }">[이전]</a>
	</c:if>

	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="professorCardList.khcu?pageNum=${i}">[${i}]</a>
	</c:forEach>

	<c:if test="${endPage < pageCount}">
		<a href="professorCardList.khcu?pageNum=${startPage + 10}">[다음]</a>
	</c:if>
</c:if>

</center>
</body>
</html>