<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>설문</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<style>
div {
	width: 60%;
	margin: 0 auto;
}
table {
    margin-left:auto; 
    margin-right:auto;
}

table, td, th {
    border-collapse : collapse;
    border : 1px solid black;
    width : 100%;
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
<h2 align="center">설문지 ${survey.s_num}번 </h2>

<br>
<div>
	<table>
		<th>${survey.title}</th>
		<tr>
			<td>${survey.disc}</td>
		</tr>
	</table>
<br><br>
<table>
	<c:forEach items="${qlist}" var="item" varStatus="status">

		<tr>
			<td>${item.rownum}. ${item.q}</td>
		</tr>
		<tr>
			<td colspan="2">
				<c:choose>
				<c:when test="${item.t == 1}">
					 <textarea class="short" placeholder="내용을 입력해 주세요." ></textarea>
				</c:when>
				<c:when test="${item.t == 2}">
					<textarea class="long" placeholder="내용을 입력해 주세요." ></textarea>
				</c:when>
				<c:when test="${item.t == 3}">
				<c:forEach items="${item.answers}" var="answer" varStatus="status">
					<p>
						<input type="radio"/>
						<span>${answer.a}</span>
					</p>
				</c:forEach>
				</c:when>
				<c:when test="${item.t == 4}">
				<c:forEach items="${item.answers}" var="answer" varStatus="status">
					<p>
						<input type="checkbox"/>
						<span>${answer.a}</span>
					</p>
				</c:forEach>
				</c:when>
				<c:when test="${item.t == 5}">
				<p>
						<select>
				<c:forEach items="${item.answers}" var="answer" varStatus="status">
							<option value="${answer.a_num}">${answer.a}</option>
					
				</c:forEach>
					</select>
					</p>
				</c:when>
				</c:choose>
			</td>
		</tr>
	</c:forEach>
</table>
</div>
<div>
<br>
<p align="right">
<button>제출하기</button>
</p>
</div>

<script>
	
</script>
</body>
</html>