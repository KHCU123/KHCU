<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>ȸ������_�л�ver.</title>

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

    function createNum(){
    	if(!form1.stcollege.value){
    		alert("�ܰ������� �����ϼ���");
    		return false;
    	}
    	if(!form1.stmajor.value){
    		alert("������ �����ϼ���");
    		return false;
    	}
    	 url = "/KHCU/createNum.khcu?stcollege=" + form1.stcollege.value + "&stmajor=" + form1.stmajor.value +"&studentnum" + form1.studentnum.value ;
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
</head>

<body>
<br><br>

<form method="post" action="/KHCU/stCardInputPro.khcu" name="form1" id="form1" onSubmit="return checkIt()" enctype="multipart/form-data">
  <table border="1" align="center">
    <tr> 
    <td colspan="2" height="39" align="center">
       <font size="+1" ><b>ȸ������_�л�ver.</b></font></td>
    </tr>
    <tr> 
    <td>�ܰ�����</td>
      <td align="center"> 
        <select name="stcollege" id="stcollege">
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
       	<div id="stmajor"></div>
      </td>
    </tr>
    <tr>
       <td>�й�</td><td><input type="text" name="studentnum" readonly/>&nbsp;<input type="button" value="�й�����" onClick="createNum();"></td>
    </tr>
    
    <tr>
       <td>��й�ȣ</td><td><input type="password" name="pw" maxlength="12" size="30"></td>
    </tr>
    
    <tr>
       <td>��й�ȣȮ��</td><td><input type="password" name="pw2" maxlength="12" size="30"></td>
    </tr>
    
     <tr>
       <td>�̸�</td><td><input type="text" name="stname" maxlength="10" size="30"></td>
    </tr>

    <tr> 
    <td>�ֹε�Ϲ�ȣ</td>
      <td align="center"> 
        <input type="text" name="stjumin1" maxlength="6"  size="15">
        -<input type="text" name="stjumin2" maxlength="7"  size="15">
      </td>
    </tr>    
    <tr>
    <td>�ּ�</td> 
      <td align="center"> 
     <input type="text" id="postcode" placeholder="�����ȣ" name="stpostcode" size="12">
   <input type="button" onclick="execDaumPostcode()" value="�����ȣ ã��"><br>
   <input type="text" id="address1" placeholder="�ּ�" name="staddress1" size="30"><br>
   <input type="text" id="address2" placeholder="���ּ�" name="staddress2" size="30">
      </td>
    </tr>
    
    <tr> 
    <td>�ڵ�����ȣ</td>
      <td align="center"> 
        <input type="text" name="stphone" maxlength="11"  size="30">
      </td>
    </tr>
    

    <tr> 
    <td>������</td>
      <td align="center"> 
        <input type="text" name="stminor" maxlength="11"  size="30">
      </td>
    </tr>
    <tr> 
    <td>��������</td>
      <td align="center"> 
        <select name="ststate">
        	<option name="1">����</option>
        	<option name="2">����</option>
        	<option name="3">����</option>
        </select>
      </td>
    </tr>
     <tr> 
    <td>�̼��б�</td>
      <td align="center"> 
        <input type="text" name="stsemester" maxlength="4"  size="10">
      </td>
    </tr>
    <tr> 
    <td>�г�</td>
      <td align="center"> 
        <input type="text" name="stgrade" maxlength="4"  size="10">
      </td>
    </tr>
    <tr>
    <td>�̸����ּ�</td> 
      <td align="center"> 
        <input type="text" name="stemail" maxlength="30"  size="30">
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
          <input type="submit" name="confirm" value="��   ��" >
          <input type="reset" name="reset" value="�ٽ��Է�">

      </td>
    </tr>

  </table>
</form>
</body>

</html>