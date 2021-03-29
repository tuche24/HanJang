<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script>

///////스크롤이벤트종합 헤더에 포함
$(document).ready(function(){
	
	$(window).scroll(function(){
		var floatPosition = parseInt($(".follow").css('top'))
		var rollit = $(this).scrollTop() >= 280;
		if(rollit){
			$(".menubar").css("position","fixed");
			$(".menubar").css("top",0);
			$(".menubar").css("width","100%");
			$(".menubar").css("text-align","center");
			$(".search").css("position","absolute");
			$(".search").css("rigth","88px");
			$(".search").css("top","2px");
			$(".menubar").css("z-index","9999");
			$(".main_menu li").css("width","80px");	
			$(".main_menu li a").css("width","80px");
			$(".menu_container1").css("margin-left","-360px");
			$(".menubar").css("box-shadow","rgb(245 245 245) 0px 4px 3px 0px");
			$(".main_menu ").css("margin-top","10px");	
		}else{
			$(".menubar").css("position","static");
			$(".search").css("position","static");
			$(".menubar").css("text-align","center");
			$(".main_menu li").css("position","relative");
			$(".main_menu li").css("width","100px");	
			$(".main_menu li a").css("width","100px");
			$(".menu_container1").css("margin-left","0px");
			$(".main_menu ").css("margin-top","0px");	
		}
	});
	

	
	
});


</script>
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
width:150px;
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
</body>
</html>