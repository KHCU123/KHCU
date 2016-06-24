<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title> 쪽지 보내기 </title>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script language="JavaScript">

$(document).ready(function(){
	window.setTimeout('sendAnswer()', 30000); //30초 후 함수 실행 
});

function sendAnswer(){
	 document.form1.action = "/KHCU/memoExamAnswerPro.khcu";
	 document.form1.submit();
	}
    
</script>

</head>

<body>
<br><br>
<center>*30초안에 답변을 작성해주세요*</center>
<form method="post" action="memoExamAnswerPro.khcu" name="form1" id="form1" >
  <table border="1" align="center">
    <tr> 
    <td colspan="4" height="39" align="center">
       <font size="+1" ><b> 쪽지시험 </b></font></td>
    </tr>    
    <tr>
       <td>보내는 사람</td><td><input type="text" name="sender" value="${sessionScope.memId}" size="20"  /></td>
       <td>쪽지 유형</td><td><input type="text" name="memoType" value="exam"  /></td>
    </tr>
    <tr>
       <td>받는 사람</td><td colspan="3"><input type="text" name="addressee" value="${addressee}" size="55"></td>
    </tr>
    <tr>
    	<td>문제</td> <td colspan="3">${question}</td>
    </tr>
    <tr>
    	<td>답변</td> <td colspan="3"><textarea cols="50" rows="4" name="message" id="message"></textarea></td>
    </tr>          
    <tr>
      <td colspan="4" align="center"> 
		  <input type="hidden" name="ref" value="${ref}">
          <input type="reset" name="reset" value="다시입력">
      </td>
    </tr>

  </table>
</form>
</body>
</html>