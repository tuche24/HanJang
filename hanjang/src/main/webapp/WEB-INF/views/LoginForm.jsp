<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<%
		// 인코딩 
		request.setCharacterEncoding("UTF-8"); 
	%>
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
<title>로그인 화면</title>
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

<style>

* {
	margin: 0px;
	padding: 0px;
	list-style: none;
	text-decoration: none;
	border-collapse: collapse;
}

.headerwe{
height:20px;
background:linear-gradient( to right, #7effa8, #3fcbff );
box-shadow: 0 7px 3px 0 gray;
}
.header{
min-width:1050px;
max-width:100%;

}
.main{
min-width:1050px;
max-width:100%;}
.usermenu{
margin:0 150px;
height:30px;}
.usermenu ul{

float:right;}

.usermenu ul li{
float:left;
padding:15px;
}

.usermenu ul li a{
color:black;}

.logo_place{
margin:0 150px;
height:180px;
}

.logo{
margin: 0 auto;
width:140px;
height:180px;
}
.logo a{
width:100%;
height:100%;
}
.logo a img{
width:100%;
height:100%;
}




.menubar{
text-align:center;
background:white;
height:45px;
}

.main_menu li{
display:inline-block;
width:100px;
margin:0 15px;
text-align:center;	
background:white;
position:relative;
z-index:9996;
}
.main_menu li a{
display:block;
width:100px;
padding:7px 3px;
text-align:center;	
background:white;
color:black;
}
.main_menu li .dropdown{
text-align:left;
position:absolute;
top:35px;
left:-15px;
display:none;
}

.main_menu li .dropdown li {
display:inline-block;
font-size:12px;
width:100px;
text-align:left;	
background:white;
}
.main_menu li .dropdown li a:hover{
background:#f7f7f7;}



.menubar div{
display:inline-block;

}
.main_menu li:hover .dropdown{
display:block;}
.main_menu li:hover{
background:white;}


.search{
line-height:45px;
width:300px;
margin-left:10px;}

.search_text{
width:200px;
height:30px;
margin-bottom:5px;
border:0;
border-radius:5px;
}
.search_sub{
height:28px;
width:40px;
}

#wrap{
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
border:1px solid #5f0081;
border-radius:4px;
cursor:pointer;
 }
    
</style>

<body>

<div class="headerwe"></div>
<div class="header">
<div class="usermenu" >
<ul>
<c:if test="${(loginVO!=null&&loginVO!='ADMIN') ? true : false}">
						<li><a href="loginform.do">장바구니</a></li>
						<li><a href="">내정보</a></li>
						<li><a href="Logout.do">로그아웃</a></li>
						<li><a href="">카트</a></li>
					</c:if>
					<c:if test="${(loginVO=='ADMIN') ? true : false }">
						<li><a href="">회원관리</a></li>
						<li><a href="Logout.do">로그아웃</a></li>
					</c:if>
					<c:if test="${(loginVO==null) ? true : false}">
						<li><a href="loginform.do">로그인</a></li>
						<li><a href="joinform.do">회원가입</a></li>

					</c:if>

</ul>
</div>
<div class="logo_place"><div class="logo"><a href="">
<img src="https://blog.kakaocdn.net/dn/bz7Ch1/btqZ2bP8Cfb/cpxTpJl934jOAN6dRyZxLK/img.jpg" /></a></div></div>
<div class="menubar" >
<div class="menu_container1">
<ul class="main_menu">
<li class="menu1"><a href="">카테고리</a>
<ul class="dropdown">
<li><a href=""><h3>국내도서</h3></a></li>
<li><a href="">유아/어린이</a></li>
<li><a href="">소설/시/희곡</a></li>
<li><a href="">에세이</a></li>
<li><a href="">인문학</a></li>
<li><a href="">과학/역사</a></li>
<li><a href="">수험서/참고서</a></li>
<li><a href="">기타</a></li>
<li><a href=""><h3>국외도서</h3></a></li>
<li><a href="">영미소설</a></li>
<li><a href="">경제경영</a></li>
<li><a href="">자기개발</a></li>
<li><a href="">기타</a></li>
</ul></li>
<li class="menu2"><a href="">베스트셀러</a></li>
<li class="menu3"><a href="">새로나온책</a></li>
<li class="menu4"><a href="">커뮤니티</a>
<ul class="dropdown">
<li><a href="">책 추천 게시판</a></li>
<li><a href="">없는책 요청게시판</a></li>
</ul></li>
</ul>
</div>
<div class="search" >
<form id="idFrom" action="BookList.do">
<input type="text" class="search_text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" onkeyup="search()"/>
<input type="submit" value="검색" class="search_sub"/>
<ul id="searchList">

</ul>
</form>
</div>
</div>
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
			<div><a href="">비밀번호 찾기</a></div>
			<div class="bar"></div>
			<div><a href="">아이디 찾기</a></div>
			</div>
			<div style="margin-bottom:8px;"><input type="submit" value="로그인" class="logininbut" style="background:#5f0081;color:white;"/></div>
			<div><input type="button" value="회원가입" class="logininbut" style="background:white;color:#5f0081;"onclick="location.href='joinform.do'"/></div> 
			<!-- <input type="button" value="회원가입" onclick="goJoinForm()" />  -->
			
		</form>
		
	</div>	
		<div style="width:30px; height:30px;"><a style="width:30px; height:30px; background:black;" href="https://kauth.kakao.com/oauth/authorize?client_id=036ccf425c45c76afae938160b6e023e&redirect_uri=http://localhost:8081/myapp/kakaologin.do&response_type=code">카카오</a></div>
<!-- footer부분 -->
<div id="footer"></div>
</body>
</html>