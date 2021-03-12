<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	</head>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
			// 취소
			$(".list_btn").on("click", function(){
				
				location.href = "/board/list";
			})
			$(".replyWriteBtn").on("click", function(){
				  var formObj = $("form[name='replyForm']");
				  formObj.attr("action", "/board/replyWrite");
				  formObj.submit();
			});

			//댓글 수정 View
			$(".replyUpdateBtn").on("click", function(){
				location.href = "/board/replyUpdateView?review_id=${read.review_id}"
								+ "&comment_id="+$(this).attr("data-comment_id");
			});
					
		//댓글 삭제 View
			$(".replyDeleteBtn").on("click", function(){
				location.href = "/board/replyDeleteView?review_id=${read.review_id}"
					+ "&comment_id="+$(this).attr("data-comment_id");
			});
		})
	</script>
	
	<body>
	
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<nav>
			  홈 - 글 작성
			</nav>
			<hr />
			
			<section id="container">
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="review_id" name="review_id" value="${read.review_id}" />
				</form>
					<table>
						<tbody>
							<tr>
								<td>
									<label for="review_title">제목</label><input type="text" id="review_title" name="review_title" value="${read.review_title}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="review_content">내용</label><textarea id="creview_content" name="review_content"><c:out value="${read.review_content}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="user_id">작성자</label><input type="text" id="user_id" name="user_id" value="${read.user_id}" readonly />
								</td>
							</tr>
							<tr>
								<td>
									<label for="review_date">작성날짜</label>
									<fmt:formatDate value="${read.review_date}" pattern="yyyy-MM-dd hh:mm"/>					
								</td>
							</tr>		
						</tbody>			
					</table>
					<div>
				<c:if test="${login.userId == read.user_id}">
					<button type="submit" class="update_btn">수정</button>
					<button type="submit" class="delete_btn">삭제</button>
				</c:if>
					<button type="submit" class="list_btn">목록</button>	
				
				</div>
				
				<!-- 댓글 -->
					<div id="reply">
					  <ol class="replyList">
					    <c:forEach items="${replyList}" var="replyList">
					      <li>
					        <p>
					        작성자 : ${replyList.user_id}<br />
					        작성 날짜 :  <fmt:formatDate value="${replyList.comment_date}" pattern="yy-MM-dd hh:mm" />
					        </p>
					
					        <p>${replyList.comment_content}</p>
					        <div>
					        <c:if test="${login.userId == read.user_id}">
							  <button type="button" class="replyUpdateBtn" data-comment_id="${replyList.comment_id}">수정</button>
							  <button type="button" class="replyDeleteBtn" data-comment_id="${replyList.comment_id}">삭제</button>
							</c:if>
							</div>
					      </li>
					    </c:forEach>   
					  </ol>
					</div>
					<form name="replyForm" method="post">
					  <input type="hidden" id="review_id" name="review_id" value="${read.review_id}" />
					
					  <div>
					    <label for="user_id">댓글 작성자</label><input type="text" id="user_id" name="user_id" value="${login.userId}" readonly/>
					    <br/>
					    <label for="comment_content">댓글 내용</label><input type="text" id="comment_content" name="comment_content" />
					  </div>
					  <div>
					 	 <button type="button" class="replyWriteBtn">작성</button>
					  </div>
				</form>
			</section>
			<hr />
		</div>
	</body>