<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>�л���������_������ver.</title>

<script language="JavaScript">
    
    function checkIt() {
        var userinput = eval("document.userinput");
        
        if(!userinput.pw.value ) {
            alert("��й�ȣ�� �Է��ϼ���");
            return false;
        }
        if(userinput.pw.value != userinput.pw2.value)
        {
            alert("��й�ȣ�� �����ϰ� �Է��ϼ���");
            return false;
        }
       
        if(!userinput.stname.value) {
            alert("�̸��� �Է��ϼ���");
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
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
    $('#stcollege').change(function() {   
            $.ajax({                
                url: "/KHCU/selectbox2.khcu",                
                type: "POST",
                data: $('#form1').serialize(),
                processData: false,                
        
                success: function(data) {   
                	$('#stmajor').html(data)
					return false;
                }, error: function(jqXHR, textStatus, errorThrown) {
                    alert("����");
                }           
            });        
    });   
});
</script>
<script>
	

</script>
</head>

<body>
<br><br>

<form method="post" action="/KHCU/stCardUpdatePro.khcu" name="form1" id="form1" onSubmit="return checkIt()" enctype="multipart/form-data">
  <table border="1" align="center">
    <tr> 
    <td colspan="2" height="39" align="center">
       <font size="+1" ><b>ȸ������_�л�ver.</b></font></td>
    </tr>
    
    <tr>
       <td>�й�</td><td>${dto.studentnum }</td>
    </tr>
    
    <tr>
       <td>��й�ȣ</td><td><input type="password" value="${dto.pw }" name="pw" maxlength="12" size="30"></td>
    </tr>
    
    <tr>
       <td>��й�ȣȮ��</td><td><input type="password" value="${dto.pw }" name="pw2" maxlength="12" size="30"></td>
    </tr>
    
     <tr>
       <td>�̸�</td><td><input type="text" value="${dto.stname }" name="stname" maxlength="10" size="30"></td>
    </tr>

    <tr> 
    <td>�ֹε�Ϲ�ȣ</td>
      <td align="center"> 
      	${dto.stjumin1 } - ${dto.stjumin2 }
      </td>
    </tr>    
    <tr>
    <td>�ּ�</td> 
      <td align="center"> 
     <input type="text" id="postcode" placeholder="�����ȣ" value="${dto.stpostcode }" name="stpostcode" size="12">
   <input type="button" onclick="execDaumPostcode()" value="�����ȣ ã��"><br>
   <input type="text" id="address1" placeholder="�ּ�" value="${dto.staddress1 }" name="staddress1" size="30"><br>
   <input type="text" id="address2" placeholder="���ּ�" value="${dto.staddress2 }" name="staddress2" size="30">
      </td>
    </tr>
    
    <tr> 
    <td>�ڵ�����ȣ</td>
      <td align="center"> 
        <input type="text" value="${dto.stphone }" name="stphone" maxlength="11"  size="30">
      </td>
    </tr>
    
    <tr> 
    <td>�ܰ�����</td>
      <td align="center"> 
        <select name="stcollege" value="${dto.stcollege }" id="stcollege">
            <option value="0">--------------------</option>
            <c:forEach var="colList" items="${colList}" varStatus="i">
            <option value="${colList.colName}">${colList.colName }</option>          
			</c:forEach>
      		</select>
      </td>
    </tr>
    <tr> 
    <td>����</td>
      <td align="center"> 
       	<div id="stmajor" value="${dto.stmajor }"></div>
      </td>
    </tr>
    <tr> 
    <td>������</td>
      <td align="center"> 
        <input type="text" value="${dto.stminor }" name="stminor" maxlength="11"  size="30">
      </td>
    </tr>
    <tr> 
    <td>��������</td>
      <td align="center"> 
        <select value="${dto.ststate }" name="ststate">
        	<option name="1">����</option>
        	<option name="2">����</option>
        	<option name="3">����</option>
        </select>
      </td>
    </tr>
     <tr> 
    <td>�̼��б�</td>
      <td align="center"> 
        <input type="text" value="${dto.stsemester }" name="stsemester" maxlength="4"  size="10">
      </td>
    </tr>
    <tr> 
    <td>�г�</td>
      <td align="center"> 
        <input type="text" value="${dto.stgrade }" name="stgrade" maxlength="4"  size="10">
      </td>
    </tr>
    <tr>
    <td>�̸����ּ�</td> 
      <td align="center"> 
        <input type="text" value="${dto.stemail }" name="stemail" maxlength="30"  size="30">
      </td>
    </tr>
    <td>���̽���</td> 
      <td align="center"> 
        <input type="text" value="${dto.stfacebook }" name="stfacebook" maxlength="50"  size="30">
      </td>
    </tr>
    <tr> 
    <td>����</td>
      <td align="center"> 
        <input type="file" name="stprofile">
      </td>
    </tr>
    <tr>
      <td colspan="2" align="center"> 
      <br>
          <input type="submit" name="confirm" value="��  ��" >
          <input type="reset" name="reset" value="�ٽ��Է�">

      </td>
    </tr>

  </table>
</form>
</body>

</html>