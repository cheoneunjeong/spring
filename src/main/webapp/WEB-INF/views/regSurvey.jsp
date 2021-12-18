<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문 등록</title>
</head>
<style>
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
</style>
<body>
<div class="out">
	<h1 align="center">설문 등록</h1>
	<br>
	<div class="in">
		<textarea class="a" placeholder="제목 없는 설문지"></textarea>
		<textarea placeholder="설문지 설명"></textarea>
	</div>
</div>
</body>
</html>