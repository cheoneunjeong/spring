<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<style>
	fieldset {
		width: 50%;
		margin: 0 auto;
	}
</style>
<body>
<h2 align="center">글작성</h2>
<div>
<fieldset>
<form action="/regdo" method="post">
	<p> 제목 <input type="text" name="bTitle"></p>
	<p> 작성자 <input type="text" name="bWriter"></p>
	<p>
	내용
	<br>
	<textarea rows="20" cols="50" name="bContent"></textarea>
	<br>
	<button type="submit">등록</button>
	<button type="button" onclick="location.href='/'">돌아가기</button>
</form>
</fieldset>
</div>
</body>
</html>