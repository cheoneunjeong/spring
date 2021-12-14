<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
					<td>${replys.datetime}</td>
				</tr>
				<tr>
					<td>작성자 : ${replys.writer}</td>
				</tr>
				<tr> 
					<td>
				 		<button type="button" class="btnReply">답글작성</button>
						<button type="button" onclick="location.href='?r_num=${replys.r_num}&&bId=${replys.bId}&&writer=${replys.writer}'">삭제</button>
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
