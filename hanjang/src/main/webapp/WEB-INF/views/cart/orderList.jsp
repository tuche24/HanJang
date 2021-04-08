<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/orderList.css" />
<link rel="shortcut icon" href="resources\img\etc\favicon.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- 헤더연결 -->
<script defer>
	$(document).ready(function() {
		$("#header").load("/myapp/resources/jsp/header/header.jsp");
	})
</script>
<!-- 푸터연결 -->
<script defer>
	$(document).ready(function() {
		$("#footer").load("/myapp/resources/jsp/footer/footer.jsp");
	})
</script>
<title>세상에서 가장 빠른 온라인 서점, 한장두장</title>
<style>
.footer div {
	float: left;
}

.footer {
	margin: 0 auto;
	width: 1050px;
	height: 300px;
}
</style>
</head>
<body>
	<!-- header부분 -->
<%@ include file="/resources/jsp/header/header.jsp" %>

	<div class="tit_page">주문서</div>
	<div id="main">
		<div id="content">
			<div id="user_form">
				<h2 id="tit_section">주문상품</h2>
				<div id="itemList" class="page_article">
					<div class="short_info">
						<!-- forEach해서 상품 목록 가져오기 -->
						<ul>
						<c:set var="col_sum" value="0"/>
							<c:forEach items="${orderList}" var="order" varStatus="status"
								begin="0">

								<li><img src="${order.bookVO.coverLargeUrl}" id="bookimage" />
									<span id="bookname">${order.bookVO.title}</span> 
									<span id="bookamount">${order.cartVO.amount}개</span>
									<span id="bookprice">
										<fmt:formatNumber value="${order.cartVO.amount * order.bookVO.priceStandard}" pattern="#,###" />원
									</span>
								</li>

									<c:set var="col_sum" value="${col_sum+ order.cartVO.amount * order.bookVO.priceStandard}"/>
							</c:forEach>
						</ul>
						<script>
							if (self.name != 'reload') {
								self.name = 'reload';
								self.location.reload(true);
							} else
								self.name = '';
							/* c:forEach 구문에서 첫번째 리스트가 안 보이는 오류 해결하기 위해 */
						</script>
					</div>
					<div id="totalPrice">총 결제금액 : <fmt:formatNumber value="${col_sum}" pattern="#,###" /><%-- <c:out value="${col_sum}"/> --%>원</div>
				</div>

				<h2 class="tit_section" id="titFocusOrderer">주문자 정보</h2>
				<div class="order_section">
					<table class="goodsinfo_table">
						<tr>
							<th>보내는 분</th>
							<td>${sessionScope.memberVO.id}</td>
						</tr>
						<tr>
							<th>휴대폰</th>
							<td>${sessionScope.memberVO.phone}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${sessionScope.memberVO.email}</td>
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
					<span class="address" id="divDestination"> <span
						class="default">기본배송지</span> <span class="addr">${sessionScope.memberVO.address}</span>
					</span>
				</div>
				<form action="goToPayment.do">
					<div id="paymentMethodResult">
						<input type="hidden" value="${orderList[0].orderListNo}" name="orderListNo" />

						<input type="submit" style="cursor: pointer;" value="결제하기" class="btn_payment" />

					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- footer부분 -->
	<%@ include file="/resources/jsp/footer/footer.jsp" %>
 
</body>
</html>