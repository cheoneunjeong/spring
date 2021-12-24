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
html.open {
	overflow: hidden;
}

div {
	width: 100%;
	margin: 0 auto;
}

.btn {
	width: 50px;
	height: 50px;
	position: absolute;
	right: 0px;
	top: 0px;
	z-index: 1;
	background-image:
		url("https://s1.daumcdn.net/cfs.tistory/custom/blog/204/2048858/skin/images/menu.png");
	background-size: 50%;
	background-repeat: no-repeat;
	background-position: center;
	cursor: pointer;
}

.close {
	width: 50px;
	height: 50px;
	position: absolute;
	right: 0px;
	top: 0px;
	background-image:
		url("https://s1.daumcdn.net/cfs.tistory/custom/blog/204/2048858/skin/images/close.png");
	background-size: 50%;
	background-repeat: no-repeat;
	background-position: center;
	cursor: pointer;
}

#menu {
	width: 150px;
	height: 100%;
	position: fixed;
	top: 0px;
	right: -152px;
	z-index: 10;
	border: 1px solid #c9c9c9;
	background-color: white;
	text-align: center;
	transition: All 0.2s ease;
	-webkit-transition: All 0.2s ease;
	-moz-transition: All 0.2s ease;
	-o-transition: All 0.2s ease;
}

#menu.open {
	right: 0px;
}

.page_cover.open {
	display: block;
}

.page_cover {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0px;
	left: 0px;
	background-color: rgba(0, 0, 0, 0.4);
	z-index: 4;
	display: none;
}

.out {
	width: 100%;
	text-align: center;
	border: none;
	margin: 15px;
}

.in {
	width: 50%;
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

</style>

<body>
	<div class="btn"></div>
	<div onclick="history.back();" class="page_cover"></div>
	<div id="menu">
		<div onclick="history.back();" class="close"></div>
	</div>
	<div class="out">
		<h1 align="center">설문 등록</h1>
		<br>
		<div class="in">
			<textarea class="title t" name="title" placeholder="제목 없는 설문지"></textarea>
			<textarea class="text d" name="disc" placeholder="설문지 설명"></textarea>
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
			<textarea class="text q" s_num="1" type="1" placeholder="단답형 질문"></textarea>
			<br>
			<p align="right">
				<input type="file" name="file" />
			</p>
			<p align="right">
				<input type="file" name="file" />
			</p>
			<p align="right">
				<button type="button" class="addquestion">+</button>
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
			<textarea class="text q" s_num="1" type="1" placeholder="단답형 질문"></textarea>
			<br>
			<p align="right">
				<input type="file" name="file" />
			</p>
			<p align="right">
				<input type="file" name="file" />
			</p>
			<p align="right">
				<button type="button" class="addquestion">+</button>
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
	
 	let questions=[];
	$(document).on('click','.addquestion', function() {
		if(!!$(this).parent().parent().children('.q').val()) {
			let q = $(this).parent().parent().children('.q').val();
			let t = $(this).parent().parent().children('.q').attr('type');
	
			let answers=[];
			$('.a').each(function(index) {
				if($(this).parent().children('.q').val()==q){
					let a= $(this).children('.text').val();
					if(!!a){
						let answer = {a};
						answers.push(answer);
					}
				}
			})
			question= {q, t, answers};
			questions.push(question);
		}
		console.log(questions);
	}); //질문추가시 이전질문 저장
	
	
	$(document).on('click', '#submit', function () {
		
		if(!!$('.q').last().val()){
			let q = $('.q').last().val();
			let t = $('.q').last().attr('type');
			
			let answers=[];
			$('.a').each(function(index) {
				if($(this).parent().children('.q').val()==q){
					let a= $(this).children('.text').val();
					if(!!a){
						let answer = {a};
						answers.push(answer);
					}
				}
			})
			question= {q, t, answers};
			questions.push(question);
		}
		
		let survey = {
				title: $('.t').val(),
				disc: $('.d').val(),
				questions: questions
		};
		
		console.log(survey);
		
		let surveyresult = JSON.stringify(survey);
		$.ajax({
			method: "POST",
			url: "/regSurvey2",
			data: surveyresult,
			contentType : "application/json"
		})
		.done(function() {
				 console.log('success');
		})
	}); //제출시 마지막질문 저장 후 , survey ->json 전송
		
	
		$(".btn").click(function() {
			$("#menu,.page_cover,html").addClass("open");
			window.location.hash = "#open";
		});

		window.onhashchange = function() {
			if (location.hash != "#open") {
				$("#menu,.page_cover,html").removeClass("open");
			}
		}; //상단메뉴

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
		
		$(document).on('click', '.add3', function() {
			$(this).before('<p class="a" id="q"><input type="radio" value="q1" /><textarea class="text" placeholder=" 옵션1"></textarea><button type="button" class="del">삭제</button></p>');
		}); // 3옵션추가
 
		$(document).on('click', '.add4', function() {
			$(this).before('<p class="a" id="q"><input type="checkbox" value="q1" /><textarea class="text" placeholder=" 옵션1"></textarea><button type="button" class="del">삭제</button></p>');
		}); // 4옵션추가
		
		$(document).on('click', '.add5', function() {
			$(this).before('<p class="a" id="q"><textarea class="text" placeholder="옵션1"></textarea><button type="button" class="del">삭제</button></p');
		}); // 5옵션추가
		
		$(document).on('click', '.del', function() {
			$(this).parent().remove('#q');
		}); //옵션삭제

		$(document).on('click', '.deleteQ', function() {
			$(this).parent().parent().remove();
		}); //질문삭제

		$(document).on('click', '.addquestion', function() {
			$('#next').before('<div class="addnext"></div>');
			$("#question").first().clone().prependTo($('.addnext').last()).show();
		}); //질문추가
		
	</script>

</body>
</html>