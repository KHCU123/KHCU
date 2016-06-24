<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

     
  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){
    	memoid = window.setInterval('memoCheck()', 5000); //5초마다한번씩 함수를 실행한다..!! 
    });
    function memoCheck(){
    	 $.ajax({
 	        type: "post",
 	        url : "/KHCU/index.khcu",
 	        success: memoOpen,	// 페이지요청 성공시 실행 함수
 	        error: function(jqXHR, textStatus, errorThrown) {
                alert("실패");
            }     	//페이지요청 실패시 실행함수
      	});
    }
    function memoOpen(data){// 요청성공한 페이지정보가 data 변수로 콜백된다.    	  
    	console.log(data.length);  //data.length 는 data의 글자수임.
    	if(data.length > 500 ){
	    	window.open("/KHCU/index.khcu","new message",
	    			"toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500, height=250");
	    	clearInterval(memoid);
    	} 		
    }
    
  </script>
  
 

	 
    