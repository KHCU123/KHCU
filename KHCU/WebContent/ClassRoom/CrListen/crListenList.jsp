<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title> ���� ��� </title>
</head>

<body>
<center><b> ���� ��� </b>

<a href="/KHCU/crListenRoom.khcu?classcode=${dto.classCode}">������</a>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
	<tr height="30">
		<td align="center" colspan="2"> �� �� </td>
	</tr>
	<tr height="30"> 
		<td align="center"  width="100" >1�� ��</td><td align="center">
		<a href="/KHCU/crListenContentPro.khcu?classcode=${dto.classCode}&week=1">${dto.plan_w1}</a></td>
	</tr>
	<tr height="30">
		<td align="center"  width="100" >2�� ��</td><td align="center">
		<a href="/KHCU/crListenContentPro.khcu?classcode=${dto.classCode}&week=2">${dto.plan_w2}</a></td>
	</tr>
	<tr height="30">
		<td align="center"  width="100" >3�� ��</td><td align="center">
		<a href="/KHCU/crListenContentPro.khcu?classcode=${dto.classCode}&week=3">${dto.plan_w3}</a></td>
	</tr>
	<tr height="30">
		<td align="center"  width="100" >4�� ��</td><td align="center">
		<a href="/KHCU/crListenContentPro.khcu?classcode=${dto.classCode}&week=4">${dto.plan_w4}</a></td>
	</tr>
	<tr height="30"> 
		<td align="center"  width="100" >5�� ��</td><td align="center">
		<a href="/KHCU/crListenContentPro.khcu?classcode=${dto.classCode}&week=5">${dto.plan_w5}</a></td>
	</tr>
	<tr height="30">
		<td align="center"  width="100" >6�� ��</td><td align="center">
		<a href="/KHCU/crListenContentPro.khcu?classcode=${dto.classCode}&week=6">${dto.plan_w6}</a></td>
	</tr>
	<tr height="30">
		<td align="center"  width="100" >7�� ��</td><td align="center">
		<a href="/KHCU/crListenContentPro.khcu?classcode=${dto.classCode}&week=7">${dto.plan_w7}</a></td>
	</tr>
	<tr height="30">
		<td align="center"  width="100" >8�� ��</td><td align="center">
		<a href="/KHCU/crListenContentPro.khcu?classcode=${dto.classCode}&week=8">${dto.plan_w8}</a></td>
	</tr>
	<tr height="30">
		<td align="center"  width="100" >9�� ��</td><td align="center">
		<a href="/KHCU/crListenContentPro.khcu?classcode=${dto.classCode}&week=9">${dto.plan_w9}</a></td>
	</tr>
	<tr height="30">
		<td align="center"  width="100" >10�� ��</td><td align="center">
		<a href="/KHCU/crListenContentPro.khcu?classcode=${dto.classCode}&week=10">${dto.plan_w10}</a></td>
	</tr>
	<tr height="30">
		<td align="center"  width="100" >11�� ��</td><td align="center">
		<a href="/KHCU/crListenContentPro.khcu?classcode=${dto.classCode}&week=11">${dto.plan_w11}</a></td>
	</tr>
	<tr height="30">
		<td align="center"  width="100" >12�� ��</td><td align="center">
		<a href="/KHCU/crListenContentPro.khcu?classcode=${dto.classCode}&week=12">${dto.plan_w12}</a></td>
	</tr>
	<tr height="30">	
		<td align="center"  width="100" >13�� ��</td><td align="center">
		<a href="/KHCU/crListenContentPro.khcu?classcode=${dto.classCode}&week=13">${dto.plan_w13}</a></td>
	</tr>
	<tr height="30">
		<td align="center"  width="100" >14�� ��</td><td align="center">
		<a href="/KHCU/crListenContentPro.khcu?classcode=${dto.classCode}&week=14">${dto.plan_w14}</a></td>
	</tr>
	<tr height="30">
		<td align="center"  width="100" >15�� ��</td><td align="center">
		<a href="/KHCU/crListenContentPro.khcu?classcode=${dto.classCode}&week=15">${dto.plan_w15}</a></td>
	</tr>
	<tr height="30">
		<td align="center"  width="100" >16�� ��</td><td align="center">
		<a href="/KHCU/crListenContentPro.khcu?classcode=${dto.classCode}&week=16">${dto.plan_w16}</a></td>
	</tr>
</table>


</center>
</body>
</html>