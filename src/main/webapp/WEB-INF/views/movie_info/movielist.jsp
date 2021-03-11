<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>insert title here</title>
</head>
<body>
	<div>
		<%@include file = "nav.jsp" %>
	</div>
	<div class="container">
		<form role="form" method="get">
			<table class='table table-striped'>
				<thead>
					<tr>
						<th>영화소개 아이디</th>
						<th>영화 카테고리</th>
						<th>영화 아이디</th>
						<th>영화제목</th>
						<th>영화 내용</th>
						<th>영화 파일경로</th>
						<th>작성날짜</th>
						<th>조회수</th>
						<th>별점</th>
					</tr>
				</thead>

			
				<c:forEach items="${moviemovielist}" var="moviemovielist">

					<tr>
						<td><c:out value="${movielist.movie_id}" /></td>
						<td><c:out value="${movielist.category_id}" /></td>
						<td><c:out value="${movielist.user_id}" /></td>
						<td>
							<a href="/movie_info/contentView?movie_id=${movielist.movie_id}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${movielist.movie_title}" /></a>
						</td>
						<td><c:out value="${movielist.movie_content}" /></td>
						<td><c:out value="${movielist.movie_img}" /></td>
						<td><fmt:formatDate value="${movielist.movie_date}" pattern="yyyy-MM-dd"/></td>
						<td><c:out value="${movielist.movie_views}" /></td>
						<td><c:out value="${movielist.total_rating}" /></td>
					</tr>

				</c:forEach>
		
		</table>
		<div class="search row">
			<div class="col-xs-2 col-sm-2">
				<select name="searchType" class="form-control">
					<option value="n"
						<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
					<option value="t"
						<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					<option value="c"
						<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					<option value="w"
						<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					<option value="tc"
						<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
				</select>
			</div>

			<div class="col-xs-10 col-sm-10">
				<div class="input-group">
					<input type="text" name="keyword" id="keywordInput"
						value="${scri.keyword}" class="form-control" /> <span
						class="input-group-btn">
						<button id="searchBtn" type="button" class="btn btn-default">검색</button>
					</span>
				</div>
			</div>

			<script>
				$(function() {
					$('#searchBtn').click(
							function() {
								self.location = "movielist"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType="
										+ $("select option:selected").val()
										+ "&keyword="
										+ encodeURIComponent($('#keywordInput')
												.val());
							});
				});
			</script>
		</div>
		<div class="col-md-offset-3">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li><a
						href="movielist${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
						<a href="movielist${pageMaker.makeSearch(idx)}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a
						href="movielist${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>