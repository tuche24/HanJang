<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/mypageStyle.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
	window.onload = function() {
		const result = "${msg}";
		if(result == 'updateSuccess') {
			swal.fire({
				icon:'success',
				title:'회원 관련 안내',
				text:'회원 정보가 수정되었습니다.'
			});
		}
	}
</script>
</head>
<body>
<!-- header부분 -->
<div id="header"></div>
<div class="contentPane">
<!-- 좌측 세로 메뉴 시작 -->
<div class="left_menu">
<div class="title">마이 페이지</div>	<!-- 타이틀 -->
<ul>
	<li><a href="mypageOrderList.do">주문내역 조회&nbsp;&nbsp;&nbsp;&nbsp;></a></li>
	<li><a href="mypageMyInfo.do">회원정보 수정&nbsp;&nbsp;&nbsp;&nbsp;></a></li>
</ul>
</div>
<!-- 좌측 세로 메뉴 끝 -->
<!-- 내용 부분 -->
<div class="contents">
<span class="subtitle">회원정보 수정</span>
<hr class="headline">
<div class="contents_fontsize">
<form action="updateMyInfo.do">
<table class="info_table">
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id" value="<%= session.getAttribute("loginVO")%>" class="input_text_f" readonly></td>
	</tr>
	<tr>
		<td>새 비밀번호<span id="startag">*</td>
		<td><input type="password" name="password" maxlength="50" class="input_text_f" required></td>
	</tr>
	<tr>
		<td>닉네임<span id="startag">*</td>
		<td><input type="text" name="nickname" maxlength="50" class="input_text_f" value="<%= session.getAttribute("loginNick") %>" placeholder="8자이하로 입력하세요" required></td>
	</tr>
	<tr>
		<td>이름<span id="startag">*</td>
		<td><input type="text" name="name" maxlength="50" class="input_text_f" value="<%= session.getAttribute("loginName") %>" placeholder="이름을 입력해주세요" required></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email" maxlength="50" class="input_text_f" id="email" value="<%= session.getAttribute("loginEmail") %>" placeholder="ex)ggggg@gmail.com"></td>
	</tr>
	<tr>
		<td>휴대전화</td>
		<td><input type="text" name="phone" class="input_text_f" value="<%= session.getAttribute("loginPhone") %>" placeholder="숫자만 입력해주세요"></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><input type="text" size="45" name="address" value="<%= session.getAttribute("loginAddress") %>" class="input_text_f"></td>
	</tr>
</table>
<br><div style="text-align:center;">
<input type="submit" value="수정" class="butt" style="margin-right:10px;">  
<input type="button" value="탈퇴" style="background:white; border:1px solid; border-image:linear-gradient(61deg, #7effa8, #3fcbff); border-image-slice: 1;" class="butt">
</div>
</form>
</div>
</div>
</div>
<!-- footer부분 -->
<div id="footer"></div>
</body>
</html>