<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<style>
div {
	width: 60%;
	margin: 0 auto;
}

table tr, th, td {
	border: 1px solid #444444;
}

table {
	border-collapse: collapse;
	border-top: 3px solid #168;
	margin: auto;
	width: 100%;
}

th {
	color: #168;
	background: f0f6f9;
	text-align: center;
	padding: 10px;
}

td {
	color: #444444;
	padding: 8px;
	text-align: left;
}

ul {
	width: 600px;
	height: 50px;
	margin: 50px auto;
}

li {
	list-style: none;
	text-align: center;
}
</style>
<body>
	<div>
		<h3 align="center">게시판 목록</h3>
	</div>
	<div>
		<form action="" method="post" >
			<select name="f">
				<option value="b_title">제목</option>
				<option value="u_idx">작성자</option>
			</select> 
			<input type="text" name="search">
			<input type ="submit" value="검색">
		</form>
	</div>
	<br>
	<div>
		<form action="/deletePost" method="post">
			<table>
				<tr>
					<th align="center" width="5%">No.</th>
					<th align="center" width="50%">제목</th>
					<th align="center" width="10%">작성자</th>
					<th align="center" width="20%">작성일</th>
					<th align="center" width="10%">조회수</th>
					<th align="center" width="5%">일괄삭제</th>
				</tr>

				<c:forEach items="${list}" var="item" varStatus="status">

					<tr>
						<td>${item.bId}</td>
						<td><a href="/viewdetail?bid=${item.bId}">
							
								${item.bTitle}</a></td>
						<td>${item.bWriter}</td>
						<td>${item.bDateTime}</td>
						<td>조회수</td>
						<td><input type="checkbox" name="delId"
							value="${item.bId}"></td>
					</tr>
				</c:forEach>

			</table>

			<p align="right">${pagination.page}/${pagination.lastPage}</p>

			<button type="button" onclick="location.href='/reg'">글쓰기</button>
			<span><input type="submit" value="삭제"></span>
		</form>
	</div>

	<div>
		<ul>
			<c:forEach var="i" begin="${pagination.startPage }"
				end="${pagination.endPage }" step="1">
				<c:choose>
					<c:when test="${i==pagination.page}">
						<span style="font-weight: bold;">${i}</span>
					</c:when>
					<c:when test="${i!=pagination.page }">
						<span><a href="/boardlist?reqPage_=${i}">${i}</a></span>
					</c:when>
				</c:choose>
			</c:forEach>
		</ul>
	</div>
</body>
</html>