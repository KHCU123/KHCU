<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
		<title>���б� ������ȸ</title>
	</head>
	<body>
	<center>
		<form name="stScore" method="post">
		<table border="1" width="90%" align="center">
				<tr>
					<td colspan="7">�����б� ������ȸ</td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td width="10%" align="center">�й�</td>
					<td width="25%" align="center">${dto.studentnum }</td>
					<td width="15%" align="center">�̸�</td>
					<td width="25%" align="center">${dto.stname }</td>
					<td width="10%" align="center">�г�</td>
					<td width="10%" align="center">${dto.stgrade }</td>
				</tr>
				<tr>
					<td width="10%" align="center">�к�(�а�)</td>
					<td width="25%" align="center">${dto.stmajor }</td>
					<td width="15%" align="center">������</td>
					<td width="25%" align="center">${dto.stminor }</td>
					<td width="10%" align="center">�̼��б�</td>
					<td width="10%" align="center">${dto.stsemester }</td>
				</tr>
				<tr>
					<td width="10%" align="center">��������</td>
					<td width="25%" align="center">${dto.ststate }</td>
					<td width="15%" align="center">�ֹε�Ϲ�ȣ</td>
					<td colspan="4">${dto.stjumin1 }-${dto.stjumin2 }</td>
				</tr>
			</table>
			<hr>
			
			<table border="1" width="90%" align="center">
				<tr>
					<td colspan="6"> ���� �б� ������ȸ </td>
				</tr>
				<tr>
					<td width="20%" align="center">�⵵ �б�</td>
					<td width="15%" align="center">�����ڵ�</td>
					<td width="10%" align="center">������</td>
					<td width="25%" align="center">���Ǹ�</td>
					<td width="5%" align="center">����</td>
					<td width="5%" align="center">����</td>
				</tr>
		<c:forEach var="list" items="${list}">
		
     	      <tr align="center">
        		<td>${list.year}�� - ${list.semester}�б�</td>
        		<td align="center">${list.classcode}</td>
        		<td align="center">${list.proname}</td>
        		<td align="center">${list.classname}</td>
				<td align="center">${list.credit}</td>
        		<td>${list.score }</td>
      	      </tr>
      	</c:forEach>	
      	<table border="0">
      	      <tr>
        		<td height="1" colspan="6"></td>
      	      </tr>
      	      </table>
      


			</table>
			
			<table border="1" width="90%" align="center">
				<tr>
					<td width="15%" align="center">��û����</td>
					<td width="15%" align="center">${thisSemester}</td>
					<td width="15%" align="center">�̼�����</td>
					<td width="15%" align="center">${getSemester }</td>
					<td width="15%" align="center">�������</td>
					<td width="15%" align="center">1.5</td>
				</tr>
			</table>
		</form>
		</center>
	</body>



</html>