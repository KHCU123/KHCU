<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title> ������ ��� </title>

<script language="JavaScript">

    function checkIt() {
        var userinput = eval("document.userinput");
        
        if(!userinput.staffName.value) {
            alert("�̸��� �Է��ϼ���");
            return false;
        }
    }
    
    function createNum(){
    	
    	var form1 = eval("document.userinput");
    	if(!form1.staffDep.value){
    		alert("�з��� �����ϼ���");
    		return false;
    	}
    	
    	 url = "/KHCU/staffcreateNum.khcu?staffDep=" + form1.staffDep.value + "&staffNum" + form1.staffNum.value ;
    	open(url, "confirm", 
        "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
    } 
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var fullAddr = ''; // ���� �ּ� ����
                var extraAddr = ''; // ������ �ּ� ����

                // ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    fullAddr = data.roadAddress;

                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    fullAddr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    //���������� ���� ��� �߰��Ѵ�.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� ���� ��� �߰��Ѵ�.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('postcode').value = data.zonecode; //5�ڸ� �������ȣ ���
                document.getElementById('address1').value = fullAddr;

                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById('address2').focus();
            }
        }).open();
    }
</script>
</head>

<body>
<br><br>

<form method="post" action="staffCardInputPro.khcu" name="userinput" onSubmit="return checkIt()">
  <table border="1" align="center">
    <tr> 
    <td colspan="2" height="39" align="center">
       <font size="+1" ><b> ������ ��� </b></font></td>
    </tr>
    <tr>
    	<td>�� ��</td>
    	<td>
    		<select name="staffDep">
	   			<option value="�λ���">�λ���</option>
	   			<option value="�ü���">�ü���</option>
	   			<option value="������">������</option>
			</select>
		</td>
    </tr>
    
    <tr>
       <td>�� ��</td><td><input type="text" name="staffNum" readonly/>&nbsp;<input type="button" value="�������" onclick="createNum()"></td>
    </tr>
    <tr>
       <td>�̸�</td><td><input type="text" name="staffName" maxlength="10" size="30"></td>
    </tr>
    <tr> 
      <td>�ֹε�Ϲ�ȣ</td>
      <td align="center"> 
        <input type="text" name="staffJumin1" maxlength="10"  size="15">
        -<input type="text" name="staffJumin2" maxlength="10"  size="15">
      </td>
    </tr>    
    <tr>
      <td>�ּ�</td> 
      <td align="center"> 
     <input type="text" id="postcode" placeholder="�����ȣ" name="staffPostcode" size="12">
   <input type="button" onclick="execDaumPostcode()" value="�����ȣ ã��"><br>
   <input type="text" id="address1" placeholder="�ּ�" name="staffAddress1" size="30"><br>
   <input type="text" id="address2" placeholder="���ּ�" name="staffAddress2" size="30">
      </td>
    </tr>
    
    <tr> 
      <td>�ڵ�����ȣ</td>
      <td align="center"> 
        <input type="text" name="staffPhone" maxlength="11"  size="30">
      </td>
    </tr>
    
    <tr>
      <td>�̸����ּ�</td> 
      <td align="center"> 
        <input type="text" name="staffEmail" maxlength="11"  size="30">
      </td>
    </tr>
    <tr>
      <td colspan="2" align="center"> 
      <br>
          <input type="submit" name="confirm" value="��   ��" >
          <input type="reset" name="reset" value="�ٽ��Է�">
      </td>
    </tr>

  </table>
</form>
</body>
</html>