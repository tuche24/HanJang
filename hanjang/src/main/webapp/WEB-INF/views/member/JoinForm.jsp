<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>세상에서 가장 빠른 온라인 서점, 한장두장</title>
<link rel="shortcut icon" href="resources\img\etc\favicon.ico">
<!-- css 파일 분리 -->
<!-- 	<link href="../resouces/css/join_style.css" rel="stylesheet"/> -->
	<style>
	
* {
   margin: 0px;
   padding: 0px;
   list-style: none;
   text-decoration: none;
   border-collapse: collapse;
}
.button{
	color:black;
	width:130;height:43px;
	background:white;
	border-radius:3px;
	border-radius:2px;
	font-weight:bold;
	border: solid 3px transparent;
	background-image: linear-gradient(rgba(255, 255, 255, 0), rgba(255, 255, 255, 0)), linear-gradient(61deg, #7effa8, #3fcbff );
	background-origin: border-box;
	background-clip: content-box, border-box;
	outline:none;
	cursor: pointer;
}
#wrap{
	width:1050px;
	margin: 0 auto;
	margin-top:100px;
}
.member_join_field{
	width:640px;
	margin:0 auto;
}
	.member_join_field table{
	font-weight:bold;
	font-size:14px;
}
#startag{
	color:red;
	font-size:14px;
}
#title{
  width:130px;
  height:60px;
}
.input_text_f{
	width:332px;
	height:44px;
	border: 1px solid #ccc;
}
.butt{
	width:120px;
	height:44px;
	color:black;
	background:white;
	border-radius:2px;
	font-weight:bold;
	border: solid 3px transparent;
	background-image: linear-gradient(rgba(255, 255, 255, 0), rgba(255, 255, 255, 0)), linear-gradient(61deg, #7effa8, #3fcbff );
	background-origin: border-box;
	background-clip: content-box, border-box;
	outline:none;
	cursor:pointer;
}
.two_1{
	height: 2px;
	border: none;
	background-image: -webkit-linear-gradient(45deg,#7effa8,#3fcbff);}
.footer div{
	float:left;
}
.footer{
	margin:0 auto;
	width:1050px;
	height:300px;
}
#idcheck_But{
background:gray;
}
</style>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script>
	
	
		// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수,생년월일 등등체크
	 	function checkValue()
		{
			var dateva = $('#birthdate').val();
		var datepattern = /^([0-9]){8}$/;
		var emailval = $('#email').val();
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

			//생년월일 유효성검사 추가해야됨.
		 
			
			if(!document.userInfo.id.value){
				alert("아이디를 입력하세요.");
				return false;
			}
			
			if(!document.userInfo.password.value){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
			if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
				alert("비밀번호를 동일하게 입력하세요.");
				return false;
			}
		  
			if(!datepattern.test(dateva)){
			  alert("생년월일 8자리를 정확히 입력하세요");
			  return false;
		  }

			if(!regExp.test(emailval)){
			  alert("이메일을 형식에 맞게 입력해주세요");
			  return false;
		  }
			//아이디 중복체크했는지 확인
			if(document.userInfo.idDuplication.value != "idCheck"){
				alert("아이디 중복체크를 해주세요.");
				return false;
			}    
			if(!document.userInfo.address.value){
				alert("주소를 입력해주세요.")
				return false;
			}
		
			
		} 
	
		
	</script>

	
	<script>
	function idcheck(){
		
		document.userInfo.idDuplication.value="idUncheck";
		$('#IdChecked').css("color","red");
		var userID = $('#idt').val();
		var idpatten = /^([a-z0-9]){6,12}$/;
		if(!idpatten.test($('#idt').val())){
			$('#idcheck_But').attr("disabled",true);
			$('#idcheck_But').css("cursor","default")
			$('#idcheck_But').css("background","gray")
			$('#IdChecked').html('<p class="IdChecked">영문소문자 숫자포함 6~12자를 입력하세요</p>');
		}else{
			$('#idcheck_But').attr("disabled",false);
			$('#idcheck_But').css("background-image","linear-gradient(rgba(255, 255, 255, 0), rgba(255, 255, 255, 0)), linear-gradient(61deg, #7effa8, #3fcbff )");
			$('#idcheck_But').css("background-origin","border-box");
			$('#idcheck_But').css("background-clip","content-box, border-box");
			$('#idcheck_But').css("cursor","pointer")
			$('#IdChecked').html('<p class="IdChecked">아이디 중복체크를 해주세요</p>');
		}
	}
	</script>
	<script>
	////////////////////아이디 중복체크
	function check(){
	
		var idpatten = /^([a-z0-9]){6,12}$/;
		if(!idpatten.test($('#idt').val())){
			alert("아이디양식에 맞게 입력하세요.");
			$('#IdChecked').html('<p class="IdChecked">영문소문자 숫자포함 6~12자를 입력하세요</p>');
		}else{
			$.ajax({
				url:'idcheck.do',
				type:'POST',
				data:{id:$('#idt').val()},
				success: function(data){
					if(data ==0){
						$('#IdChecked').css("color","red");
						$('#IdChecked').html('<p class="IdChecked">사용하실수 있는 아이디입니다</p>');
						$('#idcheck_But').attr("disabled",false);
						document.userInfo.idDuplication.value="idCheck";
					}else{
						$('#IdChecked').css("color","red");
						$('#idcheck_But').attr("disabled",true);
						$('#IdChecked').html('<p class="IdChecked">중복된 아이디가 존재합니다.다시입력해주세요</p>');
					}	
				}
			});
			
		}
	}
	
	
	</script>
	<script>


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
	
</head>
<body>
<%@ include file="/resources/jsp/header/header.jsp" %>
	<!-- div 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
	<div id="wrap">
	 <div class="member_join_field">
		<br><br>
		<div style="text-align:center;"><h2>회원가입</h2></div>
		<br><div style="text-align:right; font-size:12px; margin-bottom:5px;"><span id="startag">*</span>필수입력사항</div>
		<hr class="two_1">
		<br><br>
		
		
		<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
		<!-- 값 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
		<form method="post" action="JoinPro.do" name="userInfo" 
				onsubmit="return checkValue()">
			<table> 
				<tr>
					<td id="title">아이디<span id="startag">*</span></td>
					<td>
						<input type="text" name="id" maxlength="15" class="input_text_f" id="idt" pattern="^([a-z0-9]){6,12}$" placeholder="6~12자의 영문 혹은 영문과 숫자를 조합" onkeyup="idcheck()">
						<input type="button" value="중복확인" class="button" id="idcheck_But" onclick="check()" disabled="disabled">	
						<input type="hidden" name="idDuplication" value="idUncheck" />
					</td>
				</tr>
				<tr>
					<td></td>
					<td id="IdChecked" ></td>
				</tr>
				<tr>
					<td id="title">닉네임<span id="startag">*</span></td>
					<td>
						<input type="text" name="nickname" maxlength="50" class="input_text_f" placeholder="8자이하로 입력하세요">
					</td>
				</tr>
						
				<tr>
					<td id="title">비밀번호<span id="startag">*</span></td>
					<td>
						<input type="password" name="password" maxlength="50" class="input_text_f"placeholder="비밀번호를 입력해주세요">
					</td>
				</tr>
				
				<tr>
					<td id="title">비밀번호 확인<span id="startag" >*</span></td>
					<td>
						<input type="password" name="passwordcheck" maxlength="50" class="input_text_f" placeholder="비밀번호를 한번 더 입력해주세요" >
					</td>
				</tr>
					
				<tr>
					<td id="title">이름<span id="startag">*</span></td>
					<td>
						<input type="text" name="name" maxlength="50" class="input_text_f" placeholder="이름을 입력해주세요">
					</td>
				</tr>
					
				<tr>
					<td id="title">성별</td>
					<td>
						<input type="radio" name="gender" value="남" checked>남
						<input type="radio" name="gender" value="여" checked>여
					</td>
				</tr>
					
				<tr>
					<td id="title">생일</td>
					<td>
							<input type="text"  id="birthdate" name="birthdate" maxlength="50" class="input_text_f"  placeholder="ex)19990101">
							<div class="check_font" id="birth_check"></div>
					</td>
				</tr>
					
				<tr>
					<td id="title">이메일</td>
					<td>
						<input type="text" name="email" maxlength="50" class="input_text_f" id="email"placeholder="ex)ggggg@gmail.com">
						
					
					</td>
				</tr>
					
				<tr>
					<td id="title">휴대전화</td>
					<td>
						<input type="text" name="phone"  class="input_text_f" placeholder="숫자만 입력해주세요"/>
					</td>
				</tr>
				<tr>
					<td id="title">주소</td>
					<td>
						<input type="text" size="45" name="address" style="height:44px; border: 1px solid #ccc;"/>
					</td>
				</tr>
			</table>
			<br><div style="text-align:center;">
			<input type="submit" value="가입" class="butt">  
			<input type="button" value="취소" onclick=location.href='loginform.do'  class="butt">
			</div>
		</form>
		</div>
	</div>
<!-- footer부분 -->
<%@ include file="/resources/jsp/footer/footer.jsp" %> 
</body>
</body>
</html>