<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세상에서 가장 빠른 온라인 서점, 한장두장</title>
<style>
.footer div{
	float:left;
}
.footer{
	margin:0 auto;
	width:1050px;
	height:300px;
}
</style>
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/communityStyle.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
	window.onload = function() {
		const result = "${msg}";
		if(result == 'insertSuccess') {
			swal.fire({
				icon:'success',
				title:'게시글 등록 안내',
				text:'게시글이 등록되었습니다.'
			});
		} else if(result == 'updateSuccess') {
			swal.fire({
				icon:'success',
				title:'게시글 수정 안내',
				text:'게시글이 수정되었습니다.'
			});
		} else if(result == 'deleteSuccess') {
			swal.fire({
				icon:'success',
				title:'게시글 삭제 안내',
				text:'게시글이 삭제되었습니다.'
			});
		}
	}
	
	// 글쓰기 버튼 클릭 시
	function postBtnClick() {
		var id = '<%= session.getAttribute("loginVO") %>';
		
		if(id == 'null') {
			swal.fire({
				icon:'warning',
				title:'로그인 안내',
				text:'로그인 후 이용하실 수 있습니다.'
			});
		} else {
			location.href="requestInsertForm.do";
		}
	}
</script>
</head>
<body>
<!-- header부분 -->
<%@ include file="/resources/jsp/header/header.jsp" %>
<div class="boardTitle">없는 책 요청해요</div>
<div class="boardSubTitle">한장두장에 없는 도서를 입고요청하는 게시판입니다.</div>
<table class="MainBoardLayout">
	<tr>
		<td colspan="11" style="height:20px;"><hr class="headline"></td>
	</tr>
	<tr class="headerTR" style="height:35px;">
		<td>글 번호</td>
		<td colspan="7">제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>
	<tr>
		<td colspan="11" style="height:10px;"><hr class="line"></td>
	</tr>
	<c:if test="${list.size() <= 0 }">
	<tr>
		<td colspan="11">게시물이 없습니다.</td>
	</tr>
	</c:if>
	<c:if test="${list.size() > 0 }">
	<c:set var="num" value="${po.postTotalCount - ((po.paging.page-1) * 10) }"/>	<!-- 글번호 jstl로 인위부여 -->
	<c:forEach var="list" items="${list }">
	<tr style="height:37px;">
		<td>${num }</td>
		<td colspan="7" style="width:250px;">
		<a href="requestPost.do?boardNo=${list.boardNo }">${list.title }</a>
		<!-- 댓글 개수 표시 부분 -->
		<c:if test="${list.reCnt > 0 }">
		 (<div style="display:inline-block; color:red;">${list.reCnt }</div>)</c:if></td>
		<td>${list.writerNick }</td>
		<td>${list.regDate }</td>
		<td>${list.viewCnt }</td>
	</tr>
	<c:set var="num" value="${num-1 }"></c:set>
	</c:forEach>
	</c:if>
	<tr>
		<td colspan="11" style="height:50px;"><hr class="line" style="margin-top:-1px; margin-bottom:-10px;"></td>
	</tr>
	<tr>
		<td colspan="10"></td>
		<td><input type="button" class="submitBtn" value="글쓰기" onclick="postBtnClick()"/></td>
	</tr>
</table>
<div class="pagingSection">	<!-- 페이징 부분 -->
	<!-- 이전 버튼 -->
	<c:if test="${po.prev }">
	<div class="pagingBtn">
		<a href="<c:url value='requestList.do?page=${po.firstPage-1 }&countPerPage=${po.paging.countPerPage }'/>">prev</a>
	</div>
	</c:if>
	<!-- 페이지 버튼 -->
	<c:forEach var="pageNum" begin="${po.firstPage }" end="${po.lastPage }">
	<!-- 현재 선택된 페이지 배경색 바꾸기 -->
	<c:choose>
	<c:when test="${po.paging.page == pageNum }">
	<div class="pagingBtn" style="background-color: #f7f7f7;">
		<a href="<c:url value='requestList.do?page=${pageNum }&countPerPage=${po.paging.countPerPage }'/>">${pageNum }</a>
	</div>
	</c:when>
	<c:otherwise>
	<div class="pagingBtn">
		<a href="<c:url value='requestList.do?page=${pageNum }&countPerPage=${po.paging.countPerPage }'/>">${pageNum }</a>
	</div>
	</c:otherwise>
	</c:choose>
	</c:forEach>
	<!-- 다음 버튼 -->
	<c:if test="${po.next }">
	<div class="pagingBtn">
		<a href="<c:url value='requestList.do?page=${po.lastPage +1 }&countPerPage=${po.paging.countPerPage }'/>">next</a>
	</div>
	</c:if>
</div>
<!-- footer부분 -->
<%@ include file="/resources/jsp/footer/footer.jsp" %> 
</body>
</html>