<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문 등록</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
</head>
<style>
div {
	width: 100%;
	margin: 0 auto;
}

.out {
	width: 50%;
	text-align: center;
	border: none;
	margin: 15px;
}

.in {
	width: 100%;
	border: none;
}

.title {
	width: 50%;
	height: 2em;
	border: none;
	resize: none;
	font-size: 30px;
}

.text {
	width: 50%;
	height: 2em;
	border: none;
	resize: none;
}

.dropdown {
	position: relative;
	left: 1px;
}

.dropbtn {
	border: 1px solid rgb(37, 37, 37);
	border-radius: 4px;
	width: 200px;
	text-align: left;
	cursor: pointer;
	font-size: 12px;
	position: absolute;
	right: 0px;
}

.dropdown-content {
	display: none;
	position: absolute;
	right: 0px;
	z-index: 1;
	font-weight: 400;
	background-color: #f9f9f9;
	min-width: 200px;
}

.dropdown-content a {
	display: block;
	text-decoration: none;
	color: rgb(37, 37, 37);
	font-size: 12px;
	padding: 12px 20px;
}

.dropdown-content a:hover {
	background-color: #ececec
}

.dropdown:hover .dropdown-content {
	display: block;
}

.select {
	cursor: pointer;
}

.quick {
	position: fixed;
	top: 250px;
	left: 250px;
}

.quickmenu {
	list-style: none;
}
</style>

<body>
	<ul class="quickmenu">
		<li>
			<button type="button" class="addquestion">+</button>
		</li>
	</ul>
	<div class="out">
		<h1 align="center">설문 등록</h1>
		<br>
		<div class="in">
			<textarea class="title t" placeholder="제목 없는 설문지"></textarea>
			<textarea class="text d" placeholder="설문지 설명"></textarea>
			<br>
		</div>
		<div class="in" id="question" style="display: none;">
			<hr>
			<br>
			<div class="dropdown">
				<button class="dropbtn">형식 선택</button>
				<div class="dropdown-content">
					<a class="select" num="1">단답형 </a> <a class="select" num="2">장문형</a>
					<a class="select" num="3">객관식질문</a> <a class="select" num="4">체크박스</a>
					<a class="select" num="5">드롭다운</a>
				</div>
			</div>
			<br> <br>
			<textarea class="text q" placeholder="질문"></textarea>
			<br>
			<textarea class="text a" placeholder="단답형 텍스트"></textarea>
			<button type="button" id="insertA">v</button>
			<p align="right">
				<input type="file" name="file" />
			</p>
			<p align="right">
				<input type="file" name="file" />
			</p>
			<p align="right">
				<button type="button" id="insertQ">질문등록</button>
				<button class="deleteQ">삭제</button>
			</p>
		</div>
		
		<div class="in" id="question">
			<hr>
			<br>
			<div class="dropdown">
				<button class="dropbtn">형식 선택</button>
				<div class="dropdown-content">
					<a class="select" num="1">단답형 </a> <a class="select" num="2">장문형</a>
					<a class="select" num="3">객관식질문</a> <a class="select" num="4">체크박스</a>
					<a class="select" num="5">드롭다운</a>
				</div>
			</div>
			<br> <br>
			<textarea class="text q" placeholder="질문"></textarea>
			<br>
			<textarea class="text a" placeholder="단답형 텍스트"></textarea>
			<button type="button" id="insertA">v</button>
			<p align="right">
				<input type="file" name="file" />
			</p>
			<p align="right">
				<input type="file" name="file" />
			</p>
			<p align="right">
				<button type="button" id="insertQ">질문등록</button>
				<button class="deleteQ">삭제</button>
			</p>
		</div>
		<div id="next"></div>
	</div>
	<br>
	<hr>
	<br>
	<div class="in">
		<button type="button" onclick="location.href='/surveylist'">돌아가기</button>
		<button type="button" id="submit">등록</button>
	</div>

	<script>
		/*  	$(document).on('click', '#submit', function() {
		 let answer = $('.a');
		 let survey_ = {
		 title: $('.t'),
		 disc: $('.d'),
		 questions: [{
		 question: $('.q').val() , 
		 answers: [{ 
		 answer
		 }] 
		 }]	
		 };

		 let survey = JSON.stringify(survey_);
		
		 $.ajax({
		 url: "/regsurvey2",
		 contentType: 'application/json',
		 method: 'POST',
		 jsonData: survey,
		 success: function(jsonData) {
		 console.log(jsonData);
		 }
		 })
		 });
		 */
		 let answer = [];
		 let question = [];
		 
		 $(document).on('click', '#insertA', function() {
			 let a = $(this).prev().val();

			 answer.push(a);
			 
			 console.log(answer); 
		 }); //답변등록
		 
		 $(document).on('click', '#insertQ', function() {
			 let q = $(this).parent().parent().children('.q').val();
		 		
			 question.push(q);
			 
			 console.log(question); 
			
			 $.ajax({
					method : "POST",
					url : "/fixedQuestion",
					data : {
						questions : question,
						answers : answer
					}
				}).done(function(html) {
					$(this).parents('#question').html(html);
				}).fail(function() {
					alert("fail");
				})
			});
		 
		 

		$(document).on('click', '.select', function() {
			let number = $(this).attr("num");
			let p = $(this).parent().parent().parent();

			$.ajax({
				method : "POST",
				url : "/selectQuestion",
				data : {
					num_ : number
				}
			}).done(function(html) {
				$($(p)).html(html);
			}).fail(function() {
				alert("fail");
			})
		}); //질문타입설정

		$(document).on('click', '.add', function() {
			$("#q").clone().prependTo('#next_q');
			$('#q').show();
		}); //옵션추가

		$(document).on('click', '.del', function() {
			$(this).parent().remove('#q');
		}); //옵션삭제

		$(document).on('click', '.deleteQ', function() {
			$(this).parent().parent().remove();
		}); //질문삭제

		$(document).on('click', '.addquestion', function() {
			$("#question").clone().prependTo('#next');
			$('#question').show();
		}); //질문추가
	</script>

</body>
</html>