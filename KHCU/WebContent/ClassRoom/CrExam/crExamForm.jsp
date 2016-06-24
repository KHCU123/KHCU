<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/KHCU/css/test.css" type="text/css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script type="text/javascript" src="/KHCU/js/jquery.js"></script>
<script type="text/javascript">
/**
 * Created with JetBrains WebStorm.
 * User: pwanwu
 * Date: 18/09/2013
 * Time: 17:41
 * To change this template use File | Settings | File Templates.
 */
 
var questions = [{
    question: "${inputDTO.question1}",
    choices: ["${inputDTO.answer1_1}", "${inputDTO.answer1_2}", "${inputDTO.answer1_3}", "${inputDTO.answer1_4}"],
    correctAnswer:${inputDTO.answer1_5}
}, {
    question: "${inputDTO.question2}",
    choices: ["${inputDTO.answer2_1}", "${inputDTO.answer2_2}", "${inputDTO.answer2_3}", "${inputDTO.answer2_4}"],
    correctAnswer:${inputDTO.answer2_5}
}, {
    question: "${inputDTO.question3}",
    choices: ["${inputDTO.answer3_1}", "${inputDTO.answer3_2}", "${inputDTO.answer3_3}", "${inputDTO.answer3_4}"],
    correctAnswer:${inputDTO.answer3_5}
}, {
    question: "${inputDTO.question4}",
    choices: ["${inputDTO.answer4_1}", "${inputDTO.answer4_2}", "${inputDTO.answer4_3}", "${inputDTO.answer4_4}"],
    correctAnswer:${inputDTO.answer4_5}
}, {
    question: "${inputDTO.question5}",
    choices: ["${inputDTO.answer5_1}", "${inputDTO.answer5_2}", "${inputDTO.answer5_3}", "${inputDTO.answer5_4}"],
    correctAnswer:${inputDTO.answer5_5}
}];

var currentQuestion = 0;
var correctAnswers = 0;
var quizOver = false;

$(document).ready(function () {

    // Display the first question
    displayCurrentQuestion();
    $(this).find(".quizMessage").hide();

    // On clicking next, display the next question
    $(this).find(".nextButton").on("click", function () {
        if (!quizOver) {

            value = $("input[type='radio']:checked").val();

            if (value == undefined) {
                $(document).find(".quizMessage").text("답을 선택하세요.");
                $(document).find(".quizMessage").show();
            } else {
                // TODO: Remove any message -> not sure if this is efficient to call this each time....
                $(document).find(".quizMessage").hide();

                if (value == questions[currentQuestion].correctAnswer) {
                    correctAnswers++;
                }

                currentQuestion++; // Since we have already displayed the first question on DOM ready
                if (currentQuestion < questions.length) {
                    displayCurrentQuestion();
                } else {
                	alert('수고하셨습니다.');
                    displayScore();
                    //                    $(document).find(".nextButton").toggle();
                    //                    $(document).find(".playAgainButton").toggle();
                    // Change the text in the next button to ask if user wants to play again
                    $(document).find(".nextButton").text("수고하셨습니다.");
                    quizOver = true;
                }
            }
        } else { // quiz is over and clicked the next button (which now displays 'Play Again?'
            quizOver = false;
            returnpage()
        }
    });

});
    
//타이머
$(document).ready(function(){
	//초기값
	var hour = 0;
	var minute = 0;
	var second = 10;
	
	// 초기화
	$(".countTimeHour").html(hour);
	$(".countTimeMinute").html(minute);
	$(".countTimeSecond").html(second);
	
	var timer = setInterval(function () {
			// 설정
			$(".countTimeHour").html(hour);
			$(".countTimeMinute").html(minute);
			$(".countTimeSecond").html(second);
			
			if(second == 0 && minute == 0 && hour == 0){
				alert('시간 초과.');
				clearInterval(timer); /* 타이머 종료 */
				displayScore()
			}else{
				second--;
				
				// 분처리
				if(second < 0){
					minute--;
					second = 59;
				}
				
				//시간처리
				if(minute < 0){
					if(hour > 0){
						hour--;
						minute = 59;
					}
					
				}
			}
    	}, 1000); /* millisecond 단위의 인터벌 */
});
// This displays the current question AND the choices
function displayCurrentQuestion() {

    console.log("In display current Question");

    var question = questions[currentQuestion].question;
    var questionClass = $(document).find(".quizContainer > .question");
    var choiceList = $(document).find(".quizContainer > .choiceList");
    var numChoices = questions[currentQuestion].choices.length;

    // Set the questionClass text to the current question
    $(questionClass).text(question);

    // Remove all current <li> elements (if any)
    $(choiceList).find("li").remove();

    var choice;
    for (i = 0; i < numChoices; i++) {
        choice = questions[currentQuestion].choices[i];
        $('<li><input type="radio" value=' + i + ' name="dynradio" />' + choice + '</li>').appendTo(choiceList);
    }
}

function resetQuiz() {
    currentQuestion = 0;
    correctAnswers = 0;
    hideScore();
}

function displayScore() {
   $(document).find(".quizContainer > .result").text("You scored: " + correctAnswers + " out of " + questions.length);
   $(document).find(".quizContainer > .result").show();  
   var questionsL = questions.length;
   form1.action="crExamFormPro.khcu?correctAnswers="+correctAnswers+"&questions="+questions.length;
   form1.submit();
}


function hideScore() {
    $(document).find(".result").hide();
}
function returnpage(){
	var url = "crExamFormPro.khcu?correctAnswers="+correctAnswers+"&questions="+questions.length;
	$(location).attr('href',url);
}

</script>

</head>
<body>
<c:if test="${check == null}">
<form action="/KHCU/crExamFormPro.khcu" name="form1" id="form1" method="post">
<input type="hidden" name="num" value="${inputDTO.num }"/>
<input type="hidden" name="classCode" value="${inputDTO.classCode }"/>
<input type="hidden" name="examType" value="${inputDTO.examType }"/>

	<center>
	<h2> ${sessionScope.memId}님의 ${inputDTO.examType } </h2>
	<br/>
	<div>
		<strong>시간 카운트</strong>
		<span class="countTimeHour">60</span>시
		<span class="countTimeMinute">60</span>분
		<span class="countTimeSecond">60</span>초
	</div>
	<br/>
	</center>
    <div class="quizContainer">
        <div class="question"></div>
        <ul class="choiceList"></ul>
        <div class="quizMessage"></div>
        <div class="result"></div>
        <div class="nextButton">다음 문제로..</div>
        <br>
    </div>
</form>
</c:if>
<c:if test="${check != null}">
	<script>
		alert("이미 시험을 보셨습니다.");
		history.go(-1);
	</script>
</c:if>
</body>

</html>