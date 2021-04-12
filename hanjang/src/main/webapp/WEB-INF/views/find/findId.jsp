<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="shortcut icon" href="resources\img\etc\favicon.ico">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
	$(function() {
		$("#loginBtn").click(function() {
			location.href = 'loginform.do';
		})
	})
</script>

<style>
.w3-content .w3-card-4, .w3-hover-shadow:hover {
	box-shadow: none;
}

.id_title {
	margin-bottom: 50px;
	font-weight: bold;
}

.id {
	text-align: center;
	margin-bottom: 55px;
}

.w3-center {
	margin-top: 30px;
}

.w3-center:first-child {
	margin-bottom: 70px;
}

.w3-center:last-child {
	margin-bottom: 150px;
}

.w3-button {
	width: 150px;
	height: 40px;
	padding: 0;
	display: inline;
	border-radius: 4px;
	background-image: linear-gradient(61deg, #7effa8, #3fcbff);
	color: #fff;
	margin-top: 20px;
	border: none;
	outline: none;
	transition: all 0.5s ease-in-out 0s;
}

.w3-center button:last-child {
	margin-top: 16px!important;
}

.mybtn:hover .mybtn:focus {
	background: white;
	color: #212529;
	text-decoration: none;
}

.footer div {
	float: left;
}

.footer {
	margin: 0 auto;
	width: 1050px;
	height: 300px;
}

.footer .sns_list li img {
    width: 40px;
    height: 50px;
    padding: 10px 10px 10px 0px;
}
</style>

<title>세상에서 가장 빠른 온라인 서점, 한장두장</title>
</head>
<body>
	<!-- header부분 -->
	<%@ include file="/resources/jsp/header/header.jsp"%>
	<br><br><br>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3 class="id_title">아이디 찾기 검색결과</h3>
			</div>
			<div>
				<h5 class="id">${ id }</h5>
				<p class="w3-center">
					<button type="button" id=loginBtn
						class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">로그인</button>
					<button type="button" onclick="history.go(-1);"
						class="w3-button">이전으로</button>
				</p>
			</div>
		</div>
	</div>
	<%@ include file="/resources/jsp/footer/footer.jsp"%>
</body>
</html>