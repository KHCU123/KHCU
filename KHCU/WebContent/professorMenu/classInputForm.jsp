<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <script>
    function selectTime(userinput) {
    	
    	if (userinput.classType.value == 2) {
            alert("���̺갭�Ǹ� �ð������� �����մϴ�.");
            return;
        }

        // url�� ����� �Է� id�� �����մϴ�.
        url = "classInputForm2.khcu";
        
        // ���ο� �����츦 ���ϴ�.
        open(url, "confirm", 
        "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=200, height=350");
    }
</script>

    
    <center>
    
    <br><br>
    
    <form action="classInputPro.khcu" method="post" name="userinput">

    <table border="1" align="center">
    
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

    		<td>���ǽð�</td> <td colspan="2"><input type="text" name="classTime"></td>
    		<td>����</td> <td colspan="2"><input type="text" name="credit"></td>
    	</tr> 
    	
 
    	
    	<tr>
    		<td>�ִ��ο�</td> <td colspan="2"><input type="text" name="maxNum"></td> <td>�򰡱���</td> <td colspan="2"><input type="text" name="plan_score" placeholder="�߰����/�⸻���/����/����/���"></td>
    	</tr>
    	
    	<tr>
    		<td>�ܰ�����</td> <td colspan="2"><input type="text" name="college"></td> <td>�а�</td> <td colspan="2"><input type="text" name="major"></td>
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
    
   </form>
    
    </center>