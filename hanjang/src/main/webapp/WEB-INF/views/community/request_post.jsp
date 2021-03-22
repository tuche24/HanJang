<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/communityStyle.css">
<script>
	$("#deleteBtn").click(function() {
		if(confirm("삭제하시겠습니까?")) {
			location.href="requestDelete.do?boardNo=${post.boardNo }"
		}
	})
</script>
</head>
<body>
<div class="boardTitle">없는 책 요청해요</div>
<div class="boardSubTitle">한장두장에 없는 도서를 입고요청하는 게시판입니다.</div>
<table border="1" class="MainBoardLayout">
	<tr>
		<td colspan="5" style="height:30px;"><hr class="headline"></td>
	</tr>
	<tr style="height:32px;">
		<td style="width:120px;">제목</td>
		<td colspan="4">${post.title }</td>
	</tr>
	<tr style="height:30px;">
		<td colspan="5"><hr class="line"></td>
	</tr>
	<tr>
		<td style="height:30px;">작성자</td>
		<td colspan="4" style="height:30px;">${post.writer }</td>
	</tr>
	<tr>
		<td colspan="5"><hr class="line"></td>
	</tr>
	<tr>
		<td colspan="5"><textarea class="postsection" rows="20" cols="100" readonly>${post.content }</textarea></td>
	</tr>
	<tr>
		<td colspan="5"><hr class="line"></td>
	</tr>
	<!-- 댓글 시작 부분 -->
	<tr>
		<td style="height:30px;">댓글
		<!-- 댓글 개수 표시 부분 -->
		 (<div style="display:inline-block; color:red;">${post.reCnt }</div>)</td>
	</tr>
	<c:if test="${!empty reply }">
	<!-- 댓글 목록 부분 -->
	<tr>
		<td>${reply.replyWriterNick }</td>
		<td>${reply.regDate }</td>
	</tr>
	<tr>
		<td colspan="5" style="background-color:#dddddd; border: none; border-radius: 10px;">${reply.replyContent }</td>
	</tr>
	<!-- 댓글 목록 부분 끝 -->
	</c:if>
	<!-- 댓글 작성 부분 -->
	<tr>
		<td colspan="5">
		<form action="requestReplyInsert.do">
			<table style="margin:auto;">
				<tr>
				</tr>
				<tr>
					<td><textarea name="replyContent" class="replysection" rows="10" placeholder="댓글을 작성해주세요."></textarea></td>
				</tr>
				<tr>
					<td>
					<!-- 로그인한 아이디 sessionScope 들어갈 hidden -->
					<input type="hidden" name="" />
					<input type="submit" class="submitBtn" value="댓글 등록" /></td>
				</tr>
			</table>
		</form>
		</td>
	</tr>
	<!-- 댓글 작성 부분 끝 -->
	<tr>
		<td colspan="5"><hr class="line"></td>
	</tr>
	<tr>
		<td colspan="4"></td>
		<td style="text-align:right;"><a href="requestList.do" style="margin-right:20px;">목록</a>
		<!-- 로그인한 사람만, 해당 글을 작성한 사람만 삭제 가능하게 해야 됨 -->
		<a href="requestUpdateForm.do?boardNo=${post.boardNo }" style="margin-right:20px;">수정</a>
		<a id="deleteBtn" style="margin-right:20px;">삭제</a></td>
	</tr>
</table>
</body>
</html>