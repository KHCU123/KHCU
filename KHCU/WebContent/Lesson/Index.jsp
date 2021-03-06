<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>WebRTC Broadcasting Muaz Khan</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <link rel="author" type="text/html" href="https://plus.google.com/+MuazKhan">
        <meta name="author" content="Muaz Khan">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        
        <link rel="stylesheet" href="//cdn.webrtc-experiment.com/style.css">
        
        <style>
            audio, video {
                -moz-transition: all 1s ease;
                -ms-transition: all 1s ease;
                
                -o-transition: all 1s ease;
                -webkit-transition: all 1s ease;
                transition: all 1s ease;
                vertical-align: top;
                width: 100%;
            }
            input {
                border: 1px solid #d9d9d9;
                border-radius: 1px;
                font-size: 2em;
                margin: .2em;
                width: 30%;
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
            .setup {
                border-bottom-left-radius: 0;
                border-top-left-radius: 0;
                font-size: 102%;
                height: 47px;
                margin-left: -9px;
                margin-top: 8px;
                position: absolute;
            }
            p { padding: 1em; }
            li {
                border-bottom: 1px solid rgb(189, 189, 189);
                border-left: 1px solid rgb(189, 189, 189);
                padding: .5em;
            }
        </style>
        <script>
            document.createElement('article');
            document.createElement('footer');
        </script>
        
        <!-- scripts used for broadcasting -->
        <script src="//cdn.webrtc-experiment.com/firebase.js"> </script> <!-- Signaling -->
        <script src="//cdn.webrtc-experiment.com/RTCPeerConnection-v1.5.js"> </script> <!-- WebRTC simple wrapper -->
        <script src="//cdn.webrtc-experiment.com/webrtc-broadcasting/broadcast.js"> </script> <!-- Multi-user connectivity handler -->
        
        <!-- This Library is used to detect WebRTC features -->
        <script src="//cdn.webrtc-experiment.com/DetectRTC.js"></script>
    </head>

    <body>
        <article>
            <header style="text-align: center;">
                <h1>
                    <a href="https://www.webrtc-experiment.com/">WebRTC</a> 
                    <a href="https://github.com/muaz-khan/WebRTC-Experiment/tree/master/webrtc-broadcasting" target="_blank">Broadcasting</a>
                    ® 
                    <a href="https://github.com/muaz-khan" target="_blank">Muaz Khan</a>
                </h1>            
                <p>
                    <a href="https://www.webrtc-experiment.com/">HOME</a>
                    <span> &copy; </span>
                    <a href="http://www.MuazKhan.com/" target="_blank">Muaz Khan</a>
                    
                    .
                    <a href="http://twitter.com/WebRTCWeb" target="_blank" title="Twitter profile for WebRTC Experiments">@WebRTCWeb</a>
                    
                    .
                    <a href="https://github.com/muaz-khan?tab=repositories" target="_blank" title="Github Profile">Github</a>
                    
                    .
                    <a href="https://github.com/muaz-khan/WebRTC-Experiment/issues?state=open" target="_blank">Latest issues</a>
                    
                    .
                    <a href="https://github.com/muaz-khan/WebRTC-Experiment/commits/master" target="_blank">What's New?</a>
                </p>
            </header>

            <div class="github-stargazers"></div>
        
            <!-- copy this <section> and next <script> -->
            <section class="experiment">                
                <section>
                    <select id="broadcasting-option">
                        <option>Audio + Video</option>
                        <option>Only Audio</option>
                        <option>Screen</option>
                    </select>
                    <input type="text" id="broadcast-name">
                    <button id="setup-new-broadcast" class="setup">Setup New Broadcast</button>
                </section>
                
                <!-- list of all available broadcasting rooms -->
                <table style="width: 100%;" id="rooms-list"></table>
                
                <!-- local/remote videos container -->
                <div id="videos-container"></div>
            </section>
        
            <script>
                // Muaz Khan     - https://github.com/muaz-khan
                // MIT License   - https://www.webrtc-experiment.com/licence/
                // Documentation - https://github.com/muaz-khan/WebRTC-Experiment/tree/master/webrtc-broadcasting
                var config = {
                    openSocket: function(config) {
                        // https://github.com/muaz-khan/WebRTC-Experiment/blob/master/Signaling.md
                        // This method "openSocket" can be defined in HTML page
                        // to use any signaling gateway either XHR-Long-Polling or SIP/XMPP or WebSockets/Socket.io
                        // or WebSync/SignalR or existing implementations like signalmaster/peerserver or sockjs etc.
        
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
                        tr.innerHTML = '<td><strong>' + room.roomName + '</strong> is broadcasting his media!</td>' +
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
                            isAudio: shared === 'audio'
                        });
                    });
                    hideUnnecessaryStuff();
                }
                function captureUserMedia(callback) {
                    var constraints = null;
                    window.option = broadcastingOption ? broadcastingOption.value : '';
                    if (option === 'Only Audio') {
                        constraints = {
                            audio: true,
                            video: false
                        };
                        
                        if(DetectRTC.hasMicrophone !== true) {
                            alert('DetectRTC library is unable to find microphone; maybe you denied microphone access once and it is still denied or maybe microphone device is not attached to your system or another app is using same microphone.');
                        }
                    }
                    if (option === 'Screen') {
                        var video_constraints = {
                            mandatory: {
                                chromeMediaSource: 'screen'
                            },
                            optional: []
                        };
                        constraints = {
                            audio: false,
                            video: video_constraints
                        };
                        
                        if(DetectRTC.isScreenCapturingSupported !== true) {
                           alert('DetectRTC library is unable to find screen capturing support. You MUST run chrome with command line flag "chrome --enable-usermedia-screen-capturing"');
                        }
                    }
                    
                    if (option != 'Only Audio' && option != 'Screen' && DetectRTC.hasWebcam !== true) {
                        alert('DetectRTC library is unable to find webcam; maybe you denied webcam access once and it is still denied or maybe webcam device is not attached to your system or another app is using same webcam.');
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
                            if (option === 'Only Audio') alert('unable to get access to your microphone');
                            else if (option === 'Screen') {
                                if (location.protocol === 'http:') alert('Please test this WebRTC experiment on HTTPS.');
                                else alert('Screen capturing is either denied or not supported. Are you enabled flag: "Enable screen capture support in getUserMedia"?');
                            } else alert('unable to get access to your webcam');
                        }
                    };
                    if (constraints) mediaConfig.constraints = constraints;
                    getUserMedia(mediaConfig);
                }
                var broadcastUI = broadcast(config);
                /* UI specific */
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
                }
                function rotateInCircle(video) {
                    video.style[navigator.mozGetUserMedia ? 'transform' : '-webkit-transform'] = 'rotate(0deg)';
                    setTimeout(function() {
                        video.style[navigator.mozGetUserMedia ? 'transform' : '-webkit-transform'] = 'rotate(360deg)';
                    }, 1000);
                }
            </script>
            
            <section class="experiment">
                <h2 class="header">How it works?</h2>
                <ol>
                    <li>It broadcasts media in one-way direction over number of peers.</li>
                    <li>All peers can view/watch/listen the broadcast, anonymously.</li>
                    <li>"Anonymously" means viewers will NEVER be prompted to allow webcam or mic or screen.</li>
                    <li>Assume like a radio station inside the browser. Remember, it works only browser-to-browser.</li>
                </ol>
            </section>
        
            <section class="experiment own-widgets latest-commits">
                <h2 class="header" id="updates" style="color: red; padding-bottom: .1em;"><a href="https://github.com/muaz-khan/WebRTC-Experiment/commits/master" target="_blank">Latest Updates</a></h2>
                <div id="github-commits"></div>
            </section>
        
            <section class="experiment">
                <h2 class="header" id="feedback">Feedback</h2>
                <div>
                    <textarea id="message" style="border: 1px solid rgb(189, 189, 189); height: 8em; margin: .2em; outline: none; resize: vertical; width: 98%;" placeholder="Have any message? Suggestions or something went wrong?"></textarea>
                </div>
                <button id="send-message" style="font-size: 1em;">Send Message</button><small style="margin-left: 1em;">Enter your email too; if you want "direct" reply!</small>
            </section>
            
            <section class="experiment">
                <h2 class="header">How it works?</h2>
                <p>
                    It is one-way broadcasting; media stream is attached only by the broadcaster.
                </p>
                <p>
                    It means that, if 10 people are watching your one-way broadcasted audio/video stream; on your system:
                </p>
                <ol>
                    <li>10 RTP ports are opened to send video upward i.e. outgoing video</li>
                    <li>10 RTP ports are opened to send audio upward i.e. outgoing audio</li>
                </ol>
                <p>
                    And on participants system:
                </p>
                <ol>
                    <li>10 RTP ports are opened to receive video i.e. incoming video</li>
                    <li>10 RTP ports are opened to receive audio i.e. incoming audio</li>
                </ol>
                <p>
                    Maximum bandwidth used by each video RTP port (media-track) is about 1MB. You're streaming audio and video tracks. You must be careful when streaming video over more than one peers. If you're broadcasting audio/video over 10 peers; it means that 20MB bandwidth is required on your system to stream-up (broadcast/transmit) your video. Otherwise; you'll face connection lost; CPU usage issues; and obviously audio-lost/noise/echo issues.
                </p>
                <p>
                    You can handle such things using "b=AS" (application specific bandwidth) session description parameter values to deliver a little bit low quality video.
                </p>
                <pre>
