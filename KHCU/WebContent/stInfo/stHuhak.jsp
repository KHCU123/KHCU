<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<html>
<head>
	<title>휴복학 관리</title>
	<script language="JavaScript">
		function Bokhak(){
			huhak.action="/KHCU/stBokhak.khcu";
			huhak.submit();
		}
	</script>
</head>
<body>
	<form name="huhak" method="post" action="/KHCU/stHuhakPro.khcu">
	<input type="hidden" name="studentnum" value="${dto.studentnum }"/>
		<table border="1" width="80%" align="center">
			<tr>
				<td align="center"  colspan="4">휴학관리</td>
			</tr>
			<tr>
				<td align="center"  width="10%">이름</td>
				<td align="center" width="30%">${dto.stname }</td>
				<td align="center"  width="10%">학번</td>
				<td align="center" width="30%">${dto.studentnum }</td>
			</tr>
			<tr>
				<td align="center"  width="10%">대학</td>
				<td align="center" width="30%">${dto.stcollege }</td>
				<td align="center"  width="10%">학과</td>
				<td align="center" width="30%">${dto.stmajor }</td>
			</tr>
			<tr>
				<td align="center"  width="10%">전공</td>
				<td align="center" width="30%">${dto.stminor }</td>
				<td align="center"  width="10%">학년</td>
				<td align="center" width="30%">${dto.stgrade }</td>
			</tr>
			<tr>
				<td align="center" width="10%">학기</td>
				<td align="center" width="30%">${dto.stsemester }</td>
				<td align="center" width="10%">주민번호</td>
				<td align="center" width="30%">${dto.stjumin1 } - ${dto.stjumin2 }</td>
			</tr>
			<tr>
				<td align="center" width="10%">휴학형태</td>
				<td align="center" width="30%">
					<select name="type">
						<option value="가정사정">가정사정</option>
						<option value="군휴학">군휴학</option>
						<option value="개인사정">개인사정</option>
					</select>
				</td>
				<td align="center" width="10%">기간</td>
				<td align="center" width="30%">
					<select name="period">
						<option value="1year">1년</option>
						<option value="2year">2년</option>
					</select>
				</td>
			</tr>
				<td align="center">신청이유</td>
				<td align="center" colspan="3"><input type="text" name="reason" size="100"/></td>
			<tr>
				<td align="center" colspan="4"><b>*휴학 신청은 최대 2년까지 가능합니다.</b></td>
			</tr>
						<tr>
				<td align="center" colspan="4"><input type="submit" value="신청하기"/></td>
			</tr>
		</table>
		<br/>
		<hr>
		<br/>
		
		<table border="1" width="80%" align="center">
			<tr>
				<td align="center" colspan="5">휴학 신청 현황</td>
			</tr>
			<tr>
				<td align="center" width="10%">신청날짜</td>
				<td align="center" width="10%">휴학형태</td>
				<td align="center" width="35%">이유</td>
				<td align="center" width="20%">신청기간</td>
				<td align="center" width="5%">처리상태</td>
			</tr>
			<c:forEach var="list" items="${list}">
     	      <tr align="center">
        		<td><fmt:formatDate value="${list.reg_date}" pattern="yyyy-MM-dd"/></td>
        		<td align="center">${list.type}</td>
        		<td align="center">${list.reason}</td>
        		<td align="center">${list.period}</td>
				<td align="center">${list.permit}</td>
      	      </tr>
      	</c:forEach>	
		</table>
		<c:if test="${count!=0 }">
		<br/>
		<hr>
		<br/>
		<table border="1" width="80%" align="center">
			<tr>
				<td align="center" colspan="3">복학신청</td>
			</tr>
			<c:if test="${check==0 }">
			<tr>
			<td align="center"><input type="button" value="복학신청" onClick="Bokhak();"/></td></tr></c:if>
			<c:if test="${check!=0 }">
			<tr>
				<td align="center">신청</td>
				<td align="center">신청일자</td>
				<td align="center">처리상태</td>
			</tr>
				<c:forEach var="list2" items="${list2 }">
				<tr>
					<td align="center">복학신청</td>
					<td align="center"><fmt:formatDate value="${list2.reg_date }" pattern="yyyy-MM-dd"/></td>
					<td align="center">${list2.permit}</td>
				</tr>
				</c:forEach>
			</c:if>
		</table>
		</c:if>
	</form>
</body>

</html>