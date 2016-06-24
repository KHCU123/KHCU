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
            '<td><button class="join">Join</button></td>';
        roomsList.insertBefore(tr, roomsList.firstChild);
        var joinRoomButton = tr.querySelector('.join');
        joinRoomButton.setAttribute('data-broadcaster', room.broadcaster);
        joinRoomButton.setAttribute('data-roomToken', room.broadcaster);
        joinRoomButton.onclick = function() {
            this.disabled = true;
            var broadcaster = this.getAttribute('data-broadcaster');
            var roomToken = this.getAttribute('data-roomToken');
            broadcastUI.joinRoom({
                roomToken: roomToken,
                joinUser: broadcaster
            });
            // 이부분 추가
            broadcastUI.joinRoom({
                roomToken: tr.querySelector('.join').id,
                joinUser: tr.id,
                userName: prompt('Enter your name', 'hello')
            });
            // 여기까지
            hideUnnecessaryStuff();                            
        };
    },
    onNewParticipant: function(numberOfViewers) {
        document.title = 'Viewers: ' + numberOfViewers;
    }
};
function setupNewBroadcastButtonClickHandler() {
    document.getElementById('broadcast-name').disabled = true;
    document.getElementById('setup-new-broadcast').disabled = true;
    alert('강의를 시작합니다.');
    captureUserMedia(function() {
        var shared = 'video';
        if (window.option == 'Only Audio') {
            shared = 'audio';
        }
        if (window.option == 'Screen') {
            shared = 'screen';
        }
        
        broadcastUI.createRoom({
            roomName: (document.getElementById('broadcast-name') || { }).value || 'Anonymous',
            userName: prompt('Enter your name', 'hello'),
            isAudio: shared === 'audio'              
        });
    });
    hideUnnecessaryStuff();
}

//이부분
var startConferencing = document.getElementById('setup-new-broadcast');
if (startConferencing) startConferencing.onclick = setupNewBroadcastButtonClickHandler;
var chatOutput = document.getElementById('chat-output');
// 여기까지

function captureUserMedia(callback) {
    var constraints = null;
    window.option = broadcastingOption ? broadcastingOption.value : '';
    
    if (option != 'Only Audio' && option != 'Screen' && DetectRTC.hasWebcam !== true) {
        alert('웹캠을 연결해주세요.');
    }
    var htmlElement = document.createElement(option === 'Only Audio' ? 'audio' : 'video');
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
if (chatMessage)
    chatMessage.onchange = function() {
	broadcastUI.send(this.value);
        var tr = document.createElement('tr');
        tr.innerHTML =
            '<td style="width:40%;">You:</td>' +
                '<td>' + chatMessage.value + '</td>';

        chatOutput.insertBefore(tr, chatOutput.firstChild);
        chatMessage.value = '';
    };                  
// 여기까지