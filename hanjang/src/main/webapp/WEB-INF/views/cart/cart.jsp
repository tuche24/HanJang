<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/cartStyle.css">
<title>장바구니</title>
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
						</label>
						<button class="btn_delete">선택삭제</button>
					</div>
					<hr>
					<div id="items">
						<!-- 카트에 저장되어있는 상품들 출력 -->
						<c:if test="${empty cartList}">
							<h1>장바구니에 담긴 상품이 없습니다</h1>
						</c:if>

						<c:if test="${not empty cartList}">
							<c:forEach items="${cartList}" var="cart">
								<div id="item">
									<div id="category">${cart.bookVO.categoryName}</div>
									<input type="checkbox" name="Checkitem" checked> <span
										id="bookname"> <img src="${cart.bookVO.coverLargeUrl}"
										id="bookimg"> ${cart.bookVO.title}
									</span> <input type="number" min="1" max="10" id="bookamount"
										value="${cart.cartVO.amount}"> <span id="bookprice">${cart.bookVO.priceStandard * cart.cartVO.amount}원</span>
									<span id="cancel_btn"><button>X</button></span>
								</div>
								<hr>
							</c:forEach>
						</c:if>
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