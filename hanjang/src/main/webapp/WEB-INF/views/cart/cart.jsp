<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/cartStyle.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
//숫자 3자리 콤마찍기

Number.prototype.formatNumber = function(){
    if(this==0) return 0;
    let regex = /(^[+-]?\d+)(\d{3})/;
    let nstr = (this + '');
    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
    return nstr;
};

	document.addEventListener('DOMContentLoaded', function() {
		/* 선택삭제 버튼을 눌렀을 시 완료*/
		document.querySelectorAll('#cancel_btn').forEach(function(item, idx) {
			item.addEventListener('click', function() {
				basket.delItem(idx + 1);
			});
		});

		/* 수량변경버튼 클릭시 기능구현 및 ajax 해야함 */
		document.querySelectorAll('.updown').forEach(function(item, idx) {
			// 수량 입력 필드 값 변경

			item.children[2].addEventListener('click', function() {
				basket.changePNum(idx + 1);
			});

			// 수량 감소 화살표 클릭
			item.children[0].addEventListener('click', function() {
				basket.changePNum(idx + 1);
			});
		});

		// 선택삭제 버튼을 클릭시
		document.querySelector('.btn_delete').addEventListener('click', function(){
			basket.delCheckedItem();
			
			basket.reCalc();
			basket.updateUI();
		}); 
		
		basket.reCalc();
		basket.updateUI();

	});

	let basket = {

		totalCount : 0, // 전체 개수 변수
		totalPrice : 0, // 전체 합계액 변수

		// 재계산
		reCalc : function() {
			this.totalCount = 0;
			this.totalPrice = 0;
			document
					.querySelectorAll(".p_num")
					.forEach(
							function(item) {
								var count = parseInt(item.getAttribute('value'));
								this.totalCount += count;
								var price = item.parentElement.previousElementSibling.firstElementChild
										.getAttribute('value');
								this.totalPrice += count * price;
							}, this);
		},

		// 화면 업데이트
		updateUI : function() {
			document.querySelector('.price').textContent = '합계금액 : '
					+ this.totalPrice.formatNumber() + '원';
			
			// 총 개수
			getTotalcheckedCnt();
			// 선택된 체크박스 구하기
			getCheckedCnt();
		},

		// 개별 수량 변경
		changePNum : function(idx) {
			// 아이템 카트별 분류
			let cartNo = document.querySelector('#cartNo_hidden' + idx)
					.getAttribute('value');
			let item = document.querySelector('#p_num' + cartNo);
			let p_num = parseInt(item.getAttribute('value'));
			let newval = event.target.classList.contains('amount_inc') ? p_num + 1
					: event.target.classList.contains('amount_dec') ? p_num - 1
							: event.target.value;
			if (parseInt(newval) < 1) {
				swal("구매 횟수 제한", "책은 1권 이상 구매 할 수 있습니다.", "warning");
				newval = 1;
			}
			if (parseInt(newval) > 5) {
				swal("구매 횟수 제한", "구매 제한은 5권입니다.", "warning");
				newval = 5;
			}
			item.setAttribute('value', newval);
			item.value = newval;
			var price = item.parentElement.previousElementSibling.firstElementChild
					.getAttribute('value');
			item.parentElement.nextElementSibling.textContent = (newval * price).formatNumber()
					+ '원';
			// ajax
			let params = {
				cartNo : cartNo,
				amount : newval
			}
			$.ajax({
				type : "POST",
				url : "updateCart.do",
				data : params,
				success : function(res) {
					console.log("동기화성공");
				},
				error : function() {
					console.log("동기화실패");
				}
			});
			// ajax-end
			// 전송 성공
			this.reCalc();
			this.updateUI();
		},

		// 상품 삭제 // 완료
		delItem : function(idx) {
			// ajax
			let cartNo = document.querySelector('#cartNo_hidden' + idx)
					.getAttribute('value');
			alert(cartNo);

			var params = {
				cartNo : cartNo
			}

			$.ajax({
				type : "POST",
				url : "deleteCart.do",
				data : params,
				success : function(res) {
					console.log("동기화성공");
				},
				error : function() {
					console.log("동기화실패");
				}
			});
			// ajax-end
			// event.target 이란 이벤트가 일어날 객체
			event.target.parentElement.parentElement.remove();
		},
		
 		// 삭제 구현
		delCheckedItem: function(){
			
			document.querySelectorAll("input[name=Checkitem]:checked").forEach(function(item, idx){
				
			basket.delCheck(idx+1);

			});
			
		},
		
		delCheck: function(idx){
			let cartNo = document.querySelector('#cartNo_hidden' + idx).getAttribute('value');
			alert(cartNo);
			
			var params = {
					cartNo : cartNo
				}

				$.ajax({
					type : "POST",
					url : "deleteCart.do",
					data : params,
					success : function(res) {
						console.log("동기화성공");
					},
					error : function() {
						console.log("동기화실패");
					}
				});
				// ajax-end
				
			  document.querySelector('#cartNo_hidden' + idx).parentElement.remove(); 
		}
		
		
	}

	// 체크박스 선택된 개수 가져오기
	function getCheckedCnt() {
		const query = 'input[name="Checkitem"]:checked';
		const selectedElements = document.querySelectorAll(query);
		// 선택된 목록의 개수 세기
		const selectedElementsCnt = selectedElements.length;
		// 출력
		document.getElementById('choicedCheckbox').innerText = selectedElementsCnt;
	}

	// 체크박스에 체크된 개수 구하기
	function getTotalcheckedCnt() {
		const query1 = 'input[name="Checkitem"]';
		const selectedElements1 = document.querySelectorAll(query1);
		// 선택된 목록의 개수 세기
		const selectedElementsCnt1 = selectedElements1.length;
		document.getElementById('totalCheckbox').innerText = selectedElementsCnt1;
	}
	
	// 전체선택 체크박스 선택시 체크박스 설정
	function selectAll(selectAll){
		const checkboxes = document.querySelectorAll('input[type="checkbox"]');
		
		checkboxes.forEach((checkbox) => {
			checkbox.checked = selectAll.checked
		})
		
		basket.updateUI();
	}
	
	
