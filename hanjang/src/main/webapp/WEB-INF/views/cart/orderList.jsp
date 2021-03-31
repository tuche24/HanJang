<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/orderList.css" />
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
<title>주문리스트</title>
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
	<div id="header"></div>

	<div class="tit_page">주문서</div>
	<div id="main">
		<div id="content">
			<div id="user_form">
				<h2 id="tit_section">주문상품</h2>
				<div id="itemList" class="page_article">
					<div class="short_info">
						<!-- forEach해서 상품 목록 가져오기 -->
						<ul>
							<c:forEach items="${orderList}" var="order" varStatus="status">
								<li><img src="${order.bookVO.coverLargeUrl}" id="bookimage" /><span
									id="bookname">${order.bookVO.title}</span><span id="bookamount"></span></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<form id="form">
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
					<div id="paymentMethodResult">
						<input type="submit" value="결제하기" class="btn_payment" />
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- footer부분 -->
	<div id="footer"></div>
</body>
</html>