<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Footer</title>
</head>
<style>
#footer
{
	height: 30px;  /* ���� �޴��� ���� */
	width: 900px;  /* ���� �޴��� ���� */
    margin-left: auto;
    margin-right: auto;
}
#footer ul {           /* ���� �޴� ���� ul�� ������: �����޴��� ul+���� �޴��� ul */
    list-style-type: none;  /* ���� �޴� ���� ul ������ ��� ǥ�ø� ������ */
    margin: 0px;            /* ���� �޴� ���� ul�� margin�� ���� */
    padding: 0px;           /* ���� �޴� ���� ul�� padding�� ���� */
}
#footer ul li {            /* ���� �޴� �ȿ� ul �±� �ȿ� �ִ� li �±��� ��Ÿ�� ����(����/�����޴� ���) */
    color: block;               /* �۾� ���� ȸ������ ���� */
    float: left;                /* �������� �����ǵ��� ���� */
    line-height: 30px;          /* �ؽ�Ʈ �� ���� ���̸� 30px�� ���� */
    vertical-align: middle;     /* ���� ������ ����� ���� */
    text-align: center;         /* �ؽ�Ʈ�� ����� ���� */
   	position: relative; 
	top: 150px;
}
.footerli {           /* ���� �޴��� ���� �޴��� a �±׿� �������� ������ ��Ÿ�� */
    text-decoration:none;               /* a �±��� �ٹ� ȿ�� ���� */
    display: block;                     /* a �±��� Ŭ�� ������ ���� */
    font-size: 11px;                    /* ��Ʈ ����� 12px�� ���� */
    font-weight: bold;                  /* ��Ʈ�� ���� ���� */
    font-family: "Arial Hebrew", "����"; /* �⺻ ��Ʈ�� ����/�ѱ� ������� ���� */
    color: grey;
}
</style>
<body>
<nav id="footer">
<ul>
<li><img src="/KHCU/view/KKHCU.PNG"></li>
   	<li class="footerli">�ּ� : ����Ư���� ������ ������� 14�� 6 �������� 2F, 3F (T: 1544-9970 / F: 070-8290-2889)</li>
   	<li>&nbsp;|&nbsp;</li>
   	<li><a class="footerli" href="/KHCU/Map/Map.jsp">ã�ƿ��ô±�</a></li>
   	<li>&nbsp;|&nbsp;</li>
   	
	<li><a class="footerli" href="http://www.eclipse.org/" target="_blank">
		<img src="/KHCU/view/eclipse.PNG" style="width:20px;height:20px" border="0"></a></li>
   <li>|</li>
   	<li><a class="footerli" href="http://tomcat.apache.org/" target="_blank">
		<img src="/KHCU/view/tom.PNG" style="width:20px;height:20px" border="0"></a></li>
   <li>|</li>
   	<li><img src="/KHCU/view/or.PNG" style="width:20px;height:20px" border="0"></a></li>
   <li>|</li>
    <li><img src="/KHCU/view/HT.PNG" style="width:20px;height:20px" border="0"></a></li>
</ul>  
</nav>
</body>
</html>