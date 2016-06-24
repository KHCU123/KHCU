<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach var="article" items="${articleList}">
<form action="modifyClassPlannerPro.khcu" method="post">
<input type="hidden" name="classCode" value="${article.classCode}">
<table border="1" align="center">
    	<tr>
    		<td>교재</td> <td colspan="5"><input type="text" name="plan_book" value="${article.plan_book}"></td>
    	</tr>
    	
    	<tr>
    		<td>강의목표</td> <td colspan="5"><textarea cols="50" rows="4" name="plan_goal">${article.plan_goal }</textarea></td>
    	</tr>
    	
	
    	<tr align="center">
    	<td colspan="6"> 강의 계획서 </td>
    	<tr>
    	
    	<tr>
    		<td>1 주차</td> <td colspan="2"><input type="text" name="plan_w1" value="${article.plan_w1 }"></td> 
    		<td>9 주차</td> <td colspan="2"><input type="text" name="plan_w9" value="${article.plan_w9 }"></td>
    	</tr>
    	
    	<tr>
    		<td>2 주차</td> <td colspan="2"><input type="text" name="plan_w2" value="${article.plan_w2 }"></td> 
    		<td>10 주차</td> <td colspan="2"><input type="text" name="plan_w10" value="${article.plan_w10 }"></td>
    	</tr>
    	
    	<tr>
    		<td>3 주차</td> <td colspan="2"><input type="text" name="plan_w3" value="${article.plan_w3 }"></td> 
    		<td>11 주차</td> <td colspan="2"><input type="text" name="plan_w11" value="${article.plan_w11 }"></td>
    	</tr>
    	
    	<tr>
    		<td>4 주차</td> <td colspan="2"><input type="text" name="plan_w4" value="${article.plan_w4 }"></td> 
    		<td>12 주차</td> <td colspan="2"><input type="text" name="plan_w12" value="${article.plan_w12 }"></td>
    	</tr>
    	
    	<tr>
    		<td>5 주차</td> <td colspan="2"><input type="text" name="plan_w5" value="${article.plan_w5 }"></td> 
    		<td>13 주차</td> <td colspan="2"><input type="text" name="plan_w13" value="${article.plan_w13 }"></td>
    	</tr>
    	
    	<tr>
    		<td>6 주차</td> <td colspan="2"><input type="text" name="plan_w6" value="${article.plan_w6}"></td> 
    		<td>14 주차</td> <td colspan="2"><input type="text" name="plan_w14" value="${article.plan_w14 }"></td>
    	</tr>
    	
    	<tr>
    		<td>7 주차</td> <td colspan="2"><input type="text" name="plan_w7" value="${article.plan_w7 }"></td> 
    		<td>15 주차</td> <td colspan="2"><input type="text" name="plan_w15" value="${article.plan_w15 }"></td>
    	</tr>
    	
    	<tr>
    		<td>8 주차</td> <td colspan="2"><input type="text" name="plan_w8" value="${article.plan_w8}"></td> 
    		<td>16 주차</td> <td colspan="2"><input type="text" name="plan_w16" value="${article.plan_w16 }"></td>
    	</tr> 	
    	
    	
    </table>
    <br>
    <center>
    <input type="submit" value="수정완료">
    <input type="button" value="취소" onclick="javascript:location='classTimeTable.khcu'">
    </center>
    
    </form>

</c:forEach>

    