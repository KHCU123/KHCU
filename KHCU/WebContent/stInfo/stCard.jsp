<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<form method="post" action="/KHCU/stCardPro.khcu">
<table width="80%">
	<tr>
		<th>�л�ī�����</th>
	</tr>
</table> 
<table border="1" width="80%" align="center">
	<tr>
		<td rowspan="5" width="100"><img src="<c:url value="/stInfo/stProfile/${dto.stprofilename}"/>" width="100" height="130"></td>
	<tr>
		<td width="70">�̸�</td>
		<td>${dto.stname }</td>
		<td width="70">�й�</td>
		<td>${dto.studentnum }</td>
	</tr>
	<tr>
		<td width="70">����</td>
		<td>${dto.stcollege }</td>
		<td width="70">�а�</td>
		<td>${dto.stmajor }</td>
	</tr>
	<tr>
		<td width="70">����</td>
		<td>${dto.stminor }</td>
		<td width="70">�г�</td>
		<td>${dto.stgrade }</td>
	</tr>
	<tr>
		<td width="70">�б�</td>
		<td>${dto.stsemester }</td>
		<td width="70">�ֹι�ȣ</td>
		<td>${dto.stjumin1 } - ${dto.stjumin2 }</td>
	</tr>
</table><br/><br/>
<table border="1" width="80%" align="center">
	<tr>
		<td width="80">��������</td>
		<td width="100">${dto.ststate }
			<select name="ststate">
        		<option name="1">����</option>
        		<option name="2">����</option>
        		<option name="3">����</option>
        	</select>
		</td>
		<td width="80">�޴���</td>
		<td>
			<input type="text" value="${dto.stphone }" name="stphone">
		</td>
		<td width="80">�̸���</td>
		<td>
			<input type="text" value="${dto.stemail }" name="stemail">
		</td>
	</tr>
	<tr>
		<td width="80" rowspan="2">�ּ�</td>
		<td colspan="3"><input type="text" size="30" value="${dto.staddress1 }" name="staddress1"></td>
		<td colspan="3"><input type="text" value="${dto.stpostcode }" name="stpostcode"><input type="button" value="�����ȣã��"></td>
		<tr>
			<td colspan="6"><input type="text" size="80" value="${dto.staddress2 }" name="staddress2"></td>
		</tr>
	<tr>
		<td>���̽���</td>
		<td colspan="6"><input type="text" size="80" value="${dto.stfacebook }" name="stfacebook"></td>
	</tr>
</table>
<center>
<input type="submit" value="����">
</center>
</form>