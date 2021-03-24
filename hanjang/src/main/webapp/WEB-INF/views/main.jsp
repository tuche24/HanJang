<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="stylesheet" type="text/css" href="">
<!--  검색어  -->

<script>
	window.addEventListener("resize", homzzang);
	function homzzang() {
		var windowWidth = $(window).width();
		if (windowWidth < 1100) {
		  
			$('.follow').css("display", "none");
		} else {
			$('.follow').css("display", "block");
		}

	}
	
</script>

<script>
$(document).ready(function(){
	
	$(window).scroll(function(){
		var floatPosition = parseInt($(".follow").css('top'))
		var rollit = $(this).scrollTop() >= 280;
		var rollit2 = $(this).scrollTop() >= 450;
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
		 var currentTop = $(window).scrollTop();

		 //이동 애니메이션
		 if(rollit2){
		 $(".follow").stop().animate({
		   "top" : currentTop+250+"px"
		 }, 570);
		 }
	});
	

	
	
});


</script>
<!-- 검색어 -->
<script>
$(document).ready(function(){
	
	$(".search_text").keyup(function(){
       $ajax({
    	url:"/search.do",
    	type:"json",
    	success : function(data){
    		resultHtml(data);
    	},
    	error : function(){ alert("로딩실패!");}
    	  
       });
	});
	
});

</script>

<script>
$(function(){
	var widthh = $(".slide").outerWidth();
	  var $panel = $(".slide_img").find("ul");
	  var rolling
      var itemWidth = $panel.children().outerWidth(); // 아이템 가로 길이
      var itemLength = $panel.children().length;      // 아이템 수
      
      auto();
	function auto(){
    	  
	rolling = setInterval(rollingStart,3000);
      }
	
	function stop(){
		clearInterval(rolling);
	}
	 $panel.mouseover(function() {
       stop();
     });

     // 배너 마우스 아웃 이벤트
     $panel.mouseout(function() {
         auto();
     });
     
     $(".prev input").on("click", function() {
			stop();
			backslide();
			auto();
		});

      $(".next input").on("click", function() {
    	  stop();
    	  rollingStart();
			auto();
		});

	function rollingStart(){
		 $panel.css("width", itemWidth * itemLength);
         $panel.animate({"left": - itemWidth + "px"}, function() {
             $(this).append("<li>" + $(this).find("li:first").html() + "</li>");
            $(this).find("li").css("width","25%");
             $(this).find("li:first").remove();

             $(this).css("left", 0);
	  });
	  	
	}
	function backslide(){
		 $panel.css("left", - itemWidth);
         $panel.prepend("<li>" + $panel.find("li:last").html() + "</li>");
         $panel.animate({"left": "0px"}, function() {
             $(this).find("li:last").remove();
	  });
		
	}
});


</script>
<script>

function smallprevclick(){
	var ml1 = $(".intro_book_slide ul").css("marginLeft");
	if(ml1=="-2192px"){
	$(".intro_book_slide ul").animate({marginLeft:"-1096px"},400);
	$(".smallnext a").css("visibility","visible");
	}else if(ml1=="-1096px"){
		$(".intro_book_slide ul").animate({marginLeft:"0"},400);
		$(".smallprev a").css("visibility","hidden");
	}
}

function smallnextclick(){
	var ml1 = $(".intro_book_slide ul").css("marginLeft");
	if(ml1=="0px"){
	$(".intro_book_slide ul").animate({marginLeft:"-1096px"},400);
	$(".smallprev a").css("visibility","visible");
	}else if(ml1=="-1096px"){
		$(".intro_book_slide ul").animate({marginLeft:"-2192px"},400);
	$(".smallnext a").css("visibility","hidden");
	}
}


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
background:red;
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

.slide_container{
height:400px;
}
.search{
line-height:45px;
width:300px;
margin-left:10px;}

.intro_book{
height:500px;
background:white;}

.prev input, .next input{
width:30px;
height:400px;
background:#ffffff00;
border:0;
outline:0;
cursor:pointer;
}
.prev, .next{
z-index:7777;
position:absolute;
}
.next{
overflow:hidden;
right:0px;
}
.slide div{
float:left;
}
.prev input:hover, .next input:hover{
background:#ffffff45;
}
.slide{
overflow:hidden;
min-width:1280px;
max-width:100%;
height:400px;
}
.today_book{
width:1100px;
margin:auto;
height:500px;
background:white;
}
.eventintro{
min-width:1100px;
margin:20px auto;
height:640px;
background:#f7f7f7;
margin-top:50px;
}
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
.slide_img ul{
width:400%;
height:400px;
position:relative;
}
.slide_img{
min-width:100%;
position:relative;
}
.slide_img ul li{
width:25%;
height:100%;
float:left;
position:relative;
}
.slide_img ul li a {
width:100%;
height:100%;
}
.slide_img ul li a img{
width:100%;
height:100%;
}
.bookslide_title{
height:90px;
background:white;
line-height:90px;
}
.intro_book_slide{
max-width:1096px;
height:500px;
margin:auto;
background:white;
overflow:hidden;
position:relative;
}
.intro_book_slide ul{
width: 311%;
position:relative;}
.intro_book_slide ul li{
width:258px;
height:500px;
position:relative;
margin:0 8px;
float:left;
}
.intro_book_slide ul li div{
width:258px;
height:120px;
}
.intro_book_slide ul li a{
display:block;
position:relative;
overflow:hidden;
width:258px;
height:380px;
}
.intro_book_slide ul li a img{
width:100%;
height:100%;
}
.today_book div{
float:left;

}

