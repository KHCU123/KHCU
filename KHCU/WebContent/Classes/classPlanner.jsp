<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="article" items="${articleList}">

<table border="1" align="center">
    	<tr>
    		<td>����</td> <td colspan="5">${article.plan_book}</td>
    	</tr>
    	
    	<tr>
    		<td>���Ǹ�ǥ</td> <td colspan="5">${article.plan_goal}</td>
    	</tr>
    	
	
    	<tr align="center">
    	<td colspan="6"> ���� ��ȹ�� </td>
    	<tr>
    	
    	<tr>
    		<td>1 ����</td> <td colspan="2">${article.plan_w1}</td> 
    		<td>9 ����</td> <td colspan="2">${article.plan_w9}</td>
    	</tr>
    	
    	<tr>
    		<td>2 ����</td> <td colspan="2">${article.plan_w2}</td> 
    		<td>10 ����</td> <td colspan="2">${article.plan_w10}</td>
    	</tr>
    	
    	<tr>
    		<td>3 ����</td> <td colspan="2">${article.plan_w3}</td> 
    		<td>11 ����</td> <td colspan="2">${article.plan_w11}</td>
    	</tr>
    	
    	<tr>
    		<td>4 ����</td> <td colspan="2">${article.plan_w4}</td> 
    		<td>12 ����</td> <td colspan="2">${article.plan_w12}</td>
    	</tr>
    	
    	<tr>
    		<td>5 ����</td> <td colspan="2">${article.plan_w5}</td> 
    		<td>13 ����</td> <td colspan="2">${article.plan_w13}</td>
    	</tr>
    	
    	<tr>
    		<td>6 ����</td> <td colspan="2">${article.plan_w6}</td> 
    		<td>14 ����</td> <td colspan="2">${article.plan_w14}</td>
    	</tr>
    	
    	<tr>
    		<td>7 ����</td> <td colspan="2">${article.plan_w7}</td> 
    		<td>15 ����</td> <td colspan="2">${article.plan_w15}</td>
    	</tr>
    	
    	<tr>
    		<td>8 ����</td> <td colspan="2">${article.plan_w8}</td> 
    		<td>16 ����</td> <td colspan="2">${article.plan_w16}</td>
    	</tr> 	
    	
    </table>
    <br>
    <center>
    <c:if test="${article.state.equals('�����')}">
    <input type="button" value="�����ϱ�" onclick="javascript:location='modifyClassPlanner.khcu?classCode=${article.classCode}'">
    </c:if>
    </center>

</c:forEach>

    