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
<<<<<<< HEAD
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
			<button type="button" onclick="location.href='/result?s_num=${survey.s_num}'">결과보기</button>
		</p>
	</div>

	<script>
	
		$(document).on(
				'click',
				'#submit',
				function() {
						let s_num = $('.s_num').attr('s_num');
						let answers = [];
					$('.q').each(
							function(index) {
								let q = $(this).attr('q');
								let t = $(this).attr('t');
								let q_num = $(this).attr('q_num');
								console.log(q);
								console.log(q_num);

								 $('.a').each(function(index) {
									if($(this).attr('q_num')==q_num) {
										 let a;
										 let answer;
										 if(t=='1' || t=='2') {
										 a= $(this).val();
										 answer={a , s_num, q, t};
										 answers.push(answer);
										 }
										 else if(t=='3') {
										 a=$("input[name='score']:checked").val();
										 answer={a , s_num, q, t};
										 answers.push(answer);
										 }
										 else if(t=='4') {
											$("input:checkbox[name=number]:checked").each(function() {
												 a=$(this).val();
										 answer={a , s_num, q, t};
										 answers.push(answer);
											})
										 }
										 else if(t=='5') {
										 a= $("#dropdown option:selected").val();
										 answer={a , s_num, q, t};
										 answers.push(answer);
										 }
									}
								 })
							})

					 let submission= {
					 s_num : s_num,
					 title : $('.title').attr('title'),
					 disc : $('.disc').attr('disc'),
					 answers : answers
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
=======
<h2 align="center">설문지 ${survey.s_num}번 </h2>

<br>
<div>
	<table>
		<th><input type="hidden" value="${survey.title}">${survey.title}</th>
		<tr>
			<td><input type="hidden" value="${survey.disc}">${survey.disc}</td>
		</tr>
	</table>
<br><br>
<table>
	<c:forEach items="${qlist}" var="item" varStatus="status">
>>>>>>> parent of ca29ac2 (finish regSubmission)

		<tr>
			<td><input type="hidden" value="${item.rownum}">
				<input type="hidden" value="${item.q}">
				${item.rownum}. ${item.q}</td>
		</tr>
		<tr>
			<td colspan="2">
				<c:choose>
				<c:when test="${item.t == 1}">
					 <input type="text" type="1" class="short" placeholder="내용을 입력해 주세요." >
				</c:when>
				<c:when test="${item.t == 2}">
					 <input type="text" type="2" class="long" placeholder="내용을 입력해 주세요." >
				</c:when>
				<c:when test="${item.t == 3}">
				<c:forEach items="${item.answers}" var="answer" varStatus="status">
					<p>
						<input type="radio" type="3" value="${answer.a}"/>
						<span>${answer.a}</span>
					</p>
				</c:forEach>
				</c:when>
				<c:when test="${item.t == 4}">
				<c:forEach items="${item.answers}" var="answer" varStatus="status">
					<p>
						<input type="checkbox" type="4" value="${answer.a}"/>
						<span>${answer.a}</span>
					</p>
				</c:forEach>
				</c:when>
				<c:when test="${item.t == 5}">
				<p>
						<select>
				<c:forEach items="${item.answers}" var="answer" varStatus="status">
							<option type="4" value="${answer.a}">${answer.a}</option>
					
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