<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="shortcut icon" href="resources\img\etc\favicon.ico">
</head>
<body>
<!-- header부분 -->
<%@ include file="/resources/jsp/header/header.jsp" %>
<div class="boardTitle">없는 책 요청해요</div>
<div class="boardSubTitle">한장두장에 없는 도서를 입고요청하는 게시판입니다.</div>
<form action="requestInsert.do" method="post" autocomplete="off" enctype="multipart/form-data">
<table border="1" class="MainBoardLayout">
	<tr>
		<td colspan="5" style="height:20px;"><hr class="headline"></td>
	</tr>
	<tr>
		<td style="height:35px;">제목</td>
		<td colspan="4"><input type="text" name="title" style="width:75%; text-align:center; border: 3px dotted #dddddd; border-radius: 10px;" required></td>
	</tr>
	<tr style="height:20px;">
		<td colspan="5"><hr class="line"></td>
	</tr>
	<tr>
		<td style="height:35px;">작성자</td>
		<td colspan="4" style="height:30px; width:70%; text-align:center;">
		<%= session.getAttribute("loginNick") %>
		<input type="hidden" name="writerId" value="<%= session.getAttribute("loginVO") %>" />
		<input type="hidden" name="writerNick" value="<%= session.getAttribute("loginNick") %>"/></td>
	</tr>
	<tr>
		<td colspan="5"><hr class="line"></td>
	</tr>
		<tr>
		<td style="height:35px;">파일</td>
		<td colspan="4" style="height:35px;"><input type="file" name="file" style="font-size:13px; width:75%; text-align:center; border: 3px dotted #dddddd; border-radius: 10px;"></td>
	</tr>
	<tr>
		<td colspan="5"><hr class="line"></td>
	</tr>
	<tr>
		<td colspan="5"><textarea rows="20" cols="100" class="postSection_inserttxt" name="content" required>${post.content }</textarea></td>
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
<!-- footer부분 -->
<%@ include file="/resources/jsp/footer/footer.jsp" %> 
</body>
</html>