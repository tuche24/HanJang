<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/communityStyle.css">
<style>
</style>
</head>
<body>
<div class="boardTitle">이 책 추천해요</div>
<div class="boardSubTitle">인상 깊게 읽었던 책을 공유하는 커뮤니티입니다.</div>
<form action="recommendUpdate.do">
<table border="1" class="MainBoardLayout">
	<tr>
		<td colspan="5" style="height:23px;"><hr class="headline"></td>
	</tr>
	<tr style="height:38px;">
		<td style="width:120px;">제목</td>
		<td colspan="4"><input type="text" name="title" value="${post.title }" style="width: 90%; text-align:center;" required></td>
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
		<td colspan="5"><textarea rows="20" cols="100" name="content" class="postsection" required>${post.content }</textarea></td>
	</tr>
	<tr>
		<td colspan="5"><hr class="line"></td>
	</tr>
	<tr>
		<td colspan="4"></td>
		<td style="text-align:right;"><a href="recommendList.do" style="margin-right:20px;">목록</a>
		<input type="submit" class="submitBtn" value="수정"></td>
	</tr>
</table>
<input type="hidden" name="boardNo" value="${post.boardNo }" />
</form>
</body>
</html>