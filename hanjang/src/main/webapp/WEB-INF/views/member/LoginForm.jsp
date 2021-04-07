<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<%
		// 인코딩 
		request.setCharacterEncoding("UTF-8"); 
	%>
<!-- 헤더연결 -->
<script defer>
	$(document).ready(function(){
		$(".header").load("/myapp/resources/jsp/header/header.jsp");
	})
</script>
<!-- 푸터연결 -->
<script defer>
	$(document).ready(function(){
		$("#footer").load("/myapp/resources/jsp/footer/footer.jsp");
	})
</script>
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
	
	<!-- 나중에 합칠때 경로 다시 설정해주셔야 할수도 있어요. -->
	<link href='./resources/css/join_style.css' rel='stylesheet' style='text/css'/>
	
	<script type="text/javascript">
	
		function checkValue()
		{
			inputForm = eval("document.loginInfo");
			if(!inputForm.id.value)
			{

				swal.fire({
					icon:'warning',
					title:'로그인 안내',
					text:'아이디를 입력해주세요.'
				});

				inputForm.id.focus();
				return false;
			}
			if(!inputForm.password.value)
			{
				swal.fire({
					icon:'warning',
					title:'로그인 안내',
					text:'비밀번호를 입력해주세요.'
				});
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

<style>

* {
	margin: 0px;
	padding: 0px;
	list-style: none;
	text-decoration: none;
	border-collapse: collapse;
}



#wrap{
margin-top: 100px;
width:340px;
height:340px;
}
.textform{
width:340px;
height:49px;
border: 1px solid #ccc;
border-radius:4px;
}
#wrap table tr{
margin:10px auto;
}

.bar{
    float: left;
    width: 1px;
    height: 10px;
    margin: 3px 6px 0;
    background-color: #333;}
    
    .loginbuga{
    height:40px;
    margin-top:10px;
    }
.loginbuga div{
float:right;
font-size:13px;
}  
.loginbuga div a{
color:black;}  

 .logininbut{
width:340px;
height:49px;
border-radius:4px;
cursor:pointer;
font-weight:bold;
 }
    
</style>

<body>

<div class="header">

</div>
<br>
<br>

	<div id="wrap">
	<h3>로그인</h3>
		<form name="loginInfo" method="post" action="login.do" 
				onsubmit="return checkValue()" style="height:250px">
			<br><br>	
			<table>
				<tr style="margin-bottom:10px;">
					
					<td><input type="text" name="id" maxlength="50" class="textform" placeholder="아이디를 입력해주세요"></td>
				</tr> 
				<tr><td><div style="height:10px"></div></td></tr>
				<tr>
					<td><input type="password" name="password" maxlength="50" class="textform" placeholder="비밀번호를 입력해주세요"></td>
				</tr> 
			</table>
			<div class="loginbuga">
			<div><a href="gotofindpw.do">비밀번호 찾기</a></div>
			<div class="bar"></div>
			<div><a href="">아이디 찾기</a></div>
			</div>
			<div style="margin-bottom:8px;"><input type="submit" value="로그인" class="logininbut" style="border:none; background-image:linear-gradient(61deg, #7effa8, #3fcbff);"/></div>
			<div><input type="button" value="회원가입" class="logininbut" style="background:white; border:1px solid; border-image:linear-gradient(61deg, #7effa8, #3fcbff); border-image-slice: 1;" onclick="location.href='joinform.do'"/></div> 
			<!-- <input type="button" value="회원가입" onclick="goJoinForm()" />  -->
			
		</form>
		
	</div>	
		<div class="logininbut" style="margin-top:7px; margin:0 auto;"><a style="border-radius:5px;display:block;width:100%; height:100%;"" href="https://kauth.kakao.com/oauth/authorize?client_id=036ccf425c45c76afae938160b6e023e&redirect_uri=http://localhost:8081/myapp/kakaologin.do&response_type=code"><img style="width:340px;"src="resources\img\main\kakaobut2.png" /></a></div>
<!-- footer부분 -->
<div id="footer"></div>
</body>
</html>