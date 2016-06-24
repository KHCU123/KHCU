<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>강의 내용 수정</title>
  <meta http-equiv="Content-Language" content="ko">
  <meta http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987">
</head>
<body>
<center><b> 강의 내용 수정 </b>
<br>
<form method="post" name="CrInputForm" action="crModifyPro.khcu" onsubmit="return writeCheck()" enctype="multipart/form-data">
<table width="400" border="1" cellspacing="0" cellpadding="0"  align="center">
	<tr>
		<td align="right" colspan="2">
			<a href="crListenList.khcu"> 강의목록</a> 
		</td>
	</tr>
	<tr>
		<td width="150" align="center">주차</td>
		<td width="250"><input type="text" name="week" value="${dto.week}" readOnly/></td>
	</tr>
	<tr>
		<td width="150" align="center">강의시작일자</td>
		<td width="250" >  
  			<input type="text" id="startDate" name="startdate" value="${dto.startdate }" onclick="fnPopUpCalendar(startDate,startDate,'yyyymmdd')" class='text_box1'>
  			<script type="text/javascript" src="./calendar.js"></script>
  		</td>
	</tr>
	<tr>
		<td width="150" align="center">강의종료일자</td>
		<td width="250" >  
  			<input type="text" id="endDate" name="enddate" value="${dto.enddate }" onclick="fnPopUpCalendar(endDate,endDate,'yyyymmdd')" class='text_box1'>
  			<script type="text/javascript" src="./calendar.js"></script>
  		</td>
	</tr>

	<tr>
		<td width="150" align="center">강의코드</td>
		<td width="250"><input type="text" name="classcode" value="${dto.classcode}" readonly/></td>
	</tr>
	<tr>
		<td width="150" align="center" >제 목</td>
		<td width="250"><input type="text" name="classtitle" size="50" value="${dto.classtitle }">
	</tr>
	<tr>
		<td width="400" colspan="2"><textarea name="content" rows="13" cols="60">${dto.content}</textarea></td>
	</tr>
	<tr>
		<td width="150" align="center">동영상업로드</td>
		<td width="250">
			<input type="file" name="CrVideo" accept=".mp4"/>
			<c:if test="${dto.filename!='0'}"><br/>
			${dto.filename} 파일이 등록되어 있습니다. <br/>
			다시 업로드하면 기존의 파일은 삭제됩니다.
			</c:if>
		</td>
	</tr>
	<tr>
		<td width="150" align="center">강의자료업로드</td>
		<td width="250">
			<input type="file" name="CrReference"/>
			<c:if test="${dto.referencename!='0'}"><br/>
			${dto.referencename} 파일이 등록되어 있습니다.<br/> 
			다시 업로드하면 기존의 파일은 삭제됩니다.
			</c:if>
		</td>
	</tr>
	<tr>      
		<td align="center" colspan="2"> 
			<input type="submit" value="수정">
			<input type="button" value="목록" OnClick="window.location='crListenList.khcu'">
		</td>
	</tr>
</table>

</form>
</center>
</body>
</html>