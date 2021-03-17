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
<table border="1" class="MainBoardLayout">
	<tr>
		<td colspan="11"><hr></td>
	</tr>
	<tr>
		<td colspan="3">제목</td>
		<td colspan="5">${post.title }</td>
		<td colspan="2">작성자</td>
		<td>${post.writer }</td>
	</tr>
	<tr>
		<td colspan="11"><hr></td>
	</tr>
	<tr>
		<td colspan="11"><textarea rows="20" cols="100" readonly>${post.content }</textarea></td>
	</tr>
	<tr>
		<td colspan="11"><hr></td>
	</tr>
	<tr>
		<td colspan="8"></td>
		<td><a href="recommendList.do">목록</a></td>
		<td><a href="recommendUpdateForm.do?boardNo=${post.boardNo }">수정</a></td>
		<td><a href="recommendDelete.do?boardNo=${post.boardNo }">삭제</a></td>
	</tr>
</table>
</body>
</html>