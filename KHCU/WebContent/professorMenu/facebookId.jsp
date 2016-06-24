<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<script>
  // This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // response ��ü�� ���� �α��� ���¸� ��Ÿ���� ������ �����ش�. 
    // �ۿ��� ������ �α��� ���¿� ���� �����ϸ� �ȴ�.
    // FB.getLoginStatus().�� ���۷������� �� �ڼ��� ������ ���� �����ϴ�.
    if (response.status === 'connected') {
      // ���̽����� ���ؼ� �α����� �Ǿ��ִ�.      
      testAPI();
    } else if (response.status === 'not_authorized') {
      // ���̽��Ͽ��� �α��� ������, �ۿ��� �α����� �Ǿ����� �ʴ�.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    } else {
      // ���̽��Ͽ� �α����� �Ǿ����� �ʴ�. ����, �ۿ� �α����� �Ǿ��ִ��� ���ΰ� ��Ȯ���ϴ�.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into Facebook.';
    }
  }

  // �� �Լ��� �������� �α��� ��ư�� ���� ó���� ������ �� ȣ��ȴ�.
  // onlogin �ڵ鷯�� �Ʒ��� ���� ÷���ϸ� �ȴ�.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '262251357498412',
    cookie     : true,  // ��Ű�� ������ ������ �� �ֵ��� ���
    xfbml      : true,  // �Ҽ� �÷������� ������ ó��
    version    : 'v2.1' // ���� 2.1 ���
  });

  // �ڹٽ�ũ��Ʈ SDK�� �ʱ�ȭ ������, FB.getLoginStatus()�� ȣ���Ѵ�.
  //.�� �Լ��� �� �������� ����ڰ� ���� �α��� �Ǿ��ִ� ���� 3���� �� �ϳ��� �ݹ鿡 �����Ѵ�.
  // �� 3���� ���´� �Ʒ��� ����.
  // 1. �۰� ���̽��Ͽ� �α��� �Ǿ��ִ�. ('connected')
  // 2. ���̽��Ͽ� �α��εǾ�������, �ۿ��� �α����� �Ǿ����� �ʴ�. ('not_authorized')
  // 3. ���̽��Ͽ� �α����� �Ǿ����� �ʾƼ� �ۿ� �α����� �Ǿ����� ��Ȯ���ϴ�.
  //
  // ������ ������ �ݹ� �Լ��� �� 3������ �ٷ絵�� �Ǿ��ִ�.

    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });

  };

  // SDK�� �񵿱������� ȣ��
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // �α����� ������ �������� ������ �׷���API�� ȣ���Ѵ�.
  // �� ȣ���� statusChangeCallback()���� �̷������.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
//      console.log('Successful login for: ' + response.name);
//      document.getElementById('status').innerHTML =
//        'Thanks for logging in, ' + response.id + '!';

    	window.location.href = '/KHCU/facebookIdPro.khcu?fbid=' + response.id ; 
    });
  }
</script>

<!--
  �Ʒ��� �Ҽ� �÷��������� �α��� ��ư�� �ִ´�.
  �� ��ư�� �ڹٽ�ũ��Ʈ SDK�� �׷��� ����� �α��� ��ư�� �־ Ŭ���� FB.login() �Լ��� �����ϰ� �ȴ�.
-->

<fb:login-button scope="public_profile,email" data-auto-logout-link="true" onlogin="checkLoginState();">
</fb:login-button>

<div id="status" />



</body>
</html>