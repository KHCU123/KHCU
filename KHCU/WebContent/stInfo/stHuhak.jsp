<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<html>
<head>
	<title>�޺��� ����</title>
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
				<td align="center"  colspan="4">���а���</td>
			</tr>
			<tr>
				<td align="center"  width="10%">�̸�</td>
				<td align="center" width="30%">${dto.stname }</td>
				<td align="center"  width="10%">�й�</td>
				<td align="center" width="30%">${dto.studentnum }</td>
			</tr>
			<tr>
				<td align="center"  width="10%">����</td>
				<td align="center" width="30%">${dto.stcollege }</td>
				<td align="center"  width="10%">�а�</td>
				<td align="center" width="30%">${dto.stmajor }</td>
			</tr>
			<tr>
				<td align="center"  width="10%">����</td>
				<td align="center" width="30%">${dto.stminor }</td>
				<td align="center"  width="10%">�г�</td>
				<td align="center" width="30%">${dto.stgrade }</td>
			</tr>
			<tr>
				<td align="center" width="10%">�б�</td>
				<td align="center" width="30%">${dto.stsemester }</td>
				<td align="center" width="10%">�ֹι�ȣ</td>
				<td align="center" width="30%">${dto.stjumin1 } - ${dto.stjumin2 }</td>
			</tr>
			<tr>
				<td align="center" width="10%">��������</td>
				<td align="center" width="30%">
					<select name="type">
						<option value="��������">��������</option>
						<option value="������">������</option>
						<option value="���λ���">���λ���</option>
					</select>
				</td>
				<td align="center" width="10%">�Ⱓ</td>
				<td align="center" width="30%">
					<select name="period">
						<option value="1year">1��</option>
						<option value="2year">2��</option>
					</select>
				</td>
			</tr>
				<td align="center">��û����</td>
				<td align="center" colspan="3"><input type="text" name="reason" size="100"/></td>
			<tr>
				<td align="center" colspan="4"><b>*���� ��û�� �ִ� 2����� �����մϴ�.</b></td>
			</tr>
						<tr>
				<td align="center" colspan="4"><input type="submit" value="��û�ϱ�"/></td>
			</tr>
		</table>
		<br/>
		<hr>
		<br/>
		
		<table border="1" width="80%" align="center">
			<tr>
				<td align="center" colspan="5">���� ��û ��Ȳ</td>
			</tr>
			<tr>
				<td align="center" width="10%">��û��¥</td>
				<td align="center" width="10%">��������</td>
				<td align="center" width="35%">����</td>
				<td align="center" width="20%">��û�Ⱓ</td>
				<td align="center" width="5%">ó������</td>
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
				<td align="center" colspan="3">���н�û</td>
			</tr>
			<c:if test="${check==0 }">
			<tr>
			<td align="center"><input type="button" value="���н�û" onClick="Bokhak();"/></td></tr></c:if>
			<c:if test="${check!=0 }">
			<tr>
				<td align="center">��û</td>
				<td align="center">��û����</td>
				<td align="center">ó������</td>
			</tr>
				<c:forEach var="list2" items="${list2 }">
				<tr>
					<td align="center">���н�û</td>
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