<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>��ϱ� ������ ���</title>
</head>
	<script type="text/javascript">
		var fnPrint = function() {
			document.body.innerHTML = selectArea.innerHTML;
			window.print();
		};
	</script>
<body>
<!-- ���ܵ� ����--> 
<center>
<input type="button" value="�μ�" onClick="fnPrint()" /> 
<input type="button" value="���ư���" onclick="javascript:location='stMenu.khcu'">
</center>
<!-- �μ�� ����--> 
<ul id="selectArea">
	<br/><br/><br/><br/>
	<table width="80%" align="center">
		<tr>
			<td width="80%">[�����]</td>
		</tr>
	</table>
	<table width="80%" border="1" align="center">
		<tr>
			<td colspan="4" width="80%" align="center"><h3>�� �� �� �� ��</h3></td>
		</tr>
		<tr>
			<td colspan="4" width="80%">${dto.year }�г⵵ ${dto.semester }�б� ���Ա�</td>
		</tr>
		<tr>
			<td width="20%">����</td>
			<td width="20%">${dto.college }</td>
			<td width="20%">�а�</td>
			<td width="20%">${dto.major }</td>
		</tr>
		<tr>
			<td width="20%">�г�</td>
			<td width="20%">${sto.stgrade }</td>
			<td width="20%">�й�</td>
			<td width="20%">${sto.studentnum }</td>
		</tr>
		<tr>
			<td width="20%">����</td>
			<td colspan="3" width="60%">${sto.stname }</td>
		</tr>
	</table>
	<table width="80%" border="1" align="center">
		<tr>
			<td width="20%">����</td>
			<td width="60%">��ϱ� ����</td>
		</tr>
		<tr>
			<td width="20%">��ϱ�</td>
			<td width="60%">${dto.money }</td>
		</tr>
	</table>
	<br/><br/>
	<table border="0" width="80%" align="center">
		<tr>
			<td width="20%">���αⰣ:</td>
			<td width="60%">2016��02��07�� ~ 2016��02��09��</td>
		</tr>
		<tr>
			<td width="20%">�������:</td>
			<td width="60%">�ϳ�����, ���� ���� �� ����</td>
		</tr>
	</table>
	<br/><br/>
	<table border="0" width="80%" align="center">
		<tr>
			<td colspan="2" width="80%"><p>*��ϱ� ��ü�� ���κ� ������¹�ȣ</p></td>
		</tr>
		<tr>
			<td width="20%">�ϳ�����</td>
			<td width="60%">354684645664(KH����)</td>
		</tr>
		<tr>
			<td width="20%">�����߾�ȸ</td>
			<td width="60%">6546848845644(KH����)</td>
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
			<th><h1>KH���̹� ���б� ����¡����</h1></th>
		</tr>
	</table>
	<br/><br/><br/><br/><br/><br/><br/><br/>
	
	
	<hr style="color:#999999;border-style:dotted">
	
	
	<br/><br/><br/><br/><br/><br/><br/><br/>
	<table width="80%" align="center">
		<tr>
			<td width="80%">[�л���]</td>
		</tr>
	</table>
	<table width="80%" border="1" align="center">
		<tr>
			<td colspan="4" width="80%" align="center"><h3>�� �� �� ��</h3></td>
		</tr>
		<tr>
			<td colspan="4" width="80%">${dto.year }�г⵵ ${dto.semester }�б� ���Ա�</td>
		</tr>
		<tr>
			<td width="20%">����</td>
			<td width="20%">${dto.college }</td>
			<td width="20%">�а�</td>
			<td width="20%">${dto.major }</td>
		</tr>
		<tr>
			<td width="20%">�г�</td>
			<td width="20%">${sto.stgrade }</td>
			<td width="20%">�й�</td>
			<td width="20%">${sto.studentnum }</td>
		</tr>
		<tr>
			<td width="20%">����</td>
			<td colspan="3" width="60%">${sto.stname }</td>
		</tr>
	</table>
	<table width="80%" border="1" align="center">
		<tr>
			<td width="20%">����</td>
			<td width="60%">��ϱ� ����</td>
		</tr>
		<tr>
			<td width="20%">��ϱ�</td>
			<td width="60%">${dto.money }</td>
		</tr>
	</table>
	<br/><br/>
	<table border="0" width="80%" align="center">
		<tr>
			<td width="80%"><p>*�� �ݾ��� �����Ͽ��⿡ �����մϴ�.</p></td>
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
			<th><h1>KH���̹� ���б� ����¡����</h1></th>
		</tr>
	</table>
	
</body>
</html>