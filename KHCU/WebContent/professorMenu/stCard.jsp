<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<form>
<table width="80%">
	<tr>
		<th>학생카드관리</th>
		<th align="right"><input type="button" value="저장"></th>
	</tr>
</table> 
<table border="1" width="80%" align="center">
	<tr>
		<td rowspan="5" width="100"><img src="/KHCU/img/sam.jpg" width="100" height="130"></td>
	<tr>
		<td width="70">이름</td>
		<td>${stName }어피치</td>
		<td width="70">학번</td>
		<td>${studentNum }20160520</td>
	</tr>
	<tr>
		<td width="70">대학</td>
		<td>${stCollege }KH대학교</td>
		<td width="70">학과</td>
		<td>${stMajor }IT-디자인학부</td>
	</tr>
	<tr>
		<td width="70">전공</td>
		<td>${stMinor }컴퓨터정보통신학과</td>
		<td width="70">학년</td>
		<td>${stGrade }1학년</td>
	</tr>
	<tr>
		<td width="70">학기</td>
		<td>${stSemester }1학기</td>
		<td width="70">주민번호</td>
		<td>${stJumin1 } ${stJumin2 } 970101-*******</td>
	</tr>
</table><br/><br/>
<table border="1" width="80%" align="center">
	<tr>
		<td width="80">재적상태</td>
		<td>${stState }
			<select>
				<option>재학중</option>
				<option>휴학중</option>
			</select>
		</td>
		<td width="80">휴대폰</td>
		<td>
			<input type="text" value="${stPhone }010-1234-1234">
		</td>
		<td width="80">이메일</td>
		<td>
			<input type="text" value="${stEmail }acbd@gmail.com">
		</td>
	</tr>
	<tr>
		<td width="80" rowspan="2">주소</td>
		<td colspan="3"><input type="text" size="30" value="${stAddress1 }서울특별시 강남구"></td>
		<td colspan="3"><input type="text" value="${stPostcode }1234-1234"><input type="button" value="우편번호찾기"></td>
		<tr>
			<td colspan="6"><input type="text" size="80" value="${stAddress2 }우리집"></td>
		</tr>
	<tr>
		<td>페이스북</td>
		<td colspan="6"><input type="text" size="80" value="${stAddress2 }https://www.facebook.com/profile.php?id=100008107984203"></td>
	</tr>
	
</table>
</form>
</html>