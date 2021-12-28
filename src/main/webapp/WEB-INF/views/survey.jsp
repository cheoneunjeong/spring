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
	margin-left: auto;
	margin-right: auto;
}

table, td, th {
	border-collapse: collapse;
	border: 1px solid black;
	width: 100%;
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
	<h2 align="center" class="s_num" s_num="${survey.s_num}">설문지
		${survey.s_num}번</h2>

	<br>
	<div>
		<table>
			<th><input type="hidden" class="title" title="${survey.title}">${survey.title}</th>
			<tr>
				<td><input type="hidden" class="disc" disc="${survey.disc}">${survey.disc}</td>
			</tr>
		</table>
		<br>
		<br>
		<table>
			<c:forEach items="${qlist}" var="item" varStatus="status">
				<tr>
					<td>
						<input type="hidden" class="q" q="${item.q}" t="${item.t}"  q_num="${item.q_num}">
						${item.rownum}. ${item.q}</td>
				</tr>
				<tr>
					<td colspan="2"><c:choose>
							<c:when test="${item.t == 1}">
								<input type="text" q_num="${item.q_num}" class="short a"
									placeholder="내용을 입력해 주세요.">
							</c:when>
							<c:when test="${item.t == 2}">
								<input type="text" q_num="${item.q_num}" class="long a"
									placeholder="내용을 입력해 주세요.">
							</c:when>
							<c:when test="${item.t == 3}">
								<p class="a" q_num="${item.q_num}">
								<c:forEach items="${item.answers}" var="answer"
									varStatus="status">
										<input type="radio" name="score" class="radio"
											value="${answer.a}" /> ${answer.a}
								</c:forEach>
								</p>
							</c:when>
							<c:when test="${item.t == 4}">
								<p class="a" q_num="${item.q_num}">
								<c:forEach items="${item.answers}" var="answer"
									varStatus="status">
										<input type="checkbox" class="checkbox"
											name="number" value="${answer.a}" /> <span>${answer.a}</span>
								</c:forEach>
								</p>
							</c:when>
							<c:when test="${item.t == 5}">
								<p class="a" q_num="${item.q_num}">
									<select id="dropdown">
										<c:forEach items="${item.answers}" var="answer"
											varStatus="status">
											<option class="drop" value="${answer.a}">${answer.a}</option>

										</c:forEach>
									</select>
								</p>
							</c:when>
						</c:choose></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<br>
		<p align="right">
			<button type="button" id="submit">제출하기</button>
			<button type="button" onclick="location.href='/result'">결과보기</button>
		</p>
	</div>

	<script>
		let questions = [];
		$(document).on(
				'click',
				'#submit',
				function() {

					$('.q').each(
							function(index) {
								let q = $(this).attr('q');
								let t = $(this).attr('t');
								let q_num = $(this).attr('q_num');
								console.log(q);
								console.log(q_num);

								let answers = [];
								 $('.a').each(function(index) {
									if($(this).attr('q_num')==q_num) {
										 let a;
										 let answer;
										 if(t=='1' || t=='2') {
										 a= $(this).val();
										 answer={a};
										 answers.push(answer);
										 }
										 else if(t=='3') {
										 a=$("input[name='score']:checked").val();
										 answer={a};
										 answers.push(answer);
										 }
										 else if(t=='4') {
											$("input:checkbox[name=number]:checked").each(function() {
												 a=$(this).val();
										 answer={a};
										 answers.push(answer);
											})
										 }
										 else if(t=='5') {
										 a= $("#dropdown option:selected").val();
										 answer={a};
										 answers.push(answer);
										 }
									}
								 })
								 question={q, t, answers};
								 questions.push(question);
							})

					 let submission= {
					 s_num : $('.s_num').attr('s_num'),
					 title : $('.title').attr('title'),
					 disc : $('.disc').attr('disc'),
					 questions : questions
					 };
					 console.log(submission); 
					 
					 let surveyresult = JSON.stringify(submission);
					 $.ajax({
					 method: "POST",
					 url: "/submit",
					 data: surveyresult,
					 contentType : "application/json"
					 })
					 .done(function() {
					 console.log('success');
					 location.href="/surveylist";
					 })

				});

	</script>
</body>
</html>