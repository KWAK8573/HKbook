<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		</style>
<meta charset="UTF-8">
<title>insert title here</title>
</head>
<body>
<p><a href="/board/writeView">게시물 쓰기</a></p>
 <form role="form" method="get">
<table>
 <thead>
  <tr>
   <th>번호</th>
   <th>제목</th>
   <th>작성일</th>
   <th>작성자</th>
   <th>조회수</th>
  </tr>
 </thead>
 <tbody>
  <c:forEach items="${list}" var="list">
	<tr>

				<td>${list.review_id}</td>
				<td>${list.movie_id}</td>
				<td>${list.user_id}</td>
				<td>
					<a href="/board/readView?review_id=${list.review_id}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${list.review_title}" /></a>
				</td>
				<td>
					<fmt:formatDate value="${list.review_date}" pattern="yyyy-MM-dd hh:mm"/>
				</td>
				<td>${list.review_views}</td>
				<td>${list.total_push}</td>
			</tr>
</c:forEach>
		
 </tbody>
</table>
	<div class="search">
	    <select name="searchType">
	      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
	      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
	      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
	      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
	      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
	    </select>
	
	    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
	
	    <button id="searchBtn" type="button">검색</button>
	    <script>
	      $(function(){
	        $('#searchBtn').click(function() {
	          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
	        });
	      });   
	    </script>
	  </div>
	  <div>
	  <ul>
	    <c:if test="${pageMaker.prev}">
	    	<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
	    </c:if> 
	
	    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	    	<li><a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
	    </c:forEach>
	
	    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	    	<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
	    </c:if> 
	  </ul>
	</div>
</form>
</body>
</html>