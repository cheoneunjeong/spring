<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<hr>
<br>
<div class="dropdown">
	<button class="dropbtn">형식 선택</button>
	<div class="dropdown-content">
		<a class="select" num="1">단답형 </a> <a class="select" num="2">장문형</a> <a
			class="select" num="3">객관식질문</a> <a class="select" num="4">체크박스</a> <a
			class="select" num="5">드롭다운</a>
	</div>
</div>
<br>
<br>
<textarea class="text q"  type="2" placeholder="장문형 질문"></textarea>
<br>
<p align="right">
	<input type="file" name="file" />
</p>
<p align="right">
	<input type="file" name="file" />
</p>
<p align="right">
	<button type="button" class="addquestion">+</button>
	<button class="deleteQ">삭제</button>
</p>