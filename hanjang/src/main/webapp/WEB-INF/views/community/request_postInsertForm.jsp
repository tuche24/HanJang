<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/communityStyle.css">
</head>
<body>
<div class="boardTitle">없는 책 요청해요</div>
<div class="boardSubTitle">한장두장에 없는 도서를 입고요청하는 게시판입니다.</div>
<form action="requestInsert.do" method="post">
<table border="1" class="MainBoardLayout">
	<tr>
		<td colspan="5" style="height:30px;"><hr class="headline"></td>
	</tr>
	<tr style="height:38 px;">
		<td style="width:120px;">제목</td>
		<td colspan="4"><input type="text" name="title" style="width: 90%; text-align:center;" required></td>
	</tr>
	<tr style="height:30px;">
		<td colspan="5"><hr class="line"></td>
	</tr>
	<tr>
		<td style="height:30px;">작성자</td>
		<td colspan="4" style="height:30px; width: 90%; text-align:center;">
		<%= session.getAttribute("loginNick") %>
		<input type="hidden" name="writerId" value="<%= session.getAttribute("loginVO") %>" />
		<input type="hidden" name="writerNick" value="<%= session.getAttribute("loginNick") %>"/></td>
	</tr>
	<tr>
		<td colspan="5"><hr class="line"></td>
	</tr>
	<tr>
		<td colspan="5"><textarea rows="20" cols="100" class="postsection" name="content" required>${post.content }</textarea></td>
	</tr>
	<tr>
		<td colspan="5"><hr class="line"></td>
	</tr>
	<tr>
		<td colspan="5" style="text-align:right;"><div class="listANDregister">
		<a href="requestList.do" style="margin-right:20px;">목록</a>
		<input type="submit" class="submitBtn" value="등록"></div></td>
	</tr>
</table>
</form>
</body>
</html>