<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/communityStyle.css">
<script>
	const result = "${msg}";
	if(result == "updateSuccess") {
		alert("게시글이 수정되었습니다.");
	} else if(result == "deleteSuccess") {
		alert("게시글이 삭제되었습니다.");
	}
	
	
</script>
</head>
<body>
<div class="boardTitle">이 책 추천해요</div>
<table class="MainBoardLayout">
	<tr>
		<td colspan="11"><hr></td>
	</tr>
	<tr>
		<td>글 번호</td>
		<td colspan="7">제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>
	<tr>
		<td colspan="11"><hr></td>
	</tr>
	<c:forEach var="list" items="${list }">
	<tr>
		<td>${list.boardNo }</td>
		<td colspan="7"><a href="recommendPost.do?boardNo=${list.boardNo }">${list.title }</a></td>
		<td>${list.writer }</td>
		<td>${list.regDate }</td>
		<td>${list.viewCnt }</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="11"><hr></td>
	</tr>
	<tr>
		<td colspan="10"></td>
		<td><a href="recommendInsertForm.do">글쓰기</a></td>
	</tr>
</table>
<ul class="pagingSection">	<!-- 페이징 부분 -->
	<c:if test="${po.prev }">	<!-- 이전 버튼 -->
	<div class="pagingBtn">
		<a href="<c:url value='recommendList.do?page=${po.firstPage-1 }&countPerPage=${po.paging.countPerPage }'/>">prev</a>
	</div>
	</c:if>
	<c:forEach var="pageNum" begin="${po.firstPage }" end="${po.lastPage }">	<!-- 페이지 버튼 -->
	<div class="pagingBtn">
		<a href="<c:url value='recommendList.do?page=${pageNum }&countPerPage=${po.paging.countPerPage }'/>">${pageNum }</a>
	</div>
	</c:forEach>
	<c:if test="${po.next }">	<!-- 다음 버튼 -->
	<div class="pagingBtn">
		<a href="<c:url value='recommendList.do?page=${po.lastPage +1 }&countPerPage=${po.paging.countPerPage }'/>">next</a>
	</div>
	</c:if>
</ul>

</body>
</html>