<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<center>
<c:if test="${check == 1}">
	<b> ${findName}���� �й�(���̵�)�� ${findNum} �Դϴ�.</b><br>
	<input type="button" value="�α��� ������ �̵�" onclick="javascipt:location='main.khcu'"> &nbsp;
	<input type="button" value="��й�ȣ ã��" onclick="javascript:location='findPwForm.khcu'">
</c:if>
<c:if test="${check == 0}">
	<script>
		alert("�Է��Ͻ� ������ Ȯ�����ּ���");
		history.go(-1);
	</script>
</c:if>