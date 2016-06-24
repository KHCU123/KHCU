<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>강의장</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <link rel="author" type="text/html" href="https://plus.google.com/+MuazKhan">
        <meta name="author" content="Muaz Khan">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">   
        <link rel="stylesheet" href="<c:url value="/ClassRoom/CrListen/ListenRoom/crListenRoom.css"/>">
        
        <style>
            audio, video {
                vertical-align: top;
                width: 70%;
            }
            select {
                border: 1px solid #d9d9d9;
                border-radius: 1px;
                height: 50px;
                margin-left: 1em;
                margin-right: -12px;
                padding: 1.1em;
                vertical-align: 6px;
                width: 18%;
            }
		
			p { padding: 1em; }
            li {
                border-bottom: 1px solid rgb(189, 189, 189);
                border-left: 1px solid rgb(189, 189, 189);
                padding: .5em;
            }
            #chat-table blockquote {
                border: 1px dotted gray;
                margin: 1em 5em;
                padding: 1em 2em;
            }
            #chat-table blockquote hr {
                border: 0;
                border-top: 1px dotted #BBA9A9;
                margin: 1em -2em;
            }
             #chat-output div,
			 #file-progress div {
		        border: 0px solid black;
		        border-bottom: 0;
		        padding: .1em .4em;
			 }
			 #chat-output,
		    #file-progress {
		        margin: 0 0 0 .4em;
		        max-height: 8em;
		        overflow: auto;
		    }
        </style>
        <script>
            document.createElement('article');
        </script>
        
        <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		  <script type="text/javascript">
		  
		    $(document).ready(function(){
		    	$('#receiveMessage').hide();
		    	window.setInterval('callAjax()', 3000); //3초마다한번씩 함수를 실행한다..!! 
		    });
		    

		    function callAjax(){
		    	 $.ajax({
		 	        type: "post",
		 	        url : "/KHCU/crListenRoomReceive.khcu?classcode=${classcode}",
		 	        success: test,	// 페이지요청 성공시 실행 함수
		 	        error: whenError	//페이지요청 실패시 실행함수
		      	});
		    }
		    function test(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
		        $('#receiveMessage').html(aaa);	//id가 ajaxReturn인 부분에 넣어라
		    }
		    function whenError(){
		        alert("Error");
		    }

		  </script>
        
        <!-- scripts used for broadcasting -->
        <script src="//cdn.webrtc-experiment.com/firebase.js"> </script> <!-- Signaling -->
        <script src="//cdn.webrtc-experiment.com/RTCPeerConnection-v1.5.js"> </script> <!-- WebRTC simple wrapper -->
        <script src="<c:url value="/ClassRoom/CrListen/ListenRoom/broadcast.js"/>"> </script> <!-- Multi-user connectivity handler -->
            
        <!-- This Library is used to detect WebRTC features -->
        <script src="//cdn.webrtc-experiment.com/DetectRTC.js"></script>

    </head>

    <body>
        <article>
        <c:if test="${id==3 }">
        <div id="receiveMessage"></div>
        </c:if>
			<header style="text-align: center;">
                <h1>
					강의장
                </h1>            
            </header>
            <!-- copy this <section> and next <script> -->
            <section class="experiment">                
                <section>
                	<c:if test="${id==2 }">
                    <center><input type="hidden" id="broadcast-name" value="${classname}">
                    <input type="text" size="1" id="week"/><h5>주차</h5>
                    <button id="setup-new-broadcast" class="setup">강의 시작하기</button>
                    <button id="attend-check" disabled>출석체크</button>
                    <button id="end-broadcast" disabled>강의 종료하기</button></center>
                    </c:if>
                </section>
                <!-- 체크포인트 -->
                <table style="width: 100%;" id="rooms-list"></table>
                
                <!-- local/remote videos container -->
                <div id="videos-container"></div>
              <table style="border-left: 0px solid black; width: 100%;">
	                <tr>
		                <td>
		                <div id="chat-output"></div>
		                <input type="text" id="chat-message" style="font-size: 1.2em;" placeholder="chat message" disabled>
		                </td>
	                </tr>
                </table>
            </section>
            <script language="javaScript">
                var config = {
                    openSocket: function(config) {
                        var channel = config.channel || location.href.replace( /\/|:|#|%|\.|\[|\]/g , '');
                        var socket = new Firebase('https://webrtc.firebaseIO.com/' + channel);
                        socket.channel = channel;
                        socket.on("child_added", function(data) {
                            config.onmessage && config.onmessage(data.val());
                        });
                        socket.send = function(data) {
                            this.push(data);
                        };
                        config.onopen && setTimeout(config.onopen, 1);
                        socket.onDisconnect().remove();
                        return socket;
                    },
                    onRemoteStream: function(htmlElement) {
                        htmlElement.setAttribute('controls', true);
                        videosContainer.insertBefore(htmlElement, videosContainer.firstChild);
                        htmlElement.play();
                        rotateInCircle(htmlElement);
                    },
                    onRoomFound: function(room) {
                        var alreadyExist = document.querySelector('button[data-broadcaster="' + room.broadcaster + '"]');
                        if (alreadyExist) return;
                        if (typeof roomsList === 'undefined') roomsList = document.body;
                        var tr = document.createElement('tr');
                        tr.setAttribute('id', room.broadcaster);
                        tr.innerHTML = '<td><strong>' + room.roomName + '</strong> 강의가 시작되었습니다!</td>' +
                            '<td><button class="join">입장</button></td>';
                        roomsList.insertBefore(tr, roomsList.firstChild);
                        var joinRoomButton = tr.querySelector('.join');
                        joinRoomButton.setAttribute('data-broadcaster', room.broadcaster);
                        joinRoomButton.setAttribute('data-roomToken', room.broadcaster);
                        joinRoomButton.onclick = function() {
                        	$('#receiveMessage').show();
                            this.disabled = true;
                            var broadcaster = this.getAttribute('data-broadcaster');
                            var roomToken = this.getAttribute('data-roomToken');
                            var memId = ${memId};
                         	window.open("/KHCU/crListenRoomPro.khcu?studentnum=${memId}&classcode=${classcode}", "confirm", 
                             "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
                            // 이부분 추가
                            broadcastUI.joinRoom({
                                roomToken: tr.querySelector('.join').id,
                                joinUser: tr.id,
                                userName: memId
                            });
                            // 여기까지
                            hideUnnecessaryStuff();          
                        };
                    },
                    onNewParticipant: function(numberOfViewers) {
                        document.title = 'Viewers: ' + numberOfViewers;
                    },
                    // 이부분
                    onChannelOpened: function(/* channel */) {
                        hideUnnecessaryStuff();
                    },
                    onChannelMessage: function(data) {
                        if (!chatOutput) return;

                        var div = document.createElement('div');
                        div.innerHTML =
                            data.sender + ' : ' + data.message;

                        chatOutput.insertBefore(div, chatOutput.firstChild);
                    }
                    // 여기까지
                };
                function setupNewBroadcastButtonClickHandler() {
                	
                	if(document.getElementById('week').value==""){
                		alert("주차를 입력해주세요");
                		return
                	}
                    document.getElementById('setup-new-broadcast').disabled = true;
                    document.getElementById('end-broadcast').disabled = false;
                    document.getElementById('attend-check').disabled = false;
                    document.getElementById('week').disabled = true;
                    alert('강의를 시작합니다.');
                    captureUserMedia(function() {
                        var shared = 'video';             
                        broadcastUI.createRoom({
                            roomName: (document.getElementById('broadcast-name') || { }).value || 'Anonymous',
                            isAudio: shared === 'audio'              
                        });
                    });
                	window.open("/KHCU/crListenRoomStartPro.khcu?classcode=${classcode}","confirm", 
                    "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
                    hideUnnecessaryStuff();
                }
                
                // 출석체크 보내기
                function attendCheckButtonClickHandler(){
                	window.open("/KHCU/crAttendCheck.khcu?classcode=${classcode}","confirm", 
                    "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=700, height=500");
                }
                
               
               
                // 강의종료 & 출석체크 마무리

                
                //이부분
                var startConferencing = document.getElementById('setup-new-broadcast');
                if (startConferencing) startConferencing.onclick = setupNewBroadcastButtonClickHandler;
                
                var endConferencing = document.getElementById('end-broadcast');
                if (endConferencing) endConferencing.onclick = endBroadcastButtonClickHandler;
                
                var attendCheck = document.getElementById('attend-check');
                if (attendCheck) attendCheck.onclick = attendCheckButtonClickHandler;
                
                var chatOutput = document.getElementById('chat-output');
                
                // 여기까지
                
                function captureUserMedia(callback) {
                    var constraints = null;
                    window.option = broadcastingOption ? broadcastingOption.value : '';
                    
                    if (option != 'Only Audio' && option != 'Screen' && DetectRTC.hasWebcam !== true) {
                        alert('웹캠을 연결해주세요.');
                    }
                    var htmlElement = document.createElement('video');
                    htmlElement.setAttribute('autoplay', true);
                    htmlElement.setAttribute('controls', true);
                    videosContainer.insertBefore(htmlElement, videosContainer.firstChild);
                    var mediaConfig = {
                        video: htmlElement,
                        onsuccess: function(stream) {
                            config.attachStream = stream;
                            callback && callback();
                            htmlElement.setAttribute('muted', true);
                            rotateInCircle(htmlElement);
                        },
                        onerror: function() {
                        	alert('unable to get access to your webcam');
                        }
                    };
                    if (constraints) mediaConfig.constraints = constraints;
                    getUserMedia(mediaConfig);
                }
                var broadcastUI = broadcast(config);
                var videosContainer = document.getElementById('videos-container') || document.body;
                var setupNewBroadcast = document.getElementById('setup-new-broadcast');
                var roomsList = document.getElementById('rooms-list');
                var broadcastingOption = document.getElementById('broadcasting-option');
                if (setupNewBroadcast) setupNewBroadcast.onclick = setupNewBroadcastButtonClickHandler;
                function hideUnnecessaryStuff() {
                    var visibleElements = document.getElementsByClassName('visible'),
                        length = visibleElements.length;
                    for (var i = 0; i < length; i++) {
                        visibleElements[i].style.display = 'none';
                    }
                    // 여기부터
                    var chatTable = document.getElementById('chat-table');
                    if (chatTable) chatTable.style.display = 'block';
                    if (chatOutput) chatOutput.style.display = 'block';
                    if (chatMessage) chatMessage.disabled = false;
                    
                    // 여기까지
                }
                // 여기부터
				var chatMessage = document.getElementById('chat-message');
				var memId = ${memId};
				if (chatMessage)
				    chatMessage.onchange = function() {
				        broadcastUI.send(this.value);
				        var div = document.createElement('div');
				        div.innerHTML =
				           memId +' : ' +
				                chatMessage.value;
				        chatOutput.insertBefore(div, chatOutput.firstChild);
				        chatMessage.value = '';
				    };
				    
	            function endBroadcastButtonClickHandler(){
	               	 var week = document.getElementById("week").value;
	               	 window.open("/KHCU/crListenRoomCheckPro.khcu?classcode=${classcode}&week="+week, "confirm", 
	                    "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
	                	alert("강의를 종료합니다");
				     broadcastUI.send('강의가 종료되었습니다.');
	            }
				    
                // 여기까지
            </script>            
            </article>
        <!-- commits.js is useless for you! It is not part of this WebRTC Experiment. -->
        <script src="//cdn.webrtc-experiment.com/commits.js" async> </script>

    </body>
</html>