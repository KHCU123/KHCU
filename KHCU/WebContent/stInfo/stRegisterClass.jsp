<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script language="JavaScript">
function regist(a){
	form1.action="/KHCU/stRegisterClassPro.khcu?classcode="+a;
	form1.submit();
}


</script>
	<title> 수강신청하기 </title>
</head>
<body>
<form name="form1" id="form1" method="post" action="/KHCU/stRegisterClassPro.khcu">
<center><br/>
<table width="800" border="1">
	<tr bgcolor="skyblue">
		<th>수강신청하기</th>
	</tr> 
</table>
</center>
<center>
<table width="800" border="1">
	<tr>
		<td width="200" colspan="2">성명</td>
		<td width="200" colspan="2">${dto.stname }</td>
		<td width="200" colspan="2">학번</td>
		<td width="200" colspan="2">${dto.studentnum }</td>
	</tr>
	<tr>
		<td width="200" colspan="2">대학</td>
		<td width="200" colspan="2">${dto.stcollege }</td>
		<td width="200" colspan="2">학과</td>
		<td width="200" colspan="2">${dto.stmajor }</td>
	</tr>
	<tr>
		<td width="200" colspan="2">전공</td>
		<td width="200" colspan="2">${dto.stminor }</td>
		<td width="200" colspan="2">학년</td>
		<td width="200" colspan="2">${dto.stgrade }</td>
	</tr>
	<tr>
		<td width="100">학기</td>
		<td width="100">${dto.stsemester }</td>
		<td width="100">재적상태</td>
		<td width="100">${dto.ststate }</td>
		<td width="100">신청가능학점</td>
		<td width="100">${sc.poAppliCredit }</td>
		<td width="100">신청학점</td>
		<td width="100">${sc.appliCredit }</td>
	</tr>
</table><br/><br/>

<c:if test="${count == 0}">
<table width="800" border="1">
	<tr>
		<td align="center">
			수강신청 기간이 아닙니다.
		</td>
	</tr>
</table>
</c:if>

<c:if test="${count > 0}">
<table width="800" border="1">
	<tr bgcolor="skyblue">
		<td rowspan="5" width="100">수강신청</td>
		<td rowspan="5" width="100">강의코드</td>
		<tr bgcolor="skyblue">
			<td width="200" colspan="2">강의명</td>
			<td width="100">학점</td>
			<td width="200" colspan="2">강의시간</td>
			<td width="100">교수명</td>
		</tr>
		<tr bgcolor="skyblue">
			<td width="200" colspan="2">대학</td>
			<td width="100">최대인원</td>
			<td width="200" colspan="2">학과</td>
			<td width="100">강의유형</td>
		</tr>
		<tr bgcolor="skyblue">
			<td width="200" colspan="2">학기</td>
			<td width="100">평가기준</td>
			<td width="200" colspan="2">학년</td>
			<td width="100">신청인원</td>
		</tr>
		<tr bgcolor="skyblue">
			<td width="600" colspan="5">강의목표</td>
			<td width="100">신청하기</td>
		</tr>
<c:forEach var="article" items="${articleList}">
	<tr>
		<td rowspan="5" width="100">수강신청</td>
		<td rowspan="5" width="100">${article.classCode }</td>
		<tr>
			<td width="200" colspan="2">${article.className }</td>
			<td width="100">${article.credit }</td>
			<td width="200" colspan="2">${article.classTime }</td>
			<td width="100">${article.pfName }</td>
		</tr>
		<tr>
			<td width="200" colspan="2">${article.college }</td>
			<td width="100">${article.maxNum }</td>
			<td width="200" colspan="2">${article.major }</td>
			<td width="100">${article.classType }</td>
		</tr>
		<tr>
			<td width="200" colspan="2">${article.semester }</td>
			<td width="100">${article.plan_score }</td>
			<td width="200" colspan="2">${article.classGrade }</td>
			<td width="100">${article.people }</td>
		</tr>
		<tr>
			<td width="500" colspan="5">${article.plan_goal }</td>
			<td width="100">
				<input type="button" value="신청"  style=width:100%; onclick="regist(${article.classCode });">
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
		<a href="stRegisterClass.khcu?pageNum=${startPage - 10 }">[이전]</a>
	</c:if>

	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="stRegisterClass.khcu?pageNum=${i}">[${i}]</a>
	</c:forEach>

	<c:if test="${endPage < pageCount}">
		<a href="stRegisterClass.khcu?pageNum=${startPage + 10}">[다음]</a>
	</c:if>
</c:if>




</center>
</form>
</body>
</html>