</script>

<title>장바구니1</title>
</head>
<body>

	<div id="container">
		<div id="title_wrap">장바구니</div>
		<div id="main">
			<div id="content">
				<div id="cartItemList">
					<div class="cart_item">
						<label class="check"> <input type="checkbox"
							name="checkAll" onclick="selectAll(this)" checked /> 전체선택 (&nbsp<span
							id='choicedCheckbox'></span>&nbsp/&nbsp<span id="totalCheckbox"></span>&nbsp)
						</label>
						<button class="btn_delete">선택삭제</button>
					</div>
					<hr id="two_1">
					<div id="items">
						<!-- 카트에 저장되어있는 상품들 출력 -->
						<c:if test="${empty cartList}">
							<h1>장바구니에 담긴 상품이 없습니다</h1>
						</c:if>

						<c:if test="${not empty cartList}">
							<c:forEach items="${cartList}" var="cart" varStatus="status">
								<div id="item">
									<div id="category">${cart.bookVO.categoryName}</div>
									<input type="checkbox" name="Checkitem"
										onclick="getCheckedCnt()" checked> <img
										src="${cart.bookVO.coverLargeUrl}" id="bookimg"> <span
										id="bookname"> ${cart.bookVO.title} </span> <input
										type="hidden" id="cartNo_hidden${status.count}"
										value="${cart.cartVO.cartNo}" /> <span><input
										type="hidden" id="book_priceStandard"
										value="${cart.bookVO.priceStandard}" /></span> <span class="updown">
										<button id="amount_dec" class="amount_dec"
											style="cursor: pointer;">-</button> <input type="text"
										name="p_num${cart.cartVO.cartNo}"
										id="p_num${cart.cartVO.cartNo}" class="p_num" size="2"
										maxlength="2" value="${cart.cartVO.amount}" readonly>

										<button id="amount_inc" class="amount_inc"
											style="cursor: pointer;">+</button>
									</span> <span id="bookprice"><fmt:formatNumber
											value="${cart.bookVO.priceStandard * cart.cartVO.amount}"
											pattern="#,###" />원</span> <span id="cancel_btn">
										<button>X</button>
									</span>
									<hr>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<div class="inner_result">
					<div class="cart_delivery">
						<h3 class="tit">배송지</h3>
						<div class="address">
							<p class="addr">
								<c:if test="${empty sessionScope.memberVO}">
								LoginVO session이 필요합니다
								<!-- 주소 출력 -->
								</c:if>
								<c:if test="${not empty sessionScope.memberVO}">
								${sessionScope.memberVO.address}
								<!-- 나중에 주소 넣을 것 -->
								</c:if>
							</p>
							<div class="delivery">택배배송</div>
							<a href="#" class="btn">배송지 변경</a>
						</div>
					</div>
					<div class="amount_view">
						<dl class="amount">
							<dt class="tit">상품금액</dt>
							<dd class="price"></dd>
						</dl>
					</div>
					<div class="btn_submit">
						<button class="btn active">주문하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>