// removing existing bandwidth lines
sdp = sdp.replace( /b=AS([^\r\n]+\r\n)/g , '');

// setting "outgoing" audio RTP port's bandwidth to "50kbit/s"
sdp = sdp.replace( /a=mid:audio\r\n/g , 'a=mid:audio\r\nb=AS:50\r\n');

// setting "outgoing" video RTP port's bandwidth to "256kbit/s"
sdp = sdp.replace( /a=mid:video\r\n/g , 'a=mid:video\r\nb=AS:256\r\n');
</pre>
                <p>
                    Possible issues:</p>
                <ol>
                    <li>Blurry video experience</li>
                    <li>Unclear voice and audio lost</li>
                    <li>Bandwidth issues / slow streaming / CPU overwhelming</li>
                </ol>
                <p>Solution? Obviously a media server or <a href="https://www.webrtc-experiment.com/RTCMultiConnection/remote-stream-forwarding.html">remote-stream-forwarding</a>!</p>
            </section>
        </article>
        
        <a href="https://github.com/muaz-khan/WebRTC-Experiment/tree/master/webrtc-broadcasting" class="fork-left"></a>
        
        <footer>
            <p>
                <a href="https://www.webrtc-experiment.com/">WebRTC Experiments</a>
                © <a href="https://plus.google.com/+MuazKhan" rel="author" target="_blank">Muaz Khan</a>
                <a href="mailto:muazkh@gmail.com" target="_blank">muazkh@gmail.com</a>
            </p>
        </footer>
    
        <!-- commits.js is useless for you! It is not part of this WebRTC Experiment. -->
        <script src="//cdn.webrtc-experiment.com/commits.js" async> </script>
    </body>
</html>