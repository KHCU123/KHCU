<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

</head>
<body>
<form method="post" action="/KHCU/stDropClassPro.khcu">
<center>
<table border="1" width="90%" align="center">
				<tr>
					<td colspan="7">��ü�б� ������ȸ</td>
				</tr>
				<tr>
				</tr>
				<tr>
				<input type="hidden" value="${dto.studentnum }" name="studentnum"/>
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
               <td align="center">�̼�����</td><td align="center">111</td><td align="center">��������</td><td align="center">170</td><td align="center">����</td><td align="center">130.11</td><td align="center">��ü���</td><td align="center">1.2</td>
            </tr>
</table><br/><br/>

			<table border="1" width="90%" align="center">
				<tr>
					<td align="center" colspan="7"> ��ü ������ȸ </td>
				</tr>
				<tr>
					<td width="20%" align="center">�⵵ �б�</td>
					<td width="15%" align="center">�����ڵ�</td>
					<td width="10%" align="center">������</td>
					<td width="25%" align="center">���Ǹ�</td>
					<td width="5%" align="center">����</td>
					<td width="5%" align="center">����</td>
					<td width="10%" align="center">��û</td>
				</tr>
		<c:forEach var="list2" items="${list2}">
			<input type="hidden" name="year" value="${list2.year }"/>
			<input type="hidden" name="semester" value="${list2.semester }"/>
			<input type="hidden" name="classcode" value="${list2.classcode }"/>
			<input type="hidden" name="proname" value="${list2.proname }"/>
			<input type="hidden" name="classname" value="${list2.classname }"/>
			<input type="hidden" name="credit" value="${list2.credit }"/>
			<input type="hidden" name="score" value="${list2.score }"/>
			<input type="hidden" name="major" value="${list2.major }"/>
			
     	      <tr align="center">
        		<td align="center">${list2.year}�� - ${list2.semester}�б�</td>
        		<td align="center">${list2.classcode}</td>
        		<td align="center">${list2.proname}</td>
        		<td align="center">${list2.classname}</td>
				<td align="center">${list2.credit}</td>
        		<td align="center">${list2.score }</td>
        		<c:if test="${list2.state!=check }">
        		<td align="center"><input type="submit" value="�����û"></td></c:if>
        		<c:if test="${list2.state==check }">
        		<td align="center">��û�Ϸ�</td></c:if>
      	      </tr>
      	</c:forEach>	
      	<table border="0">
      	      <tr>
        		<td height="1" colspan="6"></td>
      	      </tr>
      	      </table>
      	</table>
      	
      	<hr>
      	
      	&nbsp
      	<table border="1" width="90%" align="center">
			<tr>
				<td align="center" colspan="7"> ���������û���� </td>
			</tr>
			<c:forEach var="list2" items="${list2}">
			<tr>
					<td width="20%" align="center">�⵵ �б�</td>
					<td width="15%" align="center">�����ڵ�</td>
					<td width="10%" align="center">������</td>
					<td width="25%" align="center">���Ǹ�</td>
					<td width="5%" align="center">����</td>
					<td width="5%" align="center">����</td>
					<td width="10%" align="center">����</td>
				</tr>
     	      <tr align="center">
        		<td align="center">${list2.year}�� - ${list2.semester}�б�</td>
        		<td align="center">${list2.classcode}</td>
        		<td align="center">${list2.proname}</td>
        		<td align="center">${list2.classname}</td>
				<td align="center">${list2.credit}</td>
        		<td align="center">${list2.score }</td>
        		<td align="center">${list2.state }</td>
      	      </tr>
      	</c:forEach>	
			</table>
      	</center>
</form>
</body>
</html>

