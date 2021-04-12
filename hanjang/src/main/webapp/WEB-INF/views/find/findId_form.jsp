<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="shortcut icon" href="resources\img\etc\favicon.ico">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>세상에서 가장 빠른 온라인 서점, 한장두장</title>
<style type="text/css">

.w3-content .w3-card-4, .w3-hover-shadow:hover {
	box-shadow: none;
}

.id_title {
	margin-bottom: 50px;
	font-weight: bold;
}

.w3-input {
	padding-top: 20px;
}

.w3-center {
	margin-top: 30px;
}

.mybtn {
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
</head>
<body>
	<!-- header부분 -->
	<%@ include file="/resources/jsp/header/header.jsp"%>
	<br><br><br>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4 w3-auto"
			style="width: 500px; height: 400px;">
			<form action="findId.do" method="post">
				<div class="w3-center w3-large w3-margin-top">
					<h3 class="id_title">아이디 찾기</h3>
				</div>
				<div>
					<p>
						<label>이메일</label> <input class="w3-input" type="text" id="email"
							name="email" placeholder="회원가입한 이메일주소를 입력하세요" required>
					</p>
					<p class="w3-center">
						<button type="submit" id="findBtn"
							class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn">찾기</button>
						<button type="button" onclick="history.go(-1);"
							class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn">로그인으로</button>
					</p>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="/resources/jsp/footer/footer.jsp"%>
</body>
</html>