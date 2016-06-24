<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>전체학기 성적조회</title>
	</head>
	<body>
		<form name="stAllScore" method="post">
		<center>
			<table border="1" width="90%" align="center">
				<tr>
					<td colspan="7">전체학기 성적조회</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td width="10%" align="center">학번</td>
					<td width="25%" align="center">${dto.studentnum }</td>
					<td width="15%" align="center">이름</td>
					<td width="25%" align="center">${dto.stname }</td>
					<td width="10%" align="center">학년</td>
					<td width="10%" align="center">${dto.stgrade }</td>
				</tr>
				<tr>
					<td width="10%" align="center">학부(학과)</td>
					<td width="25%" align="center">${dto.stmajor }</td>
					<td width="15%" align="center">부전공</td>
					<td width="25%" align="center">${dto.stminor }</td>
					<td width="10%" align="center">이수학기</td>
					<td width="10%" align="center">${dto.stsemester }</td>
				</tr>
				<tr>
					<td width="10%" align="center">학적상태</td>
					<td width="25%" align="center">${dto.ststate }</td>
					<td width="15%" align="center">주민등록번호</td>
					<td colspan="4">${dto.stjumin1 }-${dto.stjumin2 }</td>
				</tr>
			</table>
			<hr>
			<table border="1" width="90%" align="center">
				<tr>
					<td width="15%" align="center">이수학점</td>
					<td width="10%" align="center">${getSemester }</td>
					<td width="10%" align="center">졸업학점</td>
					<td width="15%" align="center">170</td>
					<td width="10%" align="center">총점</td>
					<td width="15%" align="center">130.11</td>
					<td width="15%" align="center">전체평균</td>
					<td width="10%" align="center">1.2</td>
				</tr>
			</table>
			
			<hr>

			<table border="1" width="90%" align="center">
				<tr>
					<td colspan="6"> 전체 학기 성적조회 </td>
				</tr>
				<tr>
					<td width="20%" align="center">년도 학기</td>
					<td width="15%" align="center">강의코드</td>
					<td width="10%" align="center">교수명</td>
					<td width="25%" align="center">강의명</td>
					<td width="5%" align="center">학점</td>
					<td width="5%" align="center">성적</td>
				</tr>
		<c:forEach var="list" items="${list}">
		
     	      <tr align="center">
        		<td>${list.year}년 - ${list.semester}학기</td>
        		<td align="center">${list.classcode}</td>
        		<td align="center">${list.proname}</td>
        		<td align="center">${list.classname}</td>
				<td align="center">${list.credit}</td>
        		<td align="center">${list.score }</td>
      	      </tr>
      	</c:forEach>	
      	<table border="0">
      	      <tr>
        		<td height="1" colspan="6"></td>
      	      </tr>
      	      </table>
      


			</table>
			
		</center>
		</form>
	</body>


</html>