<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
</head>
<body>
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
					<a href="/board/readView?review_id=${list.review_id}"><c:out value="${list.review_title}" /></a>
				</td>
				<td>${list.review_content}</td>
				<td>
					<fmt:formatDate value="${list.review_date}" pattern="yyyy-MM-dd hh:mm"/>
				</td>
				<td>${list.review_views}</td>
				<td>${list.total_push}</td>
			</tr>
</c:forEach>
		
 </tbody>

</table>
</body>
</html>