<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<form>
<table width="80%">
	<tr>
		<th>�л�ī�����</th>
		<th align="right"><input type="button" value="����"></th>
	</tr>
</table> 
<table border="1" width="80%" align="center">
	<tr>
		<td rowspan="5" width="100"><img src="/KHCU/img/sam.jpg" width="100" height="130"></td>
	<tr>
		<td width="70">�̸�</td>
		<td>${stName }����ġ</td>
		<td width="70">�й�</td>
		<td>${studentNum }20160520</td>
	</tr>
	<tr>
		<td width="70">����</td>
		<td>${stCollege }KH���б�</td>
		<td width="70">�а�</td>
		<td>${stMajor }IT-�������к�</td>
	</tr>
	<tr>
		<td width="70">����</td>
		<td>${stMinor }��ǻ����������а�</td>
		<td width="70">�г�</td>
		<td>${stGrade }1�г�</td>
	</tr>
	<tr>
		<td width="70">�б�</td>
		<td>${stSemester }1�б�</td>
		<td width="70">�ֹι�ȣ</td>
		<td>${stJumin1 } ${stJumin2 } 970101-*******</td>
	</tr>
</table><br/><br/>
<table border="1" width="80%" align="center">
	<tr>
		<td width="80">��������</td>
		<td>${stState }
			<select>
				<option>������</option>
				<option>������</option>
			</select>
		</td>
		<td width="80">�޴���</td>
		<td>
			<input type="text" value="${stPhone }010-1234-1234">
		</td>
		<td width="80">�̸���</td>
		<td>
			<input type="text" value="${stEmail }acbd@gmail.com">
		</td>
	</tr>
	<tr>
		<td width="80" rowspan="2">�ּ�</td>
		<td colspan="3"><input type="text" size="30" value="${stAddress1 }����Ư���� ������"></td>
		<td colspan="3"><input type="text" value="${stPostcode }1234-1234"><input type="button" value="�����ȣã��"></td>
		<tr>
			<td colspan="6"><input type="text" size="80" value="${stAddress2 }�츮��"></td>
		</tr>
	<tr>
		<td>���̽���</td>
		<td colspan="6"><input type="text" size="80" value="${stAddress2 }https://www.facebook.com/profile.php?id=100008107984203"></td>
	</tr>
	
</table>
</form>
</html>