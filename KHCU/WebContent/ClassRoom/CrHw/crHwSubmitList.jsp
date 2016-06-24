<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ������</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function onChange(){
		var hwscore = document.getElementById('hwscore').value;
		document.getElementById('score').innerHTML=
			"<input type='text' id='hwscore' name='hwscore' value="+hwscore+
			" size=1 onkeypress='if(event.keyCode==13) {onUpdate(this.value);}'/>"+"/100";
	}
	
	function onUpdate(hwscore){
		var hwscore = document.getElementById('hwscore').value;
		if(hwscore>100){
			alert("������ 100�� ���Ϸ� �Է����ֽʽÿ�");
			return;
		}else if(hwscore<0){
			alert("������ 0�� �̻����� �Է����ֽʽÿ�");
			return;
		}else{
		document.getElementById('score').innerHTML=
			"<a href='#' id='prescore' onclick='onChange()'>"+hwscore+"/100</a>" +
			"<input type='hidden' id='hwscore' name='hwscore' value='"+hwscore+"'/>";
			form1.action = "crHwSubmitListUpdatePro.khcu";
			form1.submit();
		}

	}

</script>
</head>
<body>
	<form name="form1" method="post">
	<input type="hidden" name="classCode" value="${classCode }"/>
	<table width="80%" border="1"  cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td width="80%" align="center" colspan="5">������</td>
		</tr>
		<tr>
			<td width="20%" align="center">������</td>
			<td width="20%" align="center">${subCount} ��</td>
			<td width="20%" align="center">��������</td>
			<td width="20%" align="center"><font color="red">${nonsubmit} ��</font></td>
			<td width="20%" align="center"></td>
		</tr>
		<tr height="10">
			<td width="80%" colspan="5"></td>
		</tr>
		<tr>
			<td width="15%" align="center">�й�</td>
			<td width="15%" align="center">�л��̸�</td>
			<td width="10%" align="center">���� ����</td>
			<td width="20%" align="center">���� ����</td>
			<td width="20%" align="center">���� ����</td>	
		</tr>
		<c:forEach var="article" items="${articleList}">
		<input type="hidden" name="stNum" value="${article.stNum}"/>
		<input type="hidden" name="type" value="${article.type }"/>
		<tr>
			<td width="15%" align="center">${article.stNum}</td>
			<td width="15%" align="center">${article.stName }</td>
			<td width="10%" align="center">${article.type }</td>
			<c:if test="${article.submit_name!=null}">
			<td width="20%" align="center">
			<a href="http://localhost:8080/KHCU/crHwSubmitDown.khcu?submit_name=${article.submit_name }">
			${article.submit_name}</a></td>
			</c:if>
			<c:if test="${article.submit_name==null }">
			<td width="20%" align="center"><font color="red">������</font></td>
			</c:if>
			<c:if test="${article.submit_name!=null}">
			<td width="20%" align="center">
			<div id="score">
			<a href="#" id="prescore" onclick="onChange()">${article.hwscore }/100</a>
			<input type="hidden" id="hwscore" name="hwscore" value="${article.hwscore }"/>
			</div>
			</c:if>
			<c:if test="${article.submit_name==null }">
			<td width="20%" align="center"><font color="red">������</font></td>
			</c:if>
		</tr>
		</c:forEach>
	</table>
	</form>
</body>

</html>