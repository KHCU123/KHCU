<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<form method="post" action="/KHCU/stCardPro.khcu">
<table width="80%">
	<tr>
		<th>학생카드관리</th>
	</tr>
</table> 
<table border="1" width="80%" align="center">
	<tr>
		<td rowspan="5" width="100"><img src="<c:url value="/stInfo/stProfile/${dto.stprofilename}"/>" width="100" height="130"></td>
	<tr>
		<td width="70">이름</td>
		<td>${dto.stname }</td>
		<td width="70">학번</td>
		<td>${dto.studentnum }</td>
	</tr>
	<tr>
		<td width="70">대학</td>
		<td>${dto.stcollege }</td>
		<td width="70">학과</td>
		<td>${dto.stmajor }</td>
	</tr>
	<tr>
		<td width="70">전공</td>
		<td>${dto.stminor }</td>
		<td width="70">학년</td>
		<td>${dto.stgrade }</td>
	</tr>
	<tr>
		<td width="70">학기</td>
		<td>${dto.stsemester }</td>
		<td width="70">주민번호</td>
		<td>${dto.stjumin1 } - ${dto.stjumin2 }</td>
	</tr>
</table><br/><br/>
<table border="1" width="80%" align="center">
	<tr>
		<td width="80">재적상태</td>
		<td width="100">${dto.ststate }
			<select name="ststate">
        		<option name="1">재학</option>
        		<option name="2">휴학</option>
        		<option name="3">졸업</option>
        	</select>
		</td>
		<td width="80">휴대폰</td>
		<td>
			<input type="text" value="${dto.stphone }" name="stphone">
		</td>
		<td width="80">이메일</td>
		<td>
			<input type="text" value="${dto.stemail }" name="stemail">
		</td>
	</tr>
	<tr>
		<td width="80" rowspan="2">주소</td>
		<td colspan="3"><input type="text" size="30" value="${dto.staddress1 }" name="staddress1"></td>
		<td colspan="3"><input type="text" value="${dto.stpostcode }" name="stpostcode"><input type="button" value="우편번호찾기"></td>
		<tr>
			<td colspan="6"><input type="text" size="80" value="${dto.staddress2 }" name="staddress2"></td>
		</tr>
	<tr>
		<td>페이스북</td>
		<td colspan="6"><input type="text" size="80" value="${dto.stfacebook }" name="stfacebook"></td>
	</tr>
</table>
<center>
<input type="submit" value="수정">
</center>
</form>