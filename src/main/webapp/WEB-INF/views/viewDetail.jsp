<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<style>
div {
	width: 60%;
	margin: 0 auto;
}

.a {
	border: 1px solid #444444;
	border-collapse: collapse;
	width: 100%;
	margin: 0 auto;
}

</style>
<body>
	<div>
		<p>
			<button type="button" onclick="location.href='/boardlist'">돌아가기</button>
		</p>
		<table class="a">
			<tr>
				<th height="30"class="a" align="center">${board.bTitle }</th>
			</tr>
			<tr>
				<td class="a" align="right">작성자 : ${board.bWriter} / 조회수: ${board.bHit }</td>
			</tr>
			<tr>
				<td class="a" align="right">${board.bDateTime}</td>
			</tr>
<%--  			<tr>
				<td class="a" align="left"> 첨부파일 : 
				<c:forEach items="${fileName}" var="fileName" varStatus="status">
				<a download href= "./upload/${fileName}">${fileName}</a>
				</c:forEach>
				</td>		
			</tr> --%>
			<tr>
				<td height="300" class="a" align="center">
					<img src="/images/img.jpg" style="width: 500px; height: 500px;"/>
				</td>
			</tr>
		</table>
	</div>
	<div align="right">
		<br>
		<button type="button"
			onclick="location.href='/fixPost?bid=${board.bId}&&bwriter=${board.bWriter}'">수정</button>
		<button type="button"
			onclick="location.href='/viewDelete?bid=${board.bId}&&bwriter=${board.bWriter}'">삭제</button>
		<button type="button"
			onclick="location.href='/regComment?bid=${board.bId}&&groups=${board.groups}&&orders=${board.orders}&&depth=${board.depth}'">답글
			작성</button>
	</div>
	<br>
<%-- 	<div id="commentList">
			<p>${count}개의 댓글</p>
			<p>
				<textarea rows="5" cols="50" ></textarea> 
				<button type="button" class="ReplyReg">등록</button>
			</p>
			<br>
		<c:forEach items="${replys}" var="replys" varStatus="status">
			<table>
				<tr>
					<td>${replys.con}</td>
				</tr>
				<tr>
					<td>${replys.c_date}</td>
				</tr>
				<tr>
					<td>작성자 : ${replys.u_idx}</td>
				</tr>
				<tr> 
					<td>
				 		<button type="button" class="btnReply">답글작성</button>
						<button type="button" onclick="location.href='delete-reply.do?c_num=${replys.c_num}&&b_idx=${replys.b_idx}&&u_idx=${replys.u_idx}'">삭제</button>
					</td> 
				</tr>
				<tr style="display:none;"> 
					<td>
						<textarea rows="5" cols="50"></textarea>
				 		<button type="button" class="btnReplyReg" groups="${replys.groups}" order="${replys.orders}" depth="${replys.depth}">작성</button>
						<button type="button" class="cancel">취소</button>
					</td> 
				</tr>
			</table>
		</c:forEach>
		<hr>
	</div> --%>
<!-- <script>
$(document).on('click', '.btnReply', function () {
	$(this).parent().parent().next().show();
});

$(document).on('click', '.btnReplyReg', function () {
	let bId = '${Post.b_idx }';
	let content = $(this).prev().val();
	let group = $(this).attr("groups");
	let order = $(this).attr("order");
	let depth = $(this).attr("depth");
	
	$.ajax({
		  method: "POST",
		  url: "/lcomputerstudy/reg-reply.do",
		  data: { bidx: bId, c_content: content, groups: group, orders: order, depths: depth}
		})
	  .done(function( html ) {
		  $('#commentList').html(html);
	  })
		.fail(function( html){
			location.href = "http://localhost:8080/lcomputerstudy/user-login.do";
		})
});

$(document).on('click', '.ReplyReg', function () {
	let bId = '${Post.b_idx }';
	let content = $(this).prev().val();
	
	$.ajax({
		  method: "POST",
		  url: "/lcomputerstudy/reg-reply.do",
		  data: { bidx: bId, c_content: content}
		})
	  .done(function( html ) {
	    $('#commentList').html(html);
	  })
		.fail(function( html){
		location.href = "http://localhost:8080/lcomputerstudy/user-login.do";
	})
});

$(document).on('click', '.cancel', function () {
	$(this).parent().parent().hide();
});
</script>	 -->
</body>
</html>