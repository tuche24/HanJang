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
	<title>로그아웃 처리</title>
</head>
<body>
<!-- header부분 -->
<div id="header"></div>

	<%
		session.invalidate(); // 모든세션정보 삭제
		response.sendRedirect("../view/LoginForm.jsp"); // 로그인 화면으로 다시 돌아간다.
	%>
</body>
</html>