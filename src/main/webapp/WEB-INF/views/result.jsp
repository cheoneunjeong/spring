<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답 결과</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
<style>
div {
	width: 60%;
	margin: 0 auto;
}

table {
	margin-left: auto;
	margin-right: auto;
}

table {
	border-collapse: collapse;
	border: 1px solid black;
	width : 100%;
	height: 50px;
}


td, th {
	border-collapse: collapse;
	border: 1px solid black;
	height: 50px; 
}

.short {
	width: 50%;
	height: 3em;
	resize: none;
}

.long {
	width: 50%;
	height: 6em;
	resize: none;
}
</style>
</head>
<body>
	<h2 align="center"> -번 설문 응답 결과</h2>

	<br>
	<div>
		<table>
			<th ><input type="hidden">제목</th>
			<tr>
				<td><input type="hidden">설명</td>
			</tr>
		</table>
		<br>
		<br>
	</div>
	<div>
		<c:forEach items="${list}" var="item" varStatus="status"></c:forEach>
		<p>번호. 질문</p>
		<p>응답 -개</p>
		
		
	</div>
		<br>
</body>
</html>