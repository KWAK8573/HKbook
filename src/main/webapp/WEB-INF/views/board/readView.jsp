<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<title>게시판</title>
	</head>
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
				<form role="form" method="post">
					<table>
						<tbody>
							<tr>
								<td>
									<label for="review_id">글 번호</label><input type="text" id="review_id" name="review_id" value="${read.review_id}"/>
								</td>
							</tr>	
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
				</form>
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
					      </li>
					    </c:forEach>   
					  </ol>
					</div>
			</section>
			<hr />
		</div>
	</body>