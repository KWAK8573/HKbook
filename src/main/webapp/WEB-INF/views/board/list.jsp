<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<style type="text/css">
li {
	list-style: none;
	float: left;
	padding: 6px;
}
</style>
<%@ include file="../include/head.jsp"%>
<body class="sb-nav-fixed">
	<!-- 상단메뉴(로고 있는 라인) -->
	<%@ include file="../include/main_header.jsp"%>
	<div id="layoutSidenav">
		<!-- 왼쪽메뉴 -->
		<%@ include file="../include/left_column.jsp"%>
		<div id="layoutSidenav_content">

			<main>
				<div class="container-fluid">
					<h1 class="mt-4">영화리뷰</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="/board/list">영화리뷰</a></li>
						<li class="breadcrumb-item active">영화리뷰</li>
					</ol>
					<body>
						<p>
							<a href="/board/writeView">게시물 쓰기</a>
						</p>
						<form role="form" method="get">
							<table>
								<div class="mb-4">
									<div class="table-responsive">
										<table class="table table-bordered" id="" width="100%"
											cellspacing="0">
											<thead>
												<tr>
													<th>글번호</th>
													<th>제목</th>
													<th>작성자</th>
													<th>등록일</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${list}" var="list">
													<tr>

														<td>${list.review_id}</td>
														<td>${list.movie_id}</td>
														<td>${list.user_id}</td>
														<td><a
															href="/board/readView?review_id=${list.review_id}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out
																	value="${list.review_title}" /></a></td>
														<td><fmt:formatDate value="${list.review_date}"
																pattern="yyyy-MM-dd hh:mm" /></td>
														<td>${list.review_views}</td>
														<td>${list.total_push}</td>
													</tr>
												</c:forEach>

											</tbody>
										</table>
										<div class="search">
											<select name="searchType">
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
											</select> <input type="text" name="keyword" id="keywordInput"
												value="${scri.keyword}" />

											<button id="searchBtn" type="button">검색</button>
											<script>
												$(function() {
													$('#searchBtn')
															.click(
																	function() {
																		self.location = "list"
																				+ '${pageMaker.makeQuery(1)}'
																				+ "&searchType="
																				+ $(
																						"select option:selected")
																						.val()
																				+ "&keyword="
																				+ encodeURIComponent($(
																						'#keywordInput')
																						.val());
																	});
												});
											</script>
										</div>
										<div>
											<ul>
												<c:if test="${pageMaker.prev}">
													<li><a
														href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
												</c:if>

												<c:forEach begin="${pageMaker.startPage}"
													end="${pageMaker.endPage}" var="idx">
													<li><a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
												</c:forEach>

												<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
													<li><a
														href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
												</c:if>
											</ul>
										</div>
										</form>
					</body>
				</div>
			</main>
			<%@ include file="../include/main_footer.jsp"%>
		</div>
	</div>
	<%@ include file="../include/plugin_js.jsp"%>
</body>
</html>