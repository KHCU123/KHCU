<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>�ڷ� ���</title>
  <meta http-equiv="Content-Language" content="ko">
  <meta http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987">
</head>
<body>
<center><b> ���� ��� </b>
<br>
<form method="post" name="CrInputForm" action="crInputPro.khcu" onsubmit="return writeCheck()" enctype="multipart/form-data">
<table width="400" border="1" cellspacing="0" cellpadding="0"  align="center">
	<tr>
		<td align="right" colspan="2">
			<a href="crListenList.khcu"> ���Ǹ��</a> 
		</td>
	</tr>
	<tr>
		<td width="150" align="center">����</td>
		<td width="250"><input type="text" name="week" value="${week}" readOnly/></td>
	</tr>
	<tr>
		<td width="150" align="center">���ǽ�������</td>
		<td width="250" >  
  			<input type="text" id="startDate" name="startdate" value="" onclick="fnPopUpCalendar(startDate,startDate,'yyyymmdd')" class='text_box1'>
  			<script type="text/javascript" src="./calendar.js"></script>
  		</td>
	</tr>
	<tr>
		<td width="150" align="center">������������</td>
		<td width="250" >  
  			<input type="text" id="endDate" name="enddate" value="" onclick="fnPopUpCalendar(endDate,endDate,'yyyymmdd')" class='text_box1'>
  			<script type="text/javascript" src="./calendar.js"></script>
  		</td>
	</tr>

	<tr>
		<td width="150" align="center">�����ڵ�</td>
		<td width="250"><input type="text" name="classcode" value="${classcode}" readonly/></td>
	</tr>
	<tr>
		<td width="150" align="center" >�� ��</td>
		<td width="250"><input type="text" name="classtitle" size="50">
	</tr>
	<tr>
		<td width="400" colspan="2"><textarea name="content" rows="13" cols="60"></textarea></td>
	</tr>
	<tr>
		<td width="150" align="center">��������ε�</td>
		<td width="250">
			<input type="file" name="CrVideo" accept=".mp4"/>
		</td>
	</tr>
	<tr>
		<td width="150" align="center">�����ڷ���ε�</td>
		<td width="250">
			<input type="file" name="CrReference"/>
		</td>
	</tr>
	<tr>      
		<td align="center" colspan="2"> 
			<input type="submit" value="�ۼ�">
			<input type="button" value="���" OnClick="window.location='crListenList.khcu'">
		</td>
	</tr>
</table>

</form>
</center>
</body>
</html>