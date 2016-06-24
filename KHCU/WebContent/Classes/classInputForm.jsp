<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <script language="JavaScript">
	
    function checkIt() {
       
    	var form1 = eval("document.form1");
        if(!form1.className.value ) {
            alert("���Ǹ��� �Է��ϼ���");
            return false;
        }        
        if(!form1.maxNum.value) {
            alert("�ִ��ο��� �Է��ϼ���");
            return false;
        }    
        if(!form1.plan_score.value) {
            alert("�򰡱����� �Է��ϼ���");
            return false;
        }          

    }
   
    
    function selectTime(form1) {
    	
    	if (form1.classType.value == 2) {
    		document.form1.classTime.value="��ȭ����";
    		self.close();
        }
    	
    	if (form1.classType.value == 1) {
        url = "classInputForm2.khcu";
        open(url, "confirm", 
        "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=200, height=350");
    	}
    }
    
function createNum(){
    	
    	var form1 = eval("document.form1");
    	if(!form1.college.value){
    		alert("�ܰ������� �����ϼ���");
    		return false;
    	}
    	if(!form1.major.value){
    		alert("������ �����ϼ���");
    		return false;
    	}

    	 url = "/KHCU/classcreateNum.khcu?college=" + form1.college.value + "&major=" + form1.major.value +"&classCode" + form1.classCode.value ;
    	open(url, "confirm", 
        "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
    } 
    
    
</script>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
    $('#college').change(function() {   
            $.ajax({                
                url: "/KHCU/Cselectbox2.khcu",                
                type: "POST",
                data: $('#form1').serialize(),
                processData: false,                
        
                success: function(data) {   
                	$('#major').html(data)
					return false;
                }, error: function(jqXHR, textStatus, errorThrown) {
                    alert("����");
                }           
            });        
    });   
});
</script>

    
    <center>
    
    <br><br>
    
    <form action="classInputPro.khcu" method="post" name="form1" id="form1" onSubmit="return checkIt()">

    <table border="1" align="center">
    
    <tr>
    	<td>�����ڵ�</td><td colspan="2"><input type="text" name="classCode" readonly/>&nbsp;<input type="button" value="�����ڵ����" onclick="createNum()"></td>
    	<td>������</td> <td colspan="2">${proDTO.proName}</td>
    	<input type="hidden" name="pfName" value="${proDTO.proName}">
    	<input type="hidden" name="pfNum" value="${proDTO.proNum}">
    	<input type="hidden" name="state" value="�����">
    </tr>
    
    	<tr>
    	
    		<td>���Ǹ�</td> <td colspan="2"><input type="text" name="className"></td>
    		<td>��������</td> <td colspan="2"><select name="classType">
							<option value="1">���̺� ����</option>
							<option value="2">��ȭ ����</option>				
							</select>
						<input type="button" value="���ǽð�����" onclick="selectTime(this.form)">
						</td> 
    		
    	</tr>
    	
    	<tr>
    		<td>�б�</td> <td colspan="2"><select name="semester">
							<option value="1">1�б�</option>
							<option value="2">2�б�</option>				
							</select>
						</td> 

			<td>�г�</td> <td colspan="2"><select name="classGrade">
							<option value="1">1�г�</option>
							<option value="2">2�г�</option>	
							<option value="3">3�г�</option>		
							<option value="4">4�г�</option>			
							</select>
						</td> 
    	</tr>
    
    	<tr>

    		<td>���ǽð�</td> <td colspan="2"><input type="text" name="classTime" placeholder="��ȭ���Ǵ� �ð��Է��� �ʿ� �����ϴ�."></td>

    		<td>����</td> <td colspan="2"><input type="text" name="credit"></td>
    	</tr> 
    	
    	
 
    	
    	<tr>
    		<td>�ִ��ο�</td> <td colspan="2"><input type="text" name="maxNum"></td> 
    		<td>�򰡱���</td> <td colspan="2"><input type="text" name="plan_score" placeholder="�߰����/�⸻���/����/����/���"></td>
    	</tr>
    	
    	<tr>
    		<td>�ܰ�����</td>
		      <td align="center" colspan="2"> 
		        <select name="college" id="college">
		            <option value="">--------------------</option>
		            <c:forEach var="colList" items="${colList}" varStatus="i">
		            <option value="${colList.colName}">${colList.colName}</option>          
					</c:forEach>
		      		</select>
		      </td>
 
		    <td>����</td>
		      <td align="center" colspan="2"> 
		       	<div id="major"></div>
		      </td>
    	</tr>

    	<tr>
    		<td>����</td> <td colspan="5"><input type="text" name="plan_book"></td>
    	</tr>
    	
    	<tr>
    		<td>���Ǹ�ǥ</td> <td colspan="5"><textarea cols="50" rows="4" name="plan_goal"> </textarea></td>
    	</tr>
    	
	
    	<tr align="center">
    	<td colspan="6"> ���� ��ȹ�� </td>
    	<tr>
    	
    	<tr>
    		<td>1 ����</td> <td colspan="2"><input type="text" name="plan_w1"></td> 
    		<td>9 ����</td> <td colspan="2"><input type="text" name="plan_w9"></td>
    	</tr>
    	
    	<tr>
    		<td>2 ����</td> <td colspan="2"><input type="text" name="plan_w2"></td> 
    		<td>10 ����</td> <td colspan="2"><input type="text" name="plan_w10"></td>
    	</tr>
    	
    	<tr>
    		<td>3 ����</td> <td colspan="2"><input type="text" name="plan_w3"></td> 
    		<td>11 ����</td> <td colspan="2"><input type="text" name="plan_w11"></td>
    	</tr>
    	
    	<tr>
    		<td>4 ����</td> <td colspan="2"><input type="text" name="plan_w4"></td> 
    		<td>12 ����</td> <td colspan="2"><input type="text" name="plan_w12"></td>
    	</tr>
    	
    	<tr>
    		<td>5 ����</td> <td colspan="2"><input type="text" name="plan_w5"></td> 
    		<td>13 ����</td> <td colspan="2"><input type="text" name="plan_w13"></td>
    	</tr>
    	
    	<tr>
    		<td>6 ����</td> <td colspan="2"><input type="text" name="plan_w6"></td> 
    		<td>14 ����</td> <td colspan="2"><input type="text" name="plan_w14"></td>
    	</tr>
    	
    	<tr>
    		<td>7 ����</td> <td colspan="2"><input type="text" name="plan_w7"></td> 
    		<td>15 ����</td> <td colspan="2"><input type="text" name="plan_w15"></td>
    	</tr>
    	
    	<tr>
    		<td>8 ����</td> <td colspan="2"><input type="text" name="plan_w8"></td> 
    		<td>16 ����</td> <td colspan="2"><input type="text" name="plan_w16"></td>
    	</tr> 	
    	
    </table>
    	
    	<br>
    	
    	
    	<br>
    	
    
    <input type="submit" value="����">
    
    <input type="button" value="����Ʈ����" onclick="javascript:window.location='classTimeTable.khcu'">
    
   </form>
    
    </center>