<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderComplete.css" />

<script defer>
	$(document).ready(function() {
		$("#header").load("${pageContext.request.contextPath}/resources/jsp/header/header.jsp");
	})
</script>
<!-- 푸터연결 -->
<script defer>
	$(document).ready(function(){
		$("#footer").load("${pageContext.request.contextPath}/resources/jsp/footer/footer.jsp");
	})
</script>

<title>결제 완료</title>
</head>

<body>
<div id="container">
	<div id="header"></div>

	<div class="content">
		<div class="title">
			<h2 class="title_finish">주문완료</h2>		
		</div>
		
		<div class="content_main">
			<div class="order_finish">
				<div class="finish_tit">
					<h4 class="tit_finish_tit">주문이 완료되었습니다.</h4>
					<h5 class="tit_finish_tit2">자세한 구매내역은 <strong>마이페이지 > 구매목록</strong>에서 확인하실 수 있습니다.</h5>
				</div>
				
				<div class="finish_info">
					<div class="order_info">
						<h4 class="deliver_info">배송지 정보</h4>
						<table class="table_info">
							<tbody>
								<tr>
									<th>받는사람 이름</th>
									<td>홍길동</td>
								</tr>
								<tr>
									<th>연락처</th>
									<td>010-0000-0000</td>
								</tr>
								<tr>
									<th>배송지</th>
									<td>서울특별시 종로구</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="pay_info">
						<h4 class="pay_info_tit">결제 정보</h4>
						<div class="order_price_info">
							<div class="price_inner">
								<div class="price_list">
									<ul>
										<li class="pay_sum">
											<span class="price_title">결제금액</span>
											<span class="price_desc">
												<strong class="price">10000</strong>원
											</span>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>					
				</div>
				
				<div class="finish_btn">
					<button class="go_main" onclick="location='mainAll.do'">메인으로</button>
					<button class="go_pay_list" onclick="location='#'">구매내역 확인</button>
				</div>
			</div>
		</div>
	</div>
	
	<div id="footer"></div>
</div>
</body>
</html>