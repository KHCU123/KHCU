<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script language="JavaScript">

$(document).ready(function(){
	window.setTimeout('openMemo(sender,num,question)', 3000); //3�� �� �Լ� ���� 
});

function openMemo(sender,num,question) {
    url = "memoExamAnswerForm.khcu?addressee="+sender+"&ref="+num+"&question="+question;     
    window.location.replace(url);
	}
    
</script>

 
<c:if test="${newMemoCheck == 0 }">
</c:if>


<c:if test="${newMemoCheck != 0 }">

<c:forEach var="article" items="${articleList}">
<table border="1" align="center">   
    <tr> 
    <td colspan="4" align="center">
       <font size="+1" ><b> ���ο� ���� </b></font></td>
    </tr>        
    <tr>
       <td>�������</td><td>${article.sender}</td>
       <td>��������</td><td>${article.memoType}</td>
    </tr>
    <tr>
    	<td>����</td> <td colspan="3">${article.message}</td>
    </tr>           
    <tr>
      <td colspan="4" align="center">  
          <input type="button" value="���庸����" onClick="openMemo('${article.sender}','${article.num}','${article.message}')" >
	  </td>
	</tr>
</table>
</c:forEach>
</c:if>