.eventintro_tit{
height:100px;
text-align:center;
line-height:100px;
}
.today_book_bookintro{
margin-top:120px;
text-align:right;
width:550px;
}
.today_book_bookintro span{
font-weight:500;
font-size:32px;
margin-right:116px;

}
.today_book_bookintro hr{
margin-top:20px;
margin-left:214px;
width:222px;
}
.eventintro_event{
background:#f7f7f7;
height:520px;
max-width:1098px;
margin:auto;
position:relative;}
.eventintro_event ul{
max-width:1098px;
position:relative;
}
.eventintro_event ul li{
float:left;
width:344px;
height:420px;
margin:35px 11px;
background:white;
}
.eventintro_event ul li a{
display:block;
width:100%;
height:380px;
background:yellow;
}
.eventintro_event ul li div{
text-align:center;
font-size:26px;
}

.smallprev, .smallnext{
position:absolute;
z-index:888;
top:180px;
}
.smallprev a{
display:block;
width:30px;
height:30px;
border-radius:50%;
background-image:
		url(https://blog.kakaocdn.net/dn/kZSFX/btqXFf0GS1b/fe0W4EQPhkqikYLXgYzSG1/img.png);
	background-size: cover;

}
.smallprev a:hover, .smallnext a:hover{
background:#f7f7f7;
}
.smallnext a{
display:block;
width:30px;
height:30px;
border-radius:50%;
background-image:
		url(https://blog.kakaocdn.net/dn/bWA5Bu/btqXBWt30aI/dNTXn6JWhPtnJwi3tR8Lg0/img.png);
	background-size: cover;
}
.smallnext{
right:-1px;
}
.today_book_bookimage{
width:550px;
}
.today_book_bookimage a{
display:block;
width:400px;
height:450px;
background:black;
margin-top:20px;
}

.follow{
position:absolute;
width:80px;
height:180px;
background:black;
right:20px;

}
.bookslide{
margin-top:30px;
}
</style>
</head>
<body>
<div class="headerwe"></div>
<div class="header">
<div class="usermenu" >
<ul>
<li><a href="loginform.do">로그인</a></li>
<li><a href="">회원가입</a></li>
<li><a href="">카트</a></li>
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
<form action="">
<input type="text" class="search_text" placeholder="검색어를 입력하세요"/>

<input type="submit" value="검색" class="search_sub"/>
<ul>

</ul>
</form>
</div>
</div>
</div>
<div class="main">
<div class="slide_container"> 
<div class="slide">
<div class="prev"><input type="button"  value="<"/></div>
<div class="slide_img">
<ul>
	<li><a href="detail.do?mutual=파씨오네"> <img
					src="https://blog.kakaocdn.net/dn/cR7waL/btqXu4FLKS7/vYSN9vBsWRghFL53cUO3m1/img.jpg" /></a></li>
	<li><a href="detail.do?mutual=미라이"> <img
					src="https://blog.kakaocdn.net/dn/b8Bj8p/btqXrDIuL8J/Q8j9820lZR0qnhuD8TH5y0/img.jpg" /></a></li>
	<li><a href="detail.do?mutual=진만두"> <img
					src="https://blog.kakaocdn.net/dn/UVA5M/btqXDfFWUs0/NHZbwEvQh9IMYpvekuDa60/img.jpg" /></a></li>
	<li><a href="detail.do?mutual=진만두"> <img
					src="https://blog.kakaocdn.net/dn/bz7Ch1/btqZ2bP8Cfb/cpxTpJl934jOAN6dRyZxLK/img.jpg" /></a></li>
</ul>
</div>
<div class="next"><input type="button" value=">" /></div>

</div>
</div>
<div class="bookslide">
<div style="text-align:center" class="bookslide_title"><h1>이 책 어떠세요 ?</h1></div>
<div class="intro_book">
<span class="follow">asdaasd</span>

<div class="intro_book_slide">
<div class="smallprev"><a href="#"  onclick="smallprevclick(); return false;" style="visibility:hidden;"></a></div>
<div class="smallnext"><a href="#" onclick="smallnextclick(); return false;"></a></div>
<ul>
<c:forEach items="${bookList}" var="b" begin="0" end="11">
						<li><a href="goToBookDetail.do"><img src="${b.coverLargeUrl}" alt="" /></a><div>asd</div></li>
						</c:forEach>
</ul>
</div>
</div>

</div>
<div class="today_book">
<div class="today_book_bookintro">
<span>오늘의 책 소개</span>
 <hr><br><br>
<div style="margin-left:220px;"> 책간단설명</div>
 </div>
<div class="today_book_bookimage"> 
<a href="">

</a>

</div>
</div>
<div class="eventintro">
<div class="eventintro_tit">
<h2>이벤트 안내></h2>
</div>
<div class="eventintro_event">
<ul>
<li><a href="">이미지들어올곳</a><div>이벤트이름</div></li>
<li><a href="">이미지들어올곳</a><div>이벤트이름</div></li>
<li><a href="">이미지들어올곳</a><div>이벤트이름</div></li>

</ul>


</div>
</div>
</div>
<hr style="margin:40px;">
<div class="footer">
<h1>푸터부분얍</h1>

</div>
</body>
</html>