<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/cartStyle.css">
<title>Insert title here</title>
</head>
<body>

	<div id="container">
		<div id="title_wrap">장바구니</div>
		<div id="main">
			<div id="content">
				<div id="cartItemList">
					<div class="cart_item">
						<label class="check"> <input type="checkbox"
							name="checkAll" checked /> 전체선택 (2/2)
						</label> <button class="btn_delete">선택삭제</button>
					</div>
					<hr>
					<div id="items">
						<!-- 카트에 저장되어있는 상품들 출력 -->
						<div id="item">
							<div id="category">컴퓨터</div>
							<input type="checkbox" name="Checkitem" checked> <span
								id="bookname"><img src="resources/img/new/baby/baby1.jpg" id="bookimg">
								CSS 완벽 가이드</span> <input type="number" min="1" max="10" id="bookamount"
								value="1"> <span id="bookprice">7000원</span> <span
								id="cancel_btn"><button type="submit">X</button></span>
						</div>
						<hr>
						<div id="item">
							<div id="category">청소년</div>
							<input type="checkbox" name="Checkitem" checked> <span
								id="bookname"><img src="resources/img/new/baby/baby2.jpg" id="bookimg">
								운수 좋은 날</span> <input type="number" min="1" max="10" id="bookamount"
								value="1"> <span id="bookprice">7000원</span> <span
								id="cancel_btn"><button type="submit">X</button></span>
						</div>
						<hr>
					</div>
				</div>
				<div class="inner_result">
					<div class="cart_delivery">
						<h3 class="tit">배송지</h3>
						<div class="address">
							<p class="addr">
								경기 의왕시
								<!-- 주소 출력 -->
							</p>
							<div class="delivery">택배배송</div>
							<a href="#" class="btn">배송지 변경</a>
						</div>
					</div>
					<div class="amount_view">
						<dl class="amount">
							<dt class="tit">상품금액</dt>
							<dd class="price">12,800원</dd>
						</dl>
					</div>
					<div class="btn_submit">
						<button type="submit" class="btn active">주문하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>