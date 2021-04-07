<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jquery 링크-->
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>

<!-- 헤더연결 -->
<script defer>
	$(document).ready(function() {
		$("#header").load("${pageContext.request.contextPath}/resources/jsp/header/header.jsp");
	})
</script>
<!-- 푸터연결 -->
<script defer>
	$(document).ready(function() {
		$("#footer").load("${pageContext.request.contextPath}/resources/jsp/footer/footer.jsp");
	})
</script>
<title>세상에서 가장 빠른 온라인 서점, 한장두장</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/book_detail.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
	$(function only_number() {
		$('#decreaseQuantity').click(function(e) {
			e.preventDefault();
			var stat = $('#count_form_input').text();
			var num = parseInt(stat, 10);
			num--;
			if (num <= 0) {
				swal.fire({
					title : '구매 횟수 제한',
					text : '책은 1권 이상 구매 할 수 있습니다.',
					icon : 'error',
					confirmButtonText: '확인'
				}) 
				num = 1;
			}

			$('#count_form_input').text(num);
		});

		$('#increaseQuantity').click(function(e) {
			e.preventDefault();
			var stat = $('#count_form_input').text();
			var num = parseInt(stat, 10);
			num++;

			if (num > 5) {
				swal.fire({
					title : '구매 횟수 제한',
					text : '구매 제한은 5권입니다.',
					icon : 'error',
					confirmButtonText: '확인'
				}) 
				num = 5;
			}

			$('#count_form_input').text(num);
			$('#val_amount').val(num);
		});

	});
</script>
<script>
	document.addEventListener('DOMContentLoaded', function(){
		document.querySelector('#addCart').addEventListener('click', function() {
			bookDetail.addOrderList();
		})
	})
	
	let bookDetail = {
			addOrderList : function(){
				let userNo = document.querySelector('#val_userNo').getAttribute("value");
				if(!userNo){
					swal.fire({
						title : 'Error!',
						text : '로그인이 필요합니다',
						icon : 'error',
						confirmButtonText: '확인'
					}) 
				} else {
					let itemID = document.querySelector('#val_itemId').getAttribute("value");
					let amount = document.querySelector('#val_amount').getAttribute("value");
					var params = {
						UserNo : userNo,
						ItemId : itemID,
						Amount : amount
					}

					$.ajax({
						type : "POST",
						url : "addCart.do",
						data : params,
						success : function(res) {
							console.log("동기화성공");
						},
						error : function() {
							console.log("동기화실패");
						}
					});
					// ajax-end
							swal.fire({
						title : '장바구니',
						text : '장바구니로 이동하시겠습니까?',
						icon : 'info',
						showCancelButton : true,
						confirmButtonColor : '#3085d6',
						cancelButtonColor : '#d33',
						confirmButtonText : '이동',
						cancelButtonText : '취소'
					}).then((result) => {
						if(result.value){
							location.href="getOneCart.do";
						}
					})
				}
			}
	}
