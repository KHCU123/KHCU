<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

     
  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){
    	memoid = window.setInterval('memoCheck()', 5000); //5�ʸ����ѹ��� �Լ��� �����Ѵ�..!! 
    });
    function memoCheck(){
    	 $.ajax({
 	        type: "post",
 	        url : "/KHCU/index.khcu",
 	        success: memoOpen,	// ��������û ������ ���� �Լ�
 	        error: function(jqXHR, textStatus, errorThrown) {
                alert("����");
            }     	//��������û ���н� �����Լ�
      	});
    }
    function memoOpen(data){// ��û������ ������������ data ������ �ݹ�ȴ�.    	  
    	console.log(data.length);  //data.length �� data�� ���ڼ���.
    	if(data.length > 500 ){
	    	window.open("/KHCU/index.khcu","new message",
	    			"toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500, height=250");
	    	clearInterval(memoid);
    	} 		
    }
    
  </script>
  
 

	 
    