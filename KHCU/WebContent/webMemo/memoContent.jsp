<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<script language="JavaScript">
function openMemo(sender,num) {
    url = "memoForm.khcu?addressee="+sender+"&ref="+num;    
    open(url, "confirm","toolbar=no, location=no,status=no,menubar=no,resizable=no,width=550, height=450");    
	}
</script>
    

<table border="1" align="center">   
    <tr> 
    <td colspan="4" align="center">
       <font size="+1" ><b> 일반 쪽지 </b></font></td>
    </tr>        
    <tr>
       <td>보낸사람</td><td>${article.sender}</td>
       <td>보낸시간</td><td><fmt:formatDate value="${article.reg_date}" type="both"  pattern="yyyy-MM-dd"/></td>
    </tr>
    <tr>
    	<td>내용</td> <td colspan="3">${article.message}</td>
    </tr>           
    <tr>
      <td colspan="4" align="center">  
          <input type="button" value="답장보내기" onClick="openMemo('${article.sender}','${article.num}')" >
	  </td>
	</tr>
</table>
