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
	<div class="btn"></div>
	<div onclick="history.back();" class="page_cover"></div>
	<div id="menu">
		<div onclick="history.back();" class="close"></div>
	</div>
<!-- 	<div class="quick">
		<ul class="quickmenu">
			<li>
				<button type="button" class="addquestion">+</button>
			</li>
		</ul>
	</div> -->
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
			<textarea class="text q" s_num="1" type="1" placeholder="질문"></textarea>
			<br>
			<textarea class="text a" placeholder="단답형 텍스트"></textarea>
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
			<textarea class="text q" s_num="1" type="1" placeholder="질문"></textarea>
			<br>
			<textarea class="text a" placeholder="단답형 텍스트"></textarea>
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
	
/* 	$('.q').each(function(index) {
		console.log('a');
		
	}); */
	
 	let questions=[];
	$(document).on('click','.addquestion', function() {
		if(!!$(this).parent().parent().children('.q').val()) {
 			console.log($(this).parent().parent().children('.q').val()); 
			let q = $(this).parent().parent().children('.q').val();
			let t = $(this).parent().parent().children('.q').attr('type');
			
			$('.a').each(function(index) {
				if($(this).parent().children('.q').val()==q){
					let a= $(this).val();
					console.log(a);
					questions.answers.push(a);
				}
			})
			
			questions = [
				
					{q, t, answers : []}
				];
			
			
		}
		console.log(questions);
	}); 

/* 	$(document).on('click', '#submit', function() {
		let = survey = {
				title: $('.t').val(),
				disc : $('.d').val(),
				questions : []
		};
		
		$('.question').each(function(index) {
			let question = {
					q: {
						qContent: $(this).children('.q').val(),
						qType: $(this).children('.q').attr('type')
					},
					answers: []
			}
			
			let tmp = $(this).children('.q').next().next();
			if(tmp.hasClass("a")==true) {
				$('.a').each(function(index) {
					let answer={};
					
					answer.aContent = tmp.val();
					question.answers.push(answer);
					
					tmp = tmp.next().next().next();
					if(tmp.hasClass('a' == ))
				}
				)
			}
		})
	}) */
	
/* 	$(document).on('click', '.addquestion', function(){
		$.each(questions, function() {
		
		
		
		console.log($('.q').val());
		if(!!$('.q').val() && questions.indexOf($('.q').val())==-1){
			questions.push($('.q').val());
			$.each(questions, function() {
				let question = [];
				if(!!$('.q').children('.a').val()) {
					let answers=[];
					answers.push($('.q').children('.a').val());
				}
				question.push(answers);
			})
		}
		
		console.log(questions);
	})
}); */
	
/* 	
	
		let question = [];
		let answers = [];
		let q;
		
		$(document).on('blur', '.a', function(){
			let a = $(this).val();
			if(!!a) {
				answers.push([a,q]);
				console.log(answers);
			}
		});
		
		$(document).on('blur', '.q', function(){
			q = $(this).val();
			let type = $(this).attr("type");
			let s_num = $(this).attr("s_num");
			if(!!q) {
				question.push([q, type, s_num, answers]);
				console.log(question);
			}
		});
		
		$('.a').on('focus', function() {
			let prev = $(this).val();
			if(!!prev) {
				$('.a').on('change', function() {
					const index = answers.indexOf(prev);
					if (index > -1) {
						answers.splice(index, 1);
						}
				})
			}
		});
		
		$('.q').on('focus', function() {
			let prev = $(this).val();
			if(!!prev) {
				$('.q').on('change', function() {
					for (let i = 0; i < question.length; i++) {
						if(question[i][0] === prev) {
							
							question.splice(i, 1);
						}
					}
				})
			}
		});
		
		$(document).on('click', '#submit', function () {
			
			let survey = {
					title: $('.t').val(),
					disc: $('.d').val(),
					questions: question
					
			}
			
			
			console.log(survey);
			return false;
			 $.ajax({
				 type:'post'
					　　, contentType:'application/json'
					　　, data: JSON.stringify(survey)
					　　, url: '/regSurvey2'
			 })
			 .done(function() {
				 console.log('success');
			 })
		});
		 */
	
		/*  $(document).on('click', '#submit', function() {
		
			 let survey = {
				 title: $('.t').val(),
				 disc: $('.d').val(),
				 question: questions 
			 };
			 
			 $.ajax({
				 url: "/regSurvey2",
				 data: survey,
				 method: "POST",
				 contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				 dataType: "json" 
			 })
			 .done(function(data) {
				 console.log(data);
			 })
		 }); */
		 

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