<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<html>
<head>
<title>������ �ۼ�</title>
<style>
table{
	font-family:'Rokkitt', serif;
    text-align: center;
}
</style>
</head>
<body>
<form action="/KHCU/crExamInputPro.khcu" name="form1" id="form1" method="post">
<center>
<br/><br/>
<table border="1" width="80%" align="center">
	<tr>
		<td width="20%" align="center">�����ڵ�</td>
		<input type="hidden" name="classCode" value="${classDTO.classCode }">
		<td width="20%">${classDTO.classCode }</td>
		<td width="20%" align="center">���Ǹ�</td>
		<td width="20%">${classDTO.className }</td>
	</tr>
	<tr>
		<td width="20%" align="center">��米��</td>
		<td width="20%">${classDTO.pfName }</td>
		<td width="20%" align="center">����</td>
		<td width="20%">${classDTO.major }</td>
	</tr>
</table>
<br/><br/><br/><br/>
<table border="0" width="90%" align="center">
	<tr>
		<td><select name="examType">
        	<option name="1">�߰����</option>
        	<option name="2">�⸻���</option>
        </select></td>
	</tr>
</table>
<table border="1" width="90%" align="center">
	<tr>
		<td colspan="2" width="20%" align="center">1������</td>
		<td colspan="7" width="70%"><textarea rows="2" cols="70" name="question1"></textarea></td>
	</tr>
	<tr>
		<td width="10%">1��</td><td width="10%"><input type="text" name="answer1_1"></td>
		<td width="10%">2��</td><td width="10%"><input type="text" name="answer1_2"></td>
		<td width="10%">3��</td><td width="10%"><input type="text" name="answer1_3"></td>
		<td width="10%">4��</td><td width="10%"><input type="text" name="answer1_4"></td>
		<td width="10%"><select name="answer1_5">
			<option name="1">0</option>
			<option name="2">1</option>
			<option name="3">2</option>
			<option name="4">3</option>
		</select></td>
	</tr>
</table>
<br/>
<table border="1" width="90%" align="center">
	<tr>
		<td colspan="2" width="20%" align="center">2������</td>
		<td colspan="7" width="70%"><textarea rows="2" cols="70" name="question2"></textarea></td>
	</tr>
	<tr>
		<td width="10%">1��</td><td width="10%"><input type="text" name="answer2_1"></td>
		<td width="10%">2��</td><td width="10%"><input type="text" name="answer2_2"></td>
		<td width="10%">3��</td><td width="10%"><input type="text" name="answer2_3"></td>
		<td width="10%">4��</td><td width="10%"><input type="text" name="answer2_4"></td>
		<td width="10%"><select name="answer2_5">
			<option name="1">0</option>
			<option name="2">1</option>
			<option name="3">2</option>
			<option name="4">3</option>
		</select></td>
	</tr>
</table>
<br/>
<table border="1" width="90%" align="center">
	<tr>
		<td colspan="2" width="20%" align="center">3������</td>
		<td colspan="7" width="70%"><textarea rows="2" cols="70" name="question3"></textarea></td>
	</tr>
	<tr>
		<td width="10%">1��</td><td width="10%"><input type="text" name="answer3_1"></td>
		<td width="10%">2��</td><td width="10%"><input type="text" name="answer3_2"></td>
		<td width="10%">3��</td><td width="10%"><input type="text" name="answer3_3"></td>
		<td width="10%">4��</td><td width="10%"><input type="text" name="answer3_4"></td>
		<td width="10%"><select name="answer3_5">
			<option name="1">0</option>
			<option name="2">1</option>
			<option name="3">2</option>
			<option name="4">3</option>
		</select></td>
	</tr>
</table>
<br/>
<table border="1" width="90%" align="center">
	<tr>
		<td colspan="2" width="20%" align="center">4������</td>
		<td colspan="7" width="70%"><textarea rows="2" cols="70" name="question4"></textarea></td>
	</tr>
	<tr>
		<td width="10%">1��</td><td width="10%"><input type="text" name="answer4_1"></td>
		<td width="10%">2��</td><td width="10%"><input type="text" name="answer4_2"></td>
		<td width="10%">3��</td><td width="10%"><input type="text" name="answer4_3"></td>
		<td width="10%">4��</td><td width="10%"><input type="text" name="answer4_4"></td>
		<td width="10%"><select name="answer4_5">
			<option name="1">0</option>
			<option name="2">1</option>
			<option name="3">2</option>
			<option name="4">3</option>
		</select></td>
	</tr>
</table>
<br/>
<table border="1" width="90%" align="center">
	<tr>
		<td colspan="2" width="20%" align="center">5������</td>
		<td colspan="7" width="70%"><textarea rows="2" cols="70" name="question5"></textarea></td>
	</tr>
	<tr>
		<td width="10%">1��</td><td width="10%"><input type="text" name="answer5_1"></td>
		<td width="10%">2��</td><td width="10%"><input type="text" name="answer5_2"></td>
		<td width="10%">3��</td><td width="10%"><input type="text" name="answer5_3"></td>
		<td width="10%">4��</td><td width="10%"><input type="text" name="answer5_4"></td>
		<td width="10%"><select name="answer5_5">
			<option name="1">0</option>
			<option name="2">1</option>
			<option name="3">2</option>
			<option name="4">3</option>
		</select></td>
	</tr>
</table>
<br/><br/>
<input type="submit" value="Ȯ��">
<input type="reset" name="reset" value="�ٽ��Է�">
</center>
</form>
</body>
</html>