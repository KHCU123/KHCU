<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title> ���� ��� </title>

<script language="JavaScript">
	
    function checkIt() {
       
    	var form1 = eval("document.form1");
        if(!form1.pw.value ) {
            alert("��й�ȣ�� �Է��ϼ���");
            return false;
        }
        if(form1.pw.value != form1.pw2.value)
        {
            alert("��й�ȣ�� �����ϰ� �Է��ϼ���");
            return false;
        }
       
        if(!form1.stname.value) {
            alert("�̸��� �Է��ϼ���");
            return false;
        }        
    }
    
    function createNum(){
    	
    	var form1 = eval("document.form1");
    	if(!form1.proCollege.value){
    		alert("�ܰ������� �����ϼ���");
    		return false;
    	}
    	if(!form1.proMajor.value){
    		alert("������ �����ϼ���");
    		return false;
    	}

    	 url = "/KHCU/pfcreateNum.khcu?proCollege=" + form1.proCollege.value + "&proMajor=" + form1.proMajor.value +"&proNum" + form1.proNum.value ;
    	open(url, "confirm", 
        "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
    } 

    
</script>


<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
    $('#proCollege').change(function() {   
            $.ajax({                
                url: "/KHCU/pfselectbox2.khcu",                
                type: "POST",
                data: $('#form1').serialize(),
                processData: false,                
        
                success: function(data) {   
                	$('#proMajor').html(data)
					return false;
                }, error: function(jqXHR, textStatus, errorThrown) {
                    alert("����");
                }           
            });        
    });   
});
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

<form method="post" action="professorCardInputPro.khcu" name="form1" id="form1" onSubmit="return checkIt()">
  <table border="1" align="center">
    <tr> 
    <td colspan="2" height="39" align="center">
       <font size="+1" ><b> ���� ��� </b></font></td>
    </tr>
    <tr> 
    <td>�ܰ�����</td>
      <td align="center"> 
        <select name="proCollege" id="proCollege">
            <option value="">--------------------</option>
            <c:forEach var="colList" items="${colList}" varStatus="i">
            <option value="${colList.colName}">${colList.colName}</option>          
			</c:forEach>
      		</select>
      </td>
    </tr>
    <tr> 
    <td>����</td>
      <td align="center"> 
       	<div id="proMajor"></div>
      </td>
    </tr>
    
    <tr>
       <td>�� ��</td><td><input type="text" name="proNum" readonly/>&nbsp;<input type="button" value="��������" onclick="createNum()"></td>
    </tr>
    <tr>
       <td>�� ��</td><td><input type="text" name="proName" maxlength="10" size="30"></td>
    </tr>
    <tr> 
      <td>�ֹε�Ϲ�ȣ</td>
      <td align="center"> 
        <input type="text" name="proJumin1" maxlength="10"  size="15">
        -<input type="text" name="proJumin2" maxlength="10"  size="15">
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
        <input type="text" name="proPhone" maxlength="11"  size="30">
      </td>
    </tr>
    
    <tr>
      <td>�̸����ּ�</td> 
      <td align="center"> 
        <input type="text" name="proEmail" maxlength="11"  size="30">
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