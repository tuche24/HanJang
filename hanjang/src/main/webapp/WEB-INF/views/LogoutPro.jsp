<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<!-- jquery 링크-->
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<!-- 헤더연결 -->
<script defer>
	$(document).ready(function(){
		$("#header").load("/myapp/resources/jsp/header/header.jsp");
	})
</script>
<!-- 푸터연결 -->
<script defer>
	$(document).ready(function(){
		$("#footer").load("/myapp/resources/jsp/footer/footer.jsp");
	})
</script>
<title>로그아웃 처리</title>
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
</head>
<body>
<!-- header부분 -->
<div id="header"></div>

	<%
		request.getSession().invalidate(); // 모든세션정보 삭제
		response.sendRedirect("LoginForm.jsp"); // 로그인 화면으로 다시 돌아간다.
		return;
	%>
<!-- footer부분 -->
<div id="footer"></div>
</body>
</html>