<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title> ��ϱ� ���� ����Ʈ </title>

	<script language="javascript">	
	function checkAllCheckBox(objChkBox){
		 var flag = true;
		 if(typeof objChkBox=="object"){
		 if(objChkBox.length>1){
		  for(var i=0; i<objChkBox.length; i++){
		   if(objChkBox[i].checked==false){ 	// ���õ��� ���� üũ�ڽ��� �ִٸ�
		   flag=false;
		   }
		  }
		  
		  for(var i=0; i<objChkBox.length; i++){
		   if(flag==true){ 						// ��� üũ�ڽ��� ���õǾ��ٸ� ��� ����
		   objChkBox[i].checked=false;
		   }else{
		   objChkBox[i].checked=true;
		   }
		  }
		 }else{
		  objChkBox.checked = ((objChkBox.checked) ? false : true);
		 }
		 }else{
		  alert("checkbox ��ü ����.");
		 }
		}
	
	function check(){
		var message = confirm("���� ��� ó���� �Ͻðڽ��ϱ�?");
		if(message == true){
			alert("���������� ó���Ǿ����ϴ�.");
		}else
			return false;
	}
	</script>
</head>

<body>
<center><b> ��ϱ� ���� ����Ʈ </b>

<c:if test="${count == 0}">
<table width="1000" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">
			��ϱ��� ������ �л��� �����ϴ�.
		</td>
	</tr>
</table>
</c:if>

<c:if test="${count > 0}">
<form name="form1" action="StudentTuitionPayOk.khcu" method="post" onsubmit="return check()">
<table border="1" width="1000" cellpadding="5" cellspacing="0" align="center"> 
	<tr height="30"> 
		<td align="center"  width="50" >��ȣ</td> 
		<td align="center"  width="100" >�й�</td> 
		<td align="center"  width="100" >�̸�</td>
		<td align="center"  width="200" >����</td>		
		<td align="center"  width="200" >�а�</td>	
		<td align="center"  width="50" >�г�</td>	
		<td align="center"  width="50" >�б�</td>	
		<td align="center"  width="100" >�ݾ�</td>
		<td align="center"  width="100" >����</td>
		<td align="center"  width="200" >��¥</td>
		<td align="center"  width="50" > <input type="checkbox" name="chAll" onclick="checkAllCheckBox(form1.ch)"> </td>
	</tr>

	<c:forEach var="article" items="${articleList}">
	<tr height="30">
		<td align="center"  width="50" >
			<c:out value="${number}"/>
			<c:set var="number" value="${number - 1}"/>
		</td>
		<td align="center"  width="100"> ${article.stnum} </td>
		<td align="center"  width="100"> ${article.stname} </td>
		<td align="center"  width="200"> ${article.stcollege} </td>
		<td align="center"  width="200"> ${article.stmajor} </td>
		<td align="center"  width="50"> ${article.stgrade} </td>
		<td align="center"  width="50"> ${article.stsemester} </td>
		<td align="center"  width="100"> ${article.stmoney } </td>
		<td align="center"  width="100"> ${article.state }</td>
		<td align="center"  width="200"> ${article.reg_date }</td>
		<td align="center"  width="50"><input type="checkbox" name="ch" value="${article.stnum }"/></td>
	</tr>
	</c:forEach>
</table>
<br/>
<input type="submit" value="Ȯ��"/> &nbsp; <input type="button" value="��ϱ� ������ ���" onclick="javascript:location='StudentTuitionPayOkList.khcu'"/>
</form>
</c:if>

<br>

<c:if test="${count > 0}">
	<c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
	<c:set var="pageBlock" value="${10}"/>
	<fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
	<c:set var="startPage" value="${result * 10 + 1}" />
	<c:set var="endPage" value="${startPage + pageBlock-1}"/>
	<c:if test="${endPage > pageCount}">
		<c:set var="endPage" value="${pageCount}"/>
	</c:if> 
          
	<c:if test="${startPage > 10}">
		<a href="StudentTuitionPayList.khcu?pageNum=${startPage - 10 }">[����]</a>
	</c:if>

	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="StudentTuitionPayList.khcu?pageNum=${i}">[${i}]</a>
	</c:forEach>

	<c:if test="${endPage < pageCount}">
		<a href="StudentTuitionPayList.khcu?pageNum=${startPage + 10}">[����]</a>
	</c:if>
</c:if>

</center>
</body>
</html>