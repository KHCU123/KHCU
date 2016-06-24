<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>등록금 고지서 출력</title>
</head>
	<script type="text/javascript">
		var fnPrint = function() {
			document.body.innerHTML = selectArea.innerHTML;
			window.print();
		};
	</script>
<body>
<!-- 제외될 영역--> 
<center>
<input type="button" value="인쇄" onClick="fnPrint()" /> 
<input type="button" value="돌아가기" onclick="javascript:location='stMenu.khcu'">
</center>
<!-- 인쇄될 영역--> 
<ul id="selectArea">
	<br/><br/><br/><br/>
	<table width="80%" align="center">
		<tr>
			<td width="80%">[은행용]</td>
		</tr>
	</table>
	<table width="80%" border="1" align="center">
		<tr>
			<td colspan="4" width="80%" align="center"><h3>납 입 고 지 서</h3></td>
		</tr>
		<tr>
			<td colspan="4" width="80%">${dto.year }학년도 ${dto.semester }학기 납입금</td>
		</tr>
		<tr>
			<td width="20%">대학</td>
			<td width="20%">${dto.college }</td>
			<td width="20%">학과</td>
			<td width="20%">${dto.major }</td>
		</tr>
		<tr>
			<td width="20%">학년</td>
			<td width="20%">${sto.stgrade }</td>
			<td width="20%">학번</td>
			<td width="20%">${sto.studentnum }</td>
		</tr>
		<tr>
			<td width="20%">성명</td>
			<td colspan="3" width="60%">${sto.stname }</td>
		</tr>
	</table>
	<table width="80%" border="1" align="center">
		<tr>
			<td width="20%">구분</td>
			<td width="60%">등록금 내역</td>
		</tr>
		<tr>
			<td width="20%">등록금</td>
			<td width="60%">${dto.money }</td>
		</tr>
	</table>
	<br/><br/>
	<table border="0" width="80%" align="center">
		<tr>
			<td width="20%">납부기간:</td>
			<td width="60%">2016년02월07일 ~ 2016년02월09일</td>
		</tr>
		<tr>
			<td width="20%">납부장소:</td>
			<td width="60%">하나은행, 농협 전국 각 지점</td>
		</tr>
	</table>
	<br/><br/>
	<table border="0" width="80%" align="center">
		<tr>
			<td colspan="2" width="80%"><p>*등록금 이체용 개인별 가상계좌번호</p></td>
		</tr>
		<tr>
			<td width="20%">하나은행</td>
			<td width="60%">354684645664(KH대학)</td>
		</tr>
		<tr>
			<td width="20%">농협중앙회</td>
			<td width="60%">6546848845644(KH대학)</td>
		</tr>
	</table>
	<br/><br/><br/><br/>
	<table border="0" width="80%" align="center">
		<tr>
			<td align="center">${dTime }</td>
		</tr>
	</table>
	<br/><br/><br/><br/>
	<table border="0" width="80%" align="center">
		<tr>
			<th><h1>KH사이버 대학교 수입징수관</h1></th>
		</tr>
	</table>
	<br/><br/><br/><br/><br/><br/><br/><br/>
	
	
	<hr style="color:#999999;border-style:dotted">
	
	
	<br/><br/><br/><br/><br/><br/><br/><br/>
	<table width="80%" align="center">
		<tr>
			<td width="80%">[학생용]</td>
		</tr>
	</table>
	<table width="80%" border="1" align="center">
		<tr>
			<td colspan="4" width="80%" align="center"><h3>영 수 증 서</h3></td>
		</tr>
		<tr>
			<td colspan="4" width="80%">${dto.year }학년도 ${dto.semester }학기 납입금</td>
		</tr>
		<tr>
			<td width="20%">대학</td>
			<td width="20%">${dto.college }</td>
			<td width="20%">학과</td>
			<td width="20%">${dto.major }</td>
		</tr>
		<tr>
			<td width="20%">학년</td>
			<td width="20%">${sto.stgrade }</td>
			<td width="20%">학번</td>
			<td width="20%">${sto.studentnum }</td>
		</tr>
		<tr>
			<td width="20%">성명</td>
			<td colspan="3" width="60%">${sto.stname }</td>
		</tr>
	</table>
	<table width="80%" border="1" align="center">
		<tr>
			<td width="20%">구분</td>
			<td width="60%">등록금 내역</td>
		</tr>
		<tr>
			<td width="20%">등록금</td>
			<td width="60%">${dto.money }</td>
		</tr>
	</table>
	<br/><br/>
	<table border="0" width="80%" align="center">
		<tr>
			<td width="80%"><p>*위 금액을 영수하였기에 통지합니다.</p></td>
		</tr>
	</table>
	<br/><br/><br/><br/><br/><br/><br/><br/>
	<table border="0" width="80%" align="center">
		<tr>
			<td align="center">${dTime }</td>
		</tr>
	</table>
	<br/><br/><br/><br/>
	<table border="0" width="80%" align="center">
		<tr>
			<th><h1>KH사이버 대학교 수입징수관</h1></th>
		</tr>
	</table>
	
</body>
</html>