<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>���� ���� ����</title>
  <meta http-equiv="Content-Language" content="ko">
  <meta http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987">
</head>
<body>
<center><b> ���� ���� ���� </b>
<br>
<form method="post" name="CrInputForm" action="crModifyPro.khcu" onsubmit="return writeCheck()" enctype="multipart/form-data">
<table width="400" border="1" cellspacing="0" cellpadding="0"  align="center">
	<tr>
		<td align="right" colspan="2">
			<a href="crListenList.khcu"> ���Ǹ��</a> 
		</td>
	</tr>
	<tr>
		<td width="150" align="center">����</td>
		<td width="250"><input type="text" name="week" value="${dto.week}" readOnly/></td>
	</tr>
	<tr>
		<td width="150" align="center">���ǽ�������</td>
		<td width="250" >  
  			<input type="text" id="startDate" name="startdate" value="${dto.startdate }" onclick="fnPopUpCalendar(startDate,startDate,'yyyymmdd')" class='text_box1'>
  			<script type="text/javascript" src="./calendar.js"></script>
  		</td>
	</tr>
	<tr>
		<td width="150" align="center">������������</td>
		<td width="250" >  
  			<input type="text" id="endDate" name="enddate" value="${dto.enddate }" onclick="fnPopUpCalendar(endDate,endDate,'yyyymmdd')" class='text_box1'>
  			<script type="text/javascript" src="./calendar.js"></script>
  		</td>
	</tr>

	<tr>
		<td width="150" align="center">�����ڵ�</td>
		<td width="250"><input type="text" name="classcode" value="${dto.classcode}" readonly/></td>
	</tr>
	<tr>
		<td width="150" align="center" >�� ��</td>
		<td width="250"><input type="text" name="classtitle" size="50" value="${dto.classtitle }">
	</tr>
	<tr>
		<td width="400" colspan="2"><textarea name="content" rows="13" cols="60">${dto.content}</textarea></td>
	</tr>
	<tr>
		<td width="150" align="center">��������ε�</td>
		<td width="250">
			<input type="file" name="CrVideo" accept=".mp4"/>
			<c:if test="${dto.filename!='0'}"><br/>
			${dto.filename} ������ ��ϵǾ� �ֽ��ϴ�. <br/>
			�ٽ� ���ε��ϸ� ������ ������ �����˴ϴ�.
			</c:if>
		</td>
	</tr>
	<tr>
		<td width="150" align="center">�����ڷ���ε�</td>
		<td width="250">
			<input type="file" name="CrReference"/>
			<c:if test="${dto.referencename!='0'}"><br/>
			${dto.referencename} ������ ��ϵǾ� �ֽ��ϴ�.<br/> 
			�ٽ� ���ε��ϸ� ������ ������ �����˴ϴ�.
			</c:if>
		</td>
	</tr>
	<tr>      
		<td align="center" colspan="2"> 
			<input type="submit" value="����">
			<input type="button" value="���" OnClick="window.location='crListenList.khcu'">
		</td>
	</tr>
</table>

</form>
</center>
</body>
</html>