</script>
<script>
/* 즉시구매 버튼을 눌렀을 시 책 정보를 장바구니에 담고 주문리스트 페이지로 이동 */
function addOrderList() {
	let UserNo = document.querySelector("#val_userNo").getAttribute("value");
	if (!UserNo) {
		swal.fire({
			title : 'Error!',
			text : '로그인이 필요합니다',
			icon : 'error',
			confirmButtonText: '확인'
		})
	} else {
		/* else {swal(UserNo)} */
		let itemID = document.querySelector("#val_itemId").getAttribute("value");
		/* alert(itemID); */
		let cartNo = 15;
		let amount = document.querySelector('#val_amount').getAttribute("value");
		var params = {
			UserNo : UserNo,
			ItemId : itemID,
			Amount : amount
		}

		$.ajax({
			type : "POST",
			url : "addCartToOrderList.do",
			data : params,
			success : function(res) {
				console.log("동기화성공");
			},
			error : function() {
				console.log("동기화실패");
			}
		});
		let params1 = {
			UserNo : UserNo,
			ItemId : itemID,
			Amount : amount,
			CartNo : cartNo
		}
		$.ajax({
			type : "POST",
			url : "insertOrderListDirect.do",
			data : params1,
			success : function(res) {
				console.log("동기화성공");
			},
			error : function() {
				console.log("동기화실패");
			}
		});
		// ajax-end
		swal.fire({
			title : '주문확인서',
			text : '주문확인서로 이동하시겠습니까?',
			icon : 'info',
			showCancelButton : true,
			confirmButtonColor : '#3085d6',
			cancelButtonColor : '#d33',
			confirmButtonText : '이동',
			cancelButtonText : '취소'
		}).then((result) => {
			if(result.value){
				location.href="goToOrderList.do";
			}
		}) 
	}
}
</script>
<body>
	<!-- header부분 -->
	<%@ include file="/resources/jsp/header/header.jsp" %>
	<div id="container">
		<div id="detail_title">
			<ul>
				<li><span class="title"> <strong>${bookList.title}</strong>
				</span></li>

				<li>
					<div id="info">
						<span id="author">
							${bookList.author} 
							<c:choose>
								<c:when test="${empty bookList.author}"></c:when>
								<c:otherwise>지음</c:otherwise>
							</c:choose>
						</span>
						<span>
							<c:choose>
								<c:when test="${empty bookList.author}"></c:when>
								<c:otherwise>|</c:otherwise>
							</c:choose>
						</span>
						<!-- <span id="draw">김한나 그림</span>
						<span>|</span> -->
						<span id="publication">${bookList.publisher}</span>
						<span>|</span>
						<span id="publication_date">
							<fmt:parseDate value="${bookList.pubDate}" var="pubDate1" pattern="yyyyMMdd" />
							<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${pubDate1}" />
						</span>
					</div>
				</li>
			</ul>
		</div>

		<hr>

		<div id="bookwrap">
			<div class="prod_bookwrap">
				<div class="detail_picture">
					<img src="${bookList.coverLargeUrl}" alt="" />
				</div>

				<div class="detail_order">
					<div class="price">
						<ul>
							<li>
								<div class="Litem">판매가</div>
								<div class="Ritem">
									<fmt:formatNumber value="${bookList.priceStandard}" pattern="#,###" />원
								</div>
							</li>
						</ul>
					</div>

					<div class="delivery">
						<ul>
							<li>
								<div class="Litem">배송비</div>
								<div class="Ritem">무료</div>
							</li>
							<li>
								<div class="Litem">배송위치</div>
								<div class="Ritem">
									<c:if test="${empty sessionScope.memberVO}">로그인 되어 있지 않습니다</c:if>
									${sessionScope.memberVO.address}
								</div>
							</li>
						</ul>
					</div>

					<div class="quantity">
						<ul>
							<li>
								<div class="Litem">수량</div>
								<div class="Ritem">
									<div class="count_input_box">
										<button style="cursor: pointer;"
											onclick="javascript:only_number();" id="decreaseQuantity">-</button>
										<span id="count_form_input">1</span>
										<button style="cursor: pointer;"
											onclick="javascript:only_number();" id="increaseQuantity">+</button>
									</div>
								</div>
							</li>
						</ul>
					</div>

					<div class="buy_btn">
						<div class="cart">
							<button style="cursor: pointer;" id="addCart">장바구니
								담기</button>
						</div>

						<div class="buynow">
							<button style="cursor: pointer;" onclick="javascript:addOrderList()">바로
								구매하기</button>
						</div>
					</div>
				</div>
			</div>

			<hr>

			<div class="detail_info">
				<div class="book_introduce">
					<div class="intro_title">책소개</div>
					<div class="intro_content">${textList[0]}</div>
				</div>

				<hr>

				<div class="book_author">
					<div class="author_title">저자 및 역자 소개</div>
					<div class="author_content">
						<div class="author_name">
							${bookList.author} 
							<span>
								<c:choose>
									<c:when test="${empty bookList.author}">없음 </c:when>
									<c:otherwise>(지은이)</c:otherwise>
								</c:choose>
							</span>
						</div>
						<div class="author_detail">
							${textList[1]}
						</div>
					</div>
				</div>

				<hr>

				<div class="book_preview">
					<div class="preview_title">출판사 서평</div>
					<div class="preview_content">
						<c:if test="${empty textList[2]}">출판사 서평 업데이트 예정</c:if>
						${textList[2]}
					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="val_itemId" value="${bookList.itemID}"/>
	<input type="hidden" id="val_userNo" value="${sessionScope.memberVO.userNo}"/>
	<input type="hidden" id="val_amount" value="1" />
	<!-- footer부분 -->
	<%@ include file="/resources/jsp/footer/footer.jsp" %>
</body>
</html>