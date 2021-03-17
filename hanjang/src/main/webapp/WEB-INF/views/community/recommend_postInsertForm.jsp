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
<form action="recommendInsert.do" method="post">
<table>
	<tr>
		<td colspan="4"><hr></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title"></td>
		<td>작성자</td>
		<td><input type="text" name="writer"></td>
	</tr>
	<tr>
		<td colspan="4"><hr></td>
	</tr>
	<tr>
		<td colspan="4"><textarea rows="20" cols="100" name="content"></textarea></td>
	</tr>
	<tr>
		<td colspan="4"><hr></td>
	</tr>
	<tr>
		<td><input type="submit" value="등록"></td>
		<td><a href="recommendList.do"><input type="button" value="목록" /></a></td>
	</tr>
</table>
</form>
</body>
</html>