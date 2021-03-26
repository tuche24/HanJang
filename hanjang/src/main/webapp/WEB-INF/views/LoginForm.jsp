<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<%
		// 인코딩 
		request.setCharacterEncoding("euc-kr"); 
	%>
<!-- 헤더연결 -->
<script>
	$(document).ready(function(){
		$("#header").load("/myapp/resources/jsp/header/header.jsp");
	})
</script>
	<title>로그인 화면</title>
	
	
	<!-- 나중에 합칠때 경로 다시 설정해주셔야 할수도 있어요. -->
	<link href='./resources/css/join_style.css' rel='stylesheet' style='text/css'/>
	
	<script type="text/javascript">
	
		function checkValue()
		{
			inputForm = eval("document.loginInfo");
			if(!inputForm.id.value)
			{
				swal("아이디를 입력하세요");	
				inputForm.id.focus();
				return false;
			}
			if(!inputForm.password.value)
			{
				swal("비밀번호를 입력하세요");	
				inputForm.password.focus();
				return false;
			}
		}
	
		// 회원가입 버튼 클릭시 회원가입 화면으로 이동
		function goJoinForm() {
			location.href="JoinForm.jsp";
		}	
	</script>

</head>
<body>
<!-- header부분 -->
<div id="header"></div>
	<div id="wrap">
		<form name="loginInfo" method="post" action="login.do" 
				onsubmit="return checkValue()">
		
			
			<img src="../resources/img/welcome.jpg">
			<br><br>
			
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" maxlength="50"></td>
				</tr> 
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" maxlength="50"></td>
				</tr> 
			</table>
			<br>
			<input type="submit" value="로그인"/> <br>
			<!-- <input type="button" value="회원가입" onclick="goJoinForm()" />  -->
			<input type="button" value="아이디찾기" onclick=""/>
			<input type="button" value="비밀번호찾기" onclick=""/>
		</form>
		
		
	</div>	
</body>
</html>