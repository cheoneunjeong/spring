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

.text {
	width: 50%;
	height: 2em;
	border: none;
	resize: none;
}

div {
	width: 100%;
	margin: 0 auto;
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
	position:fixed;
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
	<div class="quick">
		<ul class="quickmenu">
			<li>
				<button type="button" class="addquestion"><img alt="질문추가" width="20" hight="20"
				src="https://previews.123rf.com/images/martialred/martialred1507/martialred150700754/42614040-%EC%95%B1-%EB%B0%8F-%EC%9B%B9-%EC%82%AC%EC%9D%B4%ED%8A%B8%EC%97%90-%EB%8C%80%ED%95%9C-%EC%B6%94%EA%B0%80-%EB%B0%8F-%EB%8D%94%ED%95%98%EA%B8%B0-%EB%9D%BC%EC%9D%B8-%EC%95%84%ED%8A%B8-%EC%95%84%EC%9D%B4%EC%BD%98.jpg">
				</button>
			</li>
		</ul>
	</div>
	<form action="/regSurvey2" method="post" enctype="multipart/form-data">
	<div class="out">
		<h1 align="center">설문 등록</h1>
		<br>
		<div class="in">
			<textarea class="title" name="title" placeholder="제목 없는 설문지"></textarea>
			<textarea class="text" name="disc" placeholder="설문지 설명"></textarea>
			<br>
		</div>
		<div class="in" id="question" style="display: none;">
			<hr>
			<br>
			<div class="dropdown">
				<button class="dropbtn">형식 선택</button>
				<div class="dropdown-content">
					<a class="select" num="1">단답형 </a> <a class="select" num="2">장문형</a> <a class="select"  num="3">객관식질문</a> 
					<a class="select" num="4">체크박스</a> <a class="select" num="5">드롭다운</a>
				</div>
			</div>
			<br> <br>
			<textarea class="text" name="question_" placeholder="질문"></textarea>
			<br>
			<textarea class="text" name="answer_" placeholder="단답형 텍스트"></textarea>
			<p align="right"><input type="file" name="file"/></p>
			<p align="right"><input type="file" name="file"/></p>
			<p align="right"><button class="deleteQ">삭제</button></p>
		</div>
		<div class="in" id="question">
			<hr>
			<br>
			<div class="dropdown">
				<button class="dropbtn">형식 선택</button>
				<div class="dropdown-content">
					<a class="select" num="1">단답형 </a> <a class="select" num="2">장문형</a> <a class="select"  num="3">객관식질문</a> 
					<a class="select" num="4">체크박스</a> <a class="select" num="5">드롭다운</a>
				</div>
			</div>
			<br> <br>
			<textarea class="text" name="question_" placeholder="질문"></textarea>
			<br>
			<textarea class="text" name="answer_" placeholder="단답형 텍스트"></textarea>
			<p align="right"><input type="file" name="file"/></p>
			<p align="right"><input type="file" name="file"/></p>
			<p align="right"><button class="deleteQ">삭제</button></p>
			
		</div>
		<div id="next"></div>
	</div>
	<br><hr><br>
	<div class="in">
		<button type="button" onclick="location.href='/surveylist'">돌아가기</button>
		<button type="submit">등록</button>
	</div>
	</form>

<script>
	$(".btn").click(function() {
		$("#menu,.page_cover,html").addClass("open");
		window.location.hash = "#open";
	});

	window.onhashchange = function() {
		if (location.hash != "#open") {
			$("#menu,.page_cover,html").removeClass("open");
		}
	};
	
	$(document).on('click', '.select', function () {
		let number = $(this).attr("num");
		let p = $(this).parent().parent().parent();
		
		$.ajax({
			  method: "POST",
			  url: "/selectQuestion",
			  data: { num_: number}
			})
		  .done(function( html ) {
			  $($(p)).html(html);
		  })
			 .fail(function(){
				alert("fail");
			})
	});

	$(document).on('click', '.add', function() {
		$("#q").clone().prependTo('#next_q');
		$('#q').show();
	});
	
	$(document).on('click', '.del', function() {
		$(this).parent().remove('#q');
	});
	
/* 	
	$(document).on('click', '.addquestion', function() {
		$("#question").clone().after().prependTo('#next');
	});
	 */
	$(document).on('click', '.deleteQ', function() {
		$(this).parent().parent().remove();
	});
	
	$(document).on('click', '.addquestion', function() {
		$("#question").clone().prependTo('#next');
		$('#question').show();
	});
	
</script>

</body>
</html>