<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문 등록</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
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
	z-index:1;
	background-image:url("https://s1.daumcdn.net/cfs.tistory/custom/blog/204/2048858/skin/images/menu.png");
	background-size:50%;
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
	background-image:url("https://s1.daumcdn.net/cfs.tistory/custom/blog/204/2048858/skin/images/close.png");
	background-size: 50%;
	background-repeat: no-repeat;
	background-position: center;
	cursor: pointer;
}
#menu {
	width: 150px;
	height:100%;
	position: fixed;
	top:0px;
	right:-152px;
	z-index:10;
	border: 1px solid #c9c9c9;
	background-color: white;
	text-align: center;
	transition:All 0.2s ease; 
	-webkit-transition: All 0.2s ease;
	-moz-transition:All 0.2s ease;
	-o-transition:All 0.2s ease;
}
#menu.open {
	right:0px;
}
.page_cover.open {
	display: block;
}
.page_cover {
	width: 100%;
	height: 100%;
	position: fixed;
	top:0px;
	left:0px;
	background-color:rgba(0,0,0,0.4);
	z-index:4;
	display: none;
}

textarea {
    width: 50%;
    height: 2em;
    border: none;
    resize: none;

  }
  
 div {
	width: 60%;
	margin: 0 auto;
} 

 .out {
 width: 100%;
 text-align: center;
 border: none;
 margin: 15px;
 }
 
  .in {
 display: inline-block;
 width: 50%;
 border: none;
 }
 
.a {
	 width: 50%;
    height: 2em;
    border: none;
    resize: none;
    font-size: 30px;
}
ul{
list-style : none;
}
.select { display:none; }
.q {
	/* border: 1px solid #444444; */
}
.dropdown {
	position: relative;
	left: 1px;
}
.dropbtn{
	border: 1px solid rgb(37, 37, 37);
	border-radius: 4px;
	width: 200px;
	text-align:left;
	cursor:pointer;
	font-size:12px;
	position: absolute;
	right:0px;
}
.dropdown-content{
	display: none;
	position: absolute;
	z-index: 1;
	font-weight: 400;
	background-color: #f9f9f9;
	min-width:200px;
}
.dropdown-content a {
	display: block;
	text-decoration: none;
	color: rgb(37,37,37);
	font-size: 12px;
	padding: 12px 20px;
}
.dropdown-content a:hover {
	background-color: #ececec
}
.dropdown:hover .dropdown-content {
	display: block;
}
</style>
<body>
<div class="out">
	<h1 align="center">설문 등록</h1>
	<br>
	<div class="in">
		<textarea class="a" placeholder="제목 없는 설문지"></textarea>
		<textarea placeholder="설문지 설명"></textarea>
		<hr>
	</div>
	<br>
	<div class="in, q">
	<br>
			<div class="dropdown">
				<button class="dropbtn">형식 선택</button>
				<div class="dropdown-content">
					<a href="">단답형</a>
					<a href="">장문형</a>
					<a href="">객관식질문</a>
					<a href="">체크박스</a>
					<a href="">드롭다운</a>
					<a href="">파일업로드</a>	
				</div>	
			</div>
			<br>
			<br>
			<input type="radio" name="q1" value="q1"/>
			<textarea  placeholder="제목 없는 질문"></textarea>
	</div>
	<div class="btn">
	</div>
	<div onclick="history.back();" class="page_cover">
	</div>
	<div id="menu">
		<div onclick="history.back();" class="close"></div>
	</div>
</div>

<script>
/* $(document).on('click', '#m', function(){
	$('.select').slideToggle(200);
}) */
$(".btn").click(function() {
	$("#menu,.page_cover,html").addClass("open");
	window.location.hash = "#open";
});

window.onhashchange = function() {
	if(location.hash != "#open") {
		$("#menu,.page_cover,html").removeClass("open");
	}
};
</script>

</body>
</html>