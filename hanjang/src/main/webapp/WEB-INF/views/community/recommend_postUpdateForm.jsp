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
<h2>이 책 추천해요</h2>
<form action="recommendUpdate.do">
<table>
	<tr>
		<td colspan="4"><hr></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" value="${post.title }"></td>
		<td>작성자</td>
		<td>${post.writer }</td>
	</tr>
	<tr>
		<td colspan="4"><hr></td>
	</tr>
	<tr>
		<td colspan="4"><textarea rows="20" cols="100" name="content">${post.content }</textarea></td>
	</tr>
	<tr>
		<td colspan="4"><hr></td>
	</tr>
	<tr>
		<td><a href="recommendList.do"><input type="button" value="목록"></a></td>
		<td><input type="submit" value="수정"></a></td>
	</tr>
</table>
<input type="hidden" name="boardNo" value="${post.boardNo }" />
</form>
</body>
</html>