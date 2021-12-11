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
<h2 align="center">${bid}번 답글작성</h2>
<div>
<fieldset>
<form action="/regCommentdo" method="post">
	<input type="hidden" name="${csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="groups" value="${groups}">
	<input type="hidden" name="orders" value="${orders}">
	<input type="hidden" name="depth" value="${depth}">
	<p> 제목 <input type="text" name="bTitle"></p>
	<p>
	내용
	<br>
	<textarea rows="20" cols="50" name="bContent"></textarea>
	<br>
	<button type="submit">등록</button>
	<button type="button" onclick="location.href='/boardlist'">돌아가기</button>
</form>
</fieldset>
</div>
</body>
</html>