<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<title> ���� </title>
	<script>
	    function HwSubmit(){
	    	var num = ${article.num};
	    	var pageNum = ${pageNum};
	    	var classcode = ${classcode};
			var type = document.getElementById('type');
	    	 url = "crHwSubmitForm.khcu?num="+num+"&pageNum="+pageNum+"&classcode="+classcode+"&type=";
	    	open(url, "confirm", 
	        "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=900, height=500");
    	}
	    function HwSubmitList(){
	    	var classcode = ${classcode};
			var type = document.getElementById('type');
	    	 url = "crHwSubmitList.khcu?classcode="+classcode;
	    	open(url, "confirm", 
	        "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=900, height=500");
	    }
</script>
</head>

<body>
<center><b> ���� </b>
<br>

<form name="form1" method="post">
<input type="hidden" id="type" value="${article.type }"/>
<table width="700" border="1" cellspacing="0" cellpadding="5"  align="center">  
	<tr height="30">
		<td align="center" width="100">�۹�ȣ</td>
		<td align="center" width="100" align="center">${article.num}</td>
		<td align="center" width="100">��ȸ��</td>
		<td align="center" width="100" align="center">${article.readcount}</td>
	</tr>
	<tr height="30">
		<td align="center" width="100">�ۼ���¥</td>
		<td align="center" width="300" align="center">
			<fmt:formatDate value="${article.reg_date}" type="both"  pattern="yyyy-MM-dd"/>
		</td>
		<td align="center" width="100">��������</td>
		<td align="center" width="300">${article.type}</td>
	</tr>

	<tr>
		<td align="center" width="100">���� ������</td>
		<td align="center" width="300" colspan="3">
			${article.end_date}
		</td>
	</tr>
	<tr height="30">
		<td align="center" width="100">����</td>
		<td align="center" width="300" colspan="3">${article.title}</td>
	</tr>
	<c:if test="${id==2}">
	<tr height="30">
		<td align="center" width="100">������ ��</td>
		<td align="center" width="300" colspan="3">asdfasdf / 40</td>
	</tr>
	</c:if>
	<tr>
		<td align="left" width="400" colspan="4" height="200"><pre>${article.content}</pre></td>
	</tr>
	<tr>
		<td align="center" width="100">������</td>
		<td align="center" width="400" colspan="3">
		<a href="http://localhost:8080/KHCU/crHwContentDown.khcu?reference_name=${article.reference_name }">${article.reference_name }</a>
		</td>
	</tr>
	<tr height="30">      
		<td colspan="4" align="right">
			<c:if test="${id==3}">
			<input type="button" value="�����ϱ�" onclick="HwSubmit()">
			&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:if test="${id==2 }">
			<input type="button" value="������ Ȯ��" onclick="HwSubmitList()">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="����"
				onclick="document.location.href='crHwModifyForm.khcu?num=${article.num}&pageNum=${pageNum}&classcode=${classcode}'">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="����"
				onclick="document.location.href='crHwDeletePro.khcu?num=${article.num}&pageNum=${pageNum}&classcode=${classcode}'">
			&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
			<input type="button" value="���" onclick="document.location.href='crHwList.khcu?pageNum=${pageNum}&classcode=${classcode}'">
		</td>
	</tr>
</table>
</form>

</center>
</body>
</html>