<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>

<!-- 헤더연결 -->
<script defer>
	$(document).ready(function(){
		$("#header").load("/myapp/resources/jsp/header/header.jsp");
	})
</script>
	<title>탈퇴 화면</title>
	
	<style type="text/css">
		table{
			margin-left:auto; 
			margin-right:auto;
			border:3px ;
		}
		
		td{
			border:1px ;
		}
		
		#title{
			background-color:white;
		}
	</style>
	
	<script type="text/javascript">
		// 비밀번호 미입력시 경고창
		function checkValue(){
			if(!document.deleteform.password.value){
				alert("비밀번호를 입력하지 않았습니다.");
				return false;
			}
		}
	</script>
	
</head>
<body>
<!-- header부분 -->
<div id="header"></div>
	<br><br>
	<b><font size="6" color="black">내 정보</font></b>
	<br><br><br>

	<form name="deleteform" method="post" action="MainForm.jsp?contentPage=member/pro/DeletePro.jsp"
		onsubmit="return checkValue()">

		<table>
			<tr>
				<td bgcolor="black">비밀번호</td>
				<td><input type="password" name="password" maxlength="50"></td>
			</tr>
		</table>
		
		<br> 
		<input type="button" value="취소" onclick=""> <!-- 메인  -->
		<input type="submit" value="탈퇴" /> 
	</form>
</body>
</html>