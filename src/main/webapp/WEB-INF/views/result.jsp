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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
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
.chart {
	width : 30px;
	height : 30px;
}
</style>
</head>
<body>
	<h2 align="center"> ${survey.s_num}번 설문 응답 결과</h2>

	<br>
	<div>
		<table>
			<th><input type="hidden">${survey.title}</th>
			<tr>
				<td><input type="hidden">${survey.disc}</td>
			</tr>
		</table>
		<br>
		<br>
	</div>
	<div>
		<c:forEach items="${q}" var="q" varStatus="status">
			<p>질문 : ${q.q}</p>
			<hr>
			<c:forEach items="${a}" var="a" varStatus="status">
				 <c:if test="${a.q_num eq q.q_num }"> 
            		 <c:if test="${a.t eq '1' || a.t eq '2' }">
            			<p>- ${a.a}</p> 
            		</c:if>
					<c:if test="${a.t eq '3'}">
            			<div style="width: 55%; height: 55%">
            				<canvas class="chart" id="pie-chart" ></canvas>  
            			</div>
            			<input type="hidden" class="radio" a="${a.a}" cnt=" ${a.cnt}"/>
					</c:if>
					<c:if test="${a.t eq '4'}">
						<div style="width: 80%; height: 90%">
							<canvas class="chart" id="bar-chart"></canvas>
						</div>
            			<input type="hidden" class="check" a="${a.a}" cnt=" ${a.cnt}"/>
					</c:if>
					<c:if test="${a.t eq '5'}">
            			<div style="width: 55%; height: 55%">
            				<canvas class="chart" id="pie-chart2"></canvas> 
            			</div>
            			<input type="hidden" class="drop" a="${a.a}" cnt=" ${a.cnt}"/>
					</c:if>
   				 </c:if>
			</c:forEach>
		</c:forEach>
	</div>
		<br>
<script>

let label = [];
let num = [];
let colors = [];
$('.radio').each(function(index) {
	label.push($(this).attr('a'));
	num.push($(this).attr('cnt'));
});
for(var i = 0; i < label.length; i++) {
	colors.push('rgba(255, 99, 132, 0.2)');
}

new Chart(document.getElementById("pie-chart"), {
	
    type: 'pie',
    data: {
      labels: label,
      datasets: [{
        label: "Population (millions)",
        backgroundColor: colors,
        data: num
      }]
    },
    options: {
      title: {
        display: true,
        text: 'Radio Answers'
      }
    }
});
	
	
let Clabel = [];
let Cnum = [];
let Ccolors = [];
$('.check').each(function(index) {
	Clabel.push($(this).attr('a'));
	Cnum.push($(this).attr('cnt'));
});
for(var i = 0; i < Clabel.length; i++) {
	Ccolors.push("#8e5ea2");
}

new Chart(document.getElementById("bar-chart"), {
    type: 'bar',
    data: {
      labels: Clabel,
      datasets: [
        {
          label: "Population (millions)",
          backgroundColor: Ccolors,
          data: Cnum
        }
      ]
    },
    options: {
      legend: { display: false },
      title: {
        display: true,
        text: 'CheckBox Answers'
      }
    }
});

let dlabel = [];
let dnum = [];
let dcolors = [];
$('.drop').each(function(index) {
	dlabel.push($(this).attr('a'));
	dnum.push($(this).attr('cnt'));
});
for(var i = 0; i < label.length; i++) {
	dcolors.push("#3e95cd");
}

new Chart(document.getElementById("pie-chart2"), {
	
    type: 'pie',
    data: {
      labels: dlabel,
      datasets: [{
        label: "Population (millions)",
        backgroundColor: dcolors,
        data: dnum
      }]
    },
    options: {
      title: {
        display: true,
        text: 'Dropdown Answers'
      }
    }
});
</script>
</body>
</html>