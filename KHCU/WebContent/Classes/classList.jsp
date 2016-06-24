<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
    
<script>
    function openPlanner(classCode) {

        url = "classPlanner.khcu?classCode="+ classCode;
        
        // ���ο� �����츦 ���ϴ�.
        open(url, "confirm", 
        "toolbar=no, location=no,status=no,menubar=no,resizable=no,width=300, height=300");
    }   
    
    function updateAlert(){
    	alert("���� ���� ������ �Ϸ�Ǿ����ϴ�.");
    	opener.location.reload;
    }
</script>


<c:if test="${count == 0 }">
<table border="1" bordercolor="d5d5d5" width="700" height="150" cellspacing="0" cellpadding="0">
<tr border="1" bordercolor="d5d5d5">
   <td border="1" bordercolor="d5d5d5" align="center">
	��û�� ���ǰ� �����ϴ�.
   </td>
</tr>
</table>
</c:if>


<c:if test="${count > 0 }">
<table border="1" align="center">
<tr >
	<th align="center" >��ȣ</th>
	<th align="center" >���Ǹ�</th>
	<th align="center" >������</th>
	<th align="center" >�б�</th>
	<th align="center" >����</th>
	<th align="center" >���� ����</th>
	<th align="center" >���������ο�</th>
	<th align="center" >���ǰ�ȹ��</th>
	<th align="center" >���� ����</th>
	
</tr>

<c:forEach var="article" items="${articleList}">
	<tr height="30">
	<td align="center" width="50">
		<c:out value="${number}"/>
		<c:set var="number" value="${number -1 }"/>
	</td>
 	<td align="center">${article.className}</td>
 	<td align="center">${article.pfName}</td>
 	<td align="center">${article.semester}</td>
 	<td align="center">${article.credit}</td>
 	<td align="center">
 	<c:if test="${article.classType==1}">
 		���̺갭��
 	</c:if>
 	<c:if test="${article.classType==2}">
 		��ȭ����
 	</c:if> 	
 	</td>
 	<td align="center">${article.maxNum}</td>
 	<td align="center"><a href="/KHCU/classPlanner.khcu?classCode=${article.classCode}">���ǰ�ȹ��</a></td>
 	<td align="center">
 	<form method="post" action="classStateUpdatePro.khcu" onsubmit="updateAlert()">
 	  <input type="hidden" name="classCode" value="${article.classCode}">
 	<select name="state">
               <c:if test="${article.state == '�����'}">
                  <option value="�����" selected>�����</option>
               </c:if>
               <c:if test="${article.state != '�����'}">
                  <option value="�����" >�����</option>
               </c:if>
               <c:if test="${article.state == '�����Ϸ�'}">
                  <option value="�����Ϸ�" selected>�����Ϸ�</option>
               </c:if>
               <c:if test="${article.state != '�����Ϸ�'}">
                  <option value="�����Ϸ�" >�����Ϸ�</option>
               </c:if>
               <c:if test="${article.state == '��������'}">
                  <option value="��������" selected>��������</option>
               </c:if>
               <c:if test="${article.state != '��������'}">
                  <option value="��������" >��������</option>
               </c:if>
            </select> <br>
          
            <input type="submit" value="����"/>
            </form>
            </td> 	
 
</tr>
</c:forEach>
</table>


<br>
	<c:set var="pageCount" value="${count / pageSize + (count % pageSize == 0 ? 0 : 1) }"/>
	<c:set var="pageBlock" value="${10 }"/>
	<fmt:parseNumber var="result" value="${currentPage/10 }" integerOnly="true"/>
	<c:set var="startPage" value="${result * 10 + 1 }"/>
	<c:set var="endPage" value="${startPage + pageBlock -1 }"/>
	<c:if test="${endPage > pageCount }">
		<c:set var="endPage" value="${pageCount }"/>
	</c:if>
	
	<c:if test="${startPage > 10 }">
		<a href="classList.khcu?pageNum=${startPage - 10}">[����]</a>
	</c:if>
	
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<a href="classList.khcu?pageNum=${i}">${i}</a>
	</c:forEach>
	
	<c:if test="${endPage < pageCount }">
		<a href="classList.khcu?pageNum=${startPage + 10}">[����]</a>
	</c:if>
</c:if>
<br/>

<input type="button" value="��������" onclick="javascript:location='main.khcu'">

</center>
</body>  
    