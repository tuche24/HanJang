<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/orderList.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>주문리스트</title>
</head>
<body>
	<div id="header">
		<!-- 헤더 들어갈 곳 -->
	</div>

	<div class="tit_page">주문서</div>
	<div id="main">
		<div id="content">
			<div id="user_form">
				<h2 id="tit_section">주문상품</h2>
				<div id="itemList" class="page_article">
					<div class="short_info">
						[쉐프엠] 요린이 전골 떡볶이 외 <span class="num"></span>상품을 주문합니다.
					</div>
				</div>
				<form id="form">
					<h2 class="tit_section" id="titFocusOrderer">주문자 정보</h2>
					<div class="order_section">
						<table class="goodsinfo_table">
							<tr>
								<th>보내는 분</th>
								<td>정현수</td>
							</tr>
							<tr>
								<th>휴대폰</th>
								<td>01095401451</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>tuche24@naver.com</td>
							</tr>
						</table>
					</div>
					<h2 class="tit_section1" id="divAddressWrapper">
						배송정보 <span class="desc">배송 휴무일: 샛별배송(휴무없음), 택배배송(일요일)</span>
					</h2>
<!-- 					<div class="order_section">
						<h3 class="section_crux">배송지</h3>
					</div> -->
					<div class="section_full">
						<span class="address" id="divDestination">
						<span class="default">기본배송지</span>
						<span class="addr">경기 의왕시</span>
						</span>
					</div>
					<div id="paymentMethodResult">
					<input type="submit" value="결제하기" class="btn_payment" />
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>