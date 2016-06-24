<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title> ������ ���� </title>

<script language="JavaScript">

    function checkIt() {
        var userinput = eval("document.userinput");
        
        if(!userinput.pw1.value) {
            alert("��й�ȣ�� �Է��ϼ���");
            return false;
        }
        
        if(userinput.pw1.value != userinput.pw2.value)
        {
            alert("��й�ȣ�� �����ϰ� �Է��ϼ���");
            return false;
        }
        
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

<form method="post" action="staffCardModifyPro.khcu?staffNum=${staffNum}" name="userinput" enctype="multipart/form-data" onSubmit="return checkIt()">
  <table border="1" align="center">
    <tr> 
    <td colspan="2" height="39" align="center">
       <font size="+1" ><b> ������ ���� </b></font></td>
    </tr>
    <tr>
    	<td>�� ��</td>
    	<td>${article.staffDep}</td>
    </tr>
    
    <tr>
       <td>�� ��</td><td>${article.staffNum}</td>
    </tr>
    
    <tr>
       <td>��й�ȣ</td><td><input type="password" id="pw1" name="staffPw" maxlength="12" size="30"></td>
    </tr>
    
    <tr>
       <td>��й�ȣȮ��</td><td><input type="password" id="pw2" maxlength="12" size="30"></td>
    </tr>
    
    <tr>
       <td>�̸�</td><td>${article.staffName}</td>
    </tr>
    
    <tr> 
      <td>�ֹε�Ϲ�ȣ</td>
      <td align="center">${article.staffJumin1} - ${article.staffJumin2}</td>
    </tr>
    
    <tr>
      <td>�ּ�</td> 
      <td align="center"> 
     <input type="text" id="postcode" placeholder="�����ȣ" name="staffPostcode" size="12" value="${article.staffPostcode }">
   	<input type="button" onclick="execDaumPostcode()" value="�����ȣ ã��"><br>
   <input type="text" id="address1" placeholder="�ּ�" name="staffAddress1" size="30" value="${article.staffAddress1 }"><br>
   <input type="text" id="address2" placeholder="���ּ�" name="staffAddress2" size="30" value="${article.staffAddress2 }">
      </td>
    </tr>
    
    <tr> 
      <td>�ڵ�����ȣ</td>
      <td align="center"> 
        <input type="text" name="staffPhone" maxlength="11"  size="30" value="${article.staffPhone}">
      </td>
    </tr>
    
    <tr>
      <td>�̸����ּ�</td> 
      <td align="center"> 
        <input type="text" name="staffEmail" maxlength="11"  size="30" value="${article.staffEmail}">
      </td>
    </tr>
    
    <tr>
    	<td>�������</td>
    	<td>
    		<input type="file" name="staffProfile">
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