<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<center>
<c:if test="${count ==0 }">
<table border="1" bordercolor="d5d5d5" width="700" height="150" cellspacing="0" cellpadding="0">
<tr border="1" bordercolor="d5d5d5">
   <td border="1" bordercolor="d5d5d5" align="center">
	생성된 출석부가 없습니다.
   </td>
</tr>
</table>
</c:if>

<br><br>

${classCode}의 출석부

<br><br>

<c:if test="${count > 0 }">
<table border="1" align="center">
<tr>

	<th align="center" >번호</th>
	<th align="center" >학생이름</th>
	<th align="center" >학년</th>
	<th align="center" >학번</th>
	<th align="center" >1주차</th>
	<th align="center" >2주차</th>
	<th align="center" >3주차</th>
	<th align="center" >4주차</th>
	<th align="center" >5주차</th>
	<th align="center" >6주차</th>
	<th align="center" >7주차</th>
	<th align="center" >8주차</th>
	<th align="center" >9주차</th>
	<th align="center" >10주차</th>
	<th align="center" >11주차</th>
	<th align="center" >12주차</th>
	<th align="center" >13주차</th>
	<th align="center" >14주차</th>
	<th align="center" >15주차</th>
	<th align="center" >16주차</th>	
	<th align="center" width="10">중간</th>
	<th align="center" width="10">기말</th>
	<th align="center" width="10">과제</th>
	<th align="center" width="10">퀴즈</th>
	<th align="center" width="10">총 점</th>
	<th align="center" width="10">버 튼</th>
	
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
 	<td align="center"> <input type="submit" value="수정"/>  </td> 
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
		<a href="attendBookForm.khcu?pageNum=${startPage - 10}">[이전]</a>
	</c:if>
	
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<a href="attendBookForm.khcu?pageNum=${i}">${i}</a>
	</c:forEach>
	
	<c:if test="${endPage < pageCount }">
		<a href="attendBookForm.khcu?pageNum=${startPage + 10}">[다음]</a>
	</c:if>
</c:if>
<br/>

<input type="button" value="메인으로" onclick="javascript:location='main.khcu'">

</center>
</body>
    