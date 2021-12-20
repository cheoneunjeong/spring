<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<br>
			<div class="dropdown">
				<button class="dropbtn">형식 선택</button>
				<div class="dropdown-content">
					<a class="select" num="1">단답형 </a> <a class="select" num="2">장문형</a> <a class="select"  num="3">객관식질문</a> 
					<a class="select" num="4">체크박스</a> <a class="select" num="5">드롭다운</a>
				</div>
			</div>
			<br> <br>
			<textarea class="text" name="question" placeholder="질문"></textarea>
			<br>
			<p id="q"style="display: none;">
				<textarea class="text" name="answer" placeholder="옵션1"></textarea> <button type="button" class="del">삭제</button>
			</p>
			<p id="q">
				<textarea class="text" name="answer" placeholder="옵션1"></textarea> <button type="button" class="del">삭제</button>
			</p>
			<p id="next_q">
			</p>
			<button type="button" class="add">옵션추가</button>