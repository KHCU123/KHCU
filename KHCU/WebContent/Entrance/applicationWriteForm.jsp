<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/css/Menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����������</title>
</head>
<style>
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    
}
#customers td, #customers th {
    border: 1px solid #EAEAEA;
    text-align: left;
    padding: 8px;
}
#customers tr:nth-child(even){
	background-color: #FFFFFF
}
#customers tr:hover {
	background-color: #EAEAEA;
}
#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    background-color: #FFFFFF;
    color: white;
}
#customers a{
	text-decoration:none; 
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
}
</style>
<script language="javascript">
  function send()
  {
   var count=0;
   for (i=0; i<document.myform.rhkstla.length; i++ )
   {
    if (document.myform.rhkstla[i].checked==true)
     {
      count++;
     }
   } 
   if (count>3)
   {
    alert("3�������� �����ϼ���");
    for (i=0; i<document.myform.rhkstla.length; i++ )
    {
    document.myform.rhkstla[i].checked=false;
    }
   }
  }
 </script>
<body>
<center><b> ���������� </b>
<table id="customers" border="1" width="900" cellspacing="0" cellpadding="0" align="center">
<tr>
<td width="80" align="center"> ���� </td>
<td width="300"><input type="text" name="title" size="30"> </td>
</tr>
<tr>
<td width="80" align="center"> ������� </td>
  <td>
  <input type="checkbox" name="rhkstla" value="����" onclick="send();">����</input>
  <input type="checkbox" name="rhkstla" value="����" onclick="send();">����</input>
  <input type="text" name="title" size="30">
   (790309�� �ۼ�)
  </td>
</tr>
<tr>
<td width="80" align="center"> ��й�ȣ </td>
<td width="300"><input type="text" name="title" size="30"> </td>
</tr>
<tr>
<td width="80" align="center"> �޴���ȭ </td>
<td>
  <input type="checkbox" name="rhkstla" value="����" onclick="send();">����</input>
  <input type="checkbox" name="rhkstla" value="����" onclick="send();">����</input>
  <input type="text" name="title" size="30">
  (-�����ۼ����ּ���)
  </td>
</tr>
<tr>
<td width="80" align="center"> �����а����� </td>
<td>
  <input type="checkbox" name="rhkstla" value="�����а�" onclick="send();">�����а�</input>
  <input type="checkbox" name="rhkstla" value="���ڱ���" onclick="send();">���ڱ���</input>
  <input type="checkbox" name="rhkstla" value="��ǻ�Ͱ��а�" onclick="send();">��ǻ�Ͱ��а�</input>
  <input type="checkbox" name="rhkstla" value="���а�" onclick="send();">���а�</input>
  <input type="checkbox" name="rhkstla" value="�濵�а�" onclick="send();">�濵�а�</input>
  <br>
  <input type="checkbox" name="rhkstla" value="�����а�" onclick="send();">�����а�</input>
  <input type="checkbox" name="rhkstla" value="��ȸ�����а�" onclick="send();">��ȸ�����а�</input>
  <input type="checkbox" name="rhkstla" value="�������а�" onclick="send();">�������а�</input>
  <input type="checkbox" name="rhkstla" value="�ǿ����ǰ�" onclick="send();">�ǿ����ǰ�</input>
  <input type="checkbox" name="rhkstla" value="�����а�" onclick="send();">�����а�</input>
  <br>
  <input type="checkbox" name="rhkstla" value="�����а�" onclick="send();">�����а�</input>
  <input type="checkbox" name="rhkstla" value="�Ϻ����а�" onclick="send();">�Ϻ����а�</input>
  <input type="checkbox" name="rhkstla" value="�߱����а�" onclick="send();">�߱����а�</input>
  <input type="checkbox" name="rhkstla" value="�����а�" onclick="send();">�����а�</input>
  <input type="checkbox" name="rhkstla" value="���а�" onclick="send();">���а�</input>
  <br>
  <input type="checkbox" name="rhkstla" value="��ǰ������а�" onclick="send();">��ǰ������а�</input>
</td>
</tr>
<tr>
<td width="80" align="center"> �����ڰ� </td>
<td>
<input type="checkbox" name="rhkstla" value="������" onclick="send();">������</input>
  <input type="checkbox" name="rhkstla" value="���λ����" onclick="send();">���λ����</input>
  <input type="checkbox" name="rhkstla" value="������ ��������" onclick="send();">������ ��������</input>
  <input type="checkbox" name="rhkstla" value="����̰�����" onclick="send();">��.���̰�����</input>
  <input type="checkbox" name="rhkstla" value="�����ֺ�" onclick="send();">�����ֺ�</input>
  <br>
  <input type="checkbox" name="rhkstla" value="���οܱ�����輺�������" onclick="send();">���οܱ�����輺�������</input>
  <input type="checkbox" name="rhkstla" value="���������������" onclick="send();">���������������</input>
  <input type="checkbox" name="rhkstla" value="���е�" onclick="send();">���е�</input>
  <input type="checkbox" name="rhkstla" value="�ٹ�ȭ����" onclick="send();">�ٹ�ȭ����</input>
  <br>
  <input type="checkbox" name="rhkstla" value="�ش���׾���" onclick="send();">�ش���׾���</input>
</td>
</tr>
</table>
</center>
<br><br>
<table border="1" width="900" style='border-left:0;border-right:0;border-bottom:0;border-top:0' cellspacing="0" cellpadding="0" align="center">
<tr>
<td> * �����ο��� ���� �а��� ��Ȱ�� ó���Ǿ� ������ �� �����ϴ�. </td>
</tr>
<tr>
<td> * üũ �׸��� �ʼ��Է»����̹Ƿ� ������ �ۼ��� �ֽñ� �ٶ��ϴ�. </td>
</tr>
<tr>
<td> * ������ �ۼ��� ������ �ܰ���� �Ϸ��Ͻ� �����ڵ��� ���� �� ���� ������ �����մϴ�. </td>
</tr>
<br>
<tr>
<td> * �����а�(�ǾƳ�����) �������� �� �о���ȹ �� ��, �������� �ǾƳ뿬�� ���ʼҾ�ɷ��� Ȯ���մϴ�. </td>
</tr>
<tr>
<td> * �Խ��������� ������(�����ҳ�Ÿ ��������, ������ǰ, �����ô� ��ǰ ����. �۰�� �����ϸ� ü���� �� �ϳ����ϰ� ���� �������� ����)�̸�, 
              ������ 4�ܰ迡�� ������������ ���ε��Ͽ� �ֽñ� �ٶ��ϴ�. </td>
</tr>
</table>
<br>
<table align="center">
    <tr>
		<td align="center" colspan="2"> 
			<input type="submit" value="������ ����" OnClick="window.location='entranceList.jsp'">
		</td>
	</tr>
</table>
</body>
</html>