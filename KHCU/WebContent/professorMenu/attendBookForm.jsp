<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<center>
<c:if test="${count ==0 }">
<table border="1" bordercolor="d5d5d5" width="700" height="150" cellspacing="0" cellpadding="0">
<tr border="1" bordercolor="d5d5d5">
   <td border="1" bordercolor="d5d5d5" align="center">
	������ �⼮�ΰ� �����ϴ�.
   </td>
</tr>
</table>
</c:if>

<br><br>

${classCode}�� �⼮��

<br><br>

<c:if test="${count > 0 }">
<table border="1" align="center">
<tr>

	<th align="center" >��ȣ</th>
	<th align="center" >�л��̸�</th>
	<th align="center" >�г�</th>
	<th align="center" >�й�</th>
	<th align="center" >1����</th>
	<th align="center" >2����</th>
	<th align="center" >3����</th>
	<th align="center" >4����</th>
	<th align="center" >5����</th>
	<th align="center" >6����</th>
	<th align="center" >7����</th>
	<th align="center" >8����</th>
	<th align="center" >9����</th>
	<th align="center" >10����</th>
	<th align="center" >11����</th>
	<th align="center" >12����</th>
	<th align="center" >13����</th>
	<th align="center" >14����</th>
	<th align="center" >15����</th>
	<th align="center" >16����</th>	
	<th align="center" width="10">�߰�</th>
	<th align="center" width="10">�⸻</th>
	<th align="center" width="10">����</th>
	<th align="center" width="10">����</th>
	<th align="center" width="10">�� ��</th>
	<th align="center" width="10">�� ư</th>
	
</tr>

<c:forEach var="article" items="${articleList}">
	<tr height="30">
	<td align="center">
		<c:out value="${number}"/>
		<c:set var="number" value="${number -1 }"/>
	</td>
	
	<form method="post" action="attendBookUpdatePro.khcu">
	 
	 <input type="hidden" value="${classCode}" name="classCode">
 	<td align="center">${article.stName}</td>
 	<td align="center">${article.stGrade}</td>
 	<td align="center">${article.stNum}</td>
 	<input type="hidden" value="${article.stNum}" name="stNum">
 	<td align="center">
 		<select name="w1">
               <c:if test="${article.w1 == 'x'}">
                  <option value="x" selected>x</option>
               </c:if>
               <c:if test="${article.w1 != 'x'}">
                  <option value="x" >x</option>
               </c:if>
               <c:if test="${article.w1 == 'o'}">
                  <option value="o" selected>o</option>
               </c:if>
               <c:if test="${article.w1 != 'o'}">
                  <option value="o" >o</option>
               </c:if>               
		</select>
	</td>
	<td align="center">
 		<select name="w2">
               <c:if test="${article.w2 == 'x'}">
                  <option value="x" selected>x</option>
               </c:if>
               <c:if test="${article.w2 != 'x'}">
                  <option value="x" >x</option>
               </c:if>
               <c:if test="${article.w2 == 'o'}">
                  <option value="o" selected>o</option>
               </c:if>
               <c:if test="${article.w2 != 'o'}">
                  <option value="o" >o</option>
               </c:if>               
		</select>
	</td>
 	<td align="center">
 		<select name="w3">
               <c:if test="${article.w3 == 'x'}">
                  <option value="x" selected>x</option>
               </c:if>
               <c:if test="${article.w3 != 'x'}">
                  <option value="x" >x</option>
               </c:if>
               <c:if test="${article.w3 == 'o'}">
                  <option value="o" selected>o</option>
               </c:if>
               <c:if test="${article.w3 != 'o'}">
                  <option value="o" >o</option>
               </c:if>               
		</select>
	</td>
	<td align="center">
 		<select name="w4">
               <c:if test="${article.w4 == 'x'}">
                  <option value="x" selected>x</option>
               </c:if>
               <c:if test="${article.w4 != 'x'}">
                  <option value="x" >x</option>
               </c:if>
               <c:if test="${article.w4 == 'o'}">
                  <option value="o" selected>o</option>
               </c:if>
               <c:if test="${article.w4 != 'o'}">
                  <option value="o" >o</option>
               </c:if>               
		</select>
	</td>
	<td align="center">
 		<select name="w5">
               <c:if test="${article.w5 == 'x'}">
                  <option value="x" selected>x</option>
               </c:if>
               <c:if test="${article.w5 != 'x'}">
                  <option value="x" >x</option>
               </c:if>
               <c:if test="${article.w5 == 'o'}">
                  <option value="o" selected>o</option>
               </c:if>
               <c:if test="${article.w5 != 'o'}">
                  <option value="o" >o</option>
               </c:if>               
		</select>
	</td>
 	<td align="center">
 		<select name="w6">
               <c:if test="${article.w6 == 'x'}">
                  <option value="x" selected>x</option>
               </c:if>
               <c:if test="${article.w6 != 'x'}">
                  <option value="x" >x</option>
               </c:if>
               <c:if test="${article.w6 == 'o'}">
                  <option value="o" selected>o</option>
               </c:if>
               <c:if test="${article.w6 != 'o'}">
                  <option value="o" >o</option>
               </c:if>               
		</select>
	</td>
	<td align="center">
 		<select name="w7">
               <c:if test="${article.w7 == 'x'}">
                  <option value="x" selected>x</option>
               </c:if>
               <c:if test="${article.w7 != 'x'}">
                  <option value="x" >x</option>
               </c:if>
               <c:if test="${article.w7 == 'o'}">
                  <option value="o" selected>o</option>
               </c:if>
               <c:if test="${article.w7 != 'o'}">
                  <option value="o" >o</option>
               </c:if>               
		</select>
	</td>
 	<td align="center">
 		<select name="w8">
               <c:if test="${article.w8 == 'x'}">
                  <option value="x" selected>x</option>
               </c:if>
               <c:if test="${article.w8 != 'x'}">
                  <option value="x" >x</option>
               </c:if>
               <c:if test="${article.w8 == 'o'}">
                  <option value="o" selected>o</option>
               </c:if>
               <c:if test="${article.w8 != 'o'}">
                  <option value="o" >o</option>
               </c:if>               
		</select>
	</td>
	<td align="center">
 		<select name="w9">
               <c:if test="${article.w9 == 'x'}">
                  <option value="x" selected>x</option>
               </c:if>
               <c:if test="${article.w9 != 'x'}">
                  <option value="x" >x</option>
               </c:if>
               <c:if test="${article.w9 == 'o'}">
                  <option value="o" selected>o</option>
               </c:if>
               <c:if test="${article.w9 != 'o'}">
                  <option value="o" >o</option>
               </c:if>               
		</select>
	</td>
	<td align="center">
 		<select name="w10">
               <c:if test="${article.w10 == 'x'}">
                  <option value="x" selected>x</option>
               </c:if>
               <c:if test="${article.w10 != 'x'}">
                  <option value="x" >x</option>
               </c:if>
               <c:if test="${article.w10 == 'o'}">
                  <option value="o" selected>o</option>
               </c:if>
               <c:if test="${article.w10 != 'o'}">
                  <option value="o" >o</option>
               </c:if>               
		</select>
	</td>
	<td align="center">
 		<select name="w11">
               <c:if test="${article.w11 == 'x'}">
                  <option value="x" selected>x</option>
               </c:if>
               <c:if test="${article.w11 != 'x'}">
                  <option value="x" >x</option>
               </c:if>
               <c:if test="${article.w11 == 'o'}">
                  <option value="o" selected>o</option>
               </c:if>
               <c:if test="${article.w11 != 'o'}">
                  <option value="o" >o</option>
               </c:if>               
		</select>
	</td>
	<td align="center">
 		<select name="w12">
               <c:if test="${article.w12 == 'x'}">
                  <option value="x" selected>x</option>
               </c:if>
               <c:if test="${article.w12 != 'x'}">
                  <option value="x" >x</option>
               </c:if>
               <c:if test="${article.w12 == 'o'}">
                  <option value="o" selected>o</option>
               </c:if>
               <c:if test="${article.w12 != 'o'}">
                  <option value="o" >o</option>
               </c:if>               
		</select>
	</td>
 	<td align="center">
 		<select name="w13">
               <c:if test="${article.w13 == 'x'}">
                  <option value="x" selected>x</option>
               </c:if>
               <c:if test="${article.w13 != 'x'}">
                  <option value="x" >x</option>
               </c:if>
               <c:if test="${article.w13 == 'o'}">
                  <option value="o" selected>o</option>
               </c:if>
               <c:if test="${article.w13 != 'o'}">
                  <option value="o" >o</option>
               </c:if>               
		</select>
	</td>
	<td align="center">
 		<select name="w14">
               <c:if test="${article.w14 == 'x'}">
                  <option value="x" selected>x</option>
               </c:if>
               <c:if test="${article.w14 != 'x'}">
                  <option value="x" >x</option>
               </c:if>
               <c:if test="${article.w14 == 'o'}">
                  <option value="o" selected>o</option>
               </c:if>
               <c:if test="${article.w14 != 'o'}">
                  <option value="o" >o</option>
               </c:if>               
		</select>
	</td>
	<td align="center">
 		<select name="w15">
               <c:if test="${article.w15 == 'x'}">
                  <option value="x" selected>x</option>
               </c:if>
               <c:if test="${article.w15 != 'x'}">
                  <option value="x" >x</option>
               </c:if>
               <c:if test="${article.w15 == 'o'}">
                  <option value="o" selected>o</option>
               </c:if>
               <c:if test="${article.w15 != 'o'}">
                  <option value="o" >o</option>
               </c:if>               
		</select>
	</td>
 	<td align="center">
 		<select name="w16">
               <c:if test="${article.w16 == 'x'}">
                  <option value="x" selected>x</option>
               </c:if>
               <c:if test="${article.w16 != 'x'}">
                  <option value="x" >x</option>
               </c:if>
               <c:if test="${article.w16 == 'o'}">
                  <option value="o" selected>o</option>
               </c:if>
               <c:if test="${article.w16 != 'o'}">
                  <option value="o" >o</option>
               </c:if>               
		</select>
	</td>
 	<td align="center"><input type="text" value="${article.midEx}" name="midEx" width="5%"></td>
 	<td align="center"><input type="text" value="${article.finalEx}" name="finalEx"></td>
 	<td align="center"><input type="text" value="${article.hw}" name="hw"></td>
 	<td align="center"><input type="text" value="${article.quiz}" name="quiz"></td>
 	<td align="center"><input type="text" value="${article.score}" name="score"></td> 	
 	<td align="center"> <input type="submit" value="����"/>  </td> 
   </form>	
 
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
		<a href="attendBookForm.khcu?pageNum=${startPage - 10}">[����]</a>
	</c:if>
	
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<a href="attendBookForm.khcu?pageNum=${i}">${i}</a>
	</c:forEach>
	
	<c:if test="${endPage < pageCount }">
		<a href="attendBookForm.khcu?pageNum=${startPage + 10}">[����]</a>
	</c:if>
</c:if>
<br/>

<input type="button" value="��������" onclick="javascript:location='main.khcu'">

</center>
</body>
    