<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
   function setId(){
      opener.document.userinput.studentnum.value="${studentnum}";
      opener.document.userinput.studentnum_hidden.value="${studentnum}";
      if('${semester}' == 1){
    	  opener.document.userinput.semester.value="${semester+1}";
      }else if('${semester}' == 2){
    	  opener.document.userinput.semester.value="${semester-1}";  
      }
      self.close();
   }
</script>

<c:if test="${check!=1}">
<table align="center">
   <tr>
      <td align="center"> �Է��Ͻ� �й�(${studentnum})�� �������� �ʽ��ϴ�. <br />
                     �й��� Ȯ���Ͽ� �ٽ� �Է��� �ּ���.
      </td>
   </tr>
   <tr>
      <td>
      <form name="checkForm" action="ScholarStnumCheck.khcu" method="post">
         <input type="text" name="studentnum"/>
         <input type="hidden" name="studentnum_hidden"/>
         <input type="submit" value="Ȯ��" />
      </form>
      </td>
   </tr>
</table>
</c:if>
<c:if test="${check==1}">
<table align="center">
   <tr>
      <td align="center">�Է��Ͻ� �й��� ${studentnum} �Դϴ�.</td>
   </tr>
   <tr>
      <td align="center">
         <input type="button" value="Ȯ��" onclick="setId()" />
      </td>
   </tr>
</table>
</c:if>