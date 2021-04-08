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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- 헤더연결 -->
<script defer>
	$(document).ready(function(){
		$("#header").load("${pageContext.request.contextPath}/resources/jsp/header/header.jsp");
	})
</script>
<!-- 푸터연결 -->
<script defer>
	$(document).ready(function(){
		$("#footer").load("${pageContext.request.contextPath}/resources/jsp/footer/footer.jsp");
	})
</script>
<script>
/* 즉시구매 버튼을 눌렀을 시 책 정보를 장바구니에 담고 주문리스트 페이지로 이동 */
function addOrderList() {
	let UserNo = event.target.parentElement.parentElement.firstElementChild
			.getAttribute('value');
	if (!UserNo) {
		swal.fire({
			title : 'Error!',
			text : '로그인이 필요합니다',
			icon : 'error',
			confirmButtonText: '확인'
		})
	} else {
		/* else {swal(UserNo)} */
		let itemID = event.target.parentElement.parentElement.firstElementChild.nextElementSibling
				.getAttribute('value');
		/* alert(itemID); */
		let cartNo = 15;
		var params = {
			UserNo : UserNo,
			ItemId : itemID,
			Amount : 1
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
			Amount : 1,
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
/* 장바구니 담기 버튼을 눌렀을 시 책 정보를 장바구니에 담음 */
	function addCart(){
		let UserNo = event.target.parentElement.parentElement.firstElementChild.getAttribute('value');
		if(!UserNo){
			swal.fire({
				title : 'Error!',
				text : '로그인이 필요합니다',
				icon : 'error',
				confirmButtonText: '확인'
			}) 
		} else {
			let itemID = event.target.parentElement.parentElement.firstElementChild.nextElementSibling.getAttribute('value');
			/* alert(itemID);  */
			var params = {
				UserNo : UserNo,
				ItemId : itemID,
				Amount : 1
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
	
	$(document).ready(function() {
		var categoryId = $(".genre").val();
		
		if (categoryId == 109) {
			$("#genre1").css("display", "block");
			$("#genre2").css("display", "none");
			$("#genre3").css("display", "none");
			$("#genre4").css("display", "none");
			$("#genre5").css("display", "none");
			$("#genre6").css("display", "none");
			$("#genre7").css("display", "none");
			$("#genre8").css("display", "none");
			$("#genre9").css("display", "none");
			$("#genre10").css("display", "none");
		} else if (categoryId == 101) {
			$("#genre1").css("display", "none");
			$("#genre2").css("display", "block");
			$("#genre3").css("display", "none");
			$("#genre4").css("display", "none");
			$("#genre5").css("display", "none");
			$("#genre6").css("display", "none");
			$("#genre7").css("display", "none");
			$("#genre8").css("display", "none");
			$("#genre9").css("display", "none");
			$("#genre10").css("display", "none");
		} else if (categoryId == 102) {
			$("#genre1").css("display", "none");
			$("#genre2").css("display", "none");
			$("#genre3").css("display", "block");
			$("#genre4").css("display", "none");
			$("#genre5").css("display", "none");
			$("#genre6").css("display", "none");
			$("#genre7").css("display", "none");
			$("#genre8").css("display", "none");
			$("#genre9").css("display", "none");
			$("#genre10").css("display", "none");
		} else if (categoryId == 103) {
			$("#genre1").css("display", "none");
			$("#genre2").css("display", "none");
			$("#genre3").css("display", "none");
			$("#genre4").css("display", "block");
			$("#genre5").css("display", "none");
			$("#genre6").css("display", "none");
			$("#genre7").css("display", "none");
			$("#genre8").css("display", "none");
			$("#genre9").css("display", "none");
			$("#genre10").css("display", "none");
		} else if (categoryId == 116) {
			$("#genre1").css("display", "none");
			$("#genre2").css("display", "none");
			$("#genre3").css("display", "none");
			$("#genre4").css("display", "none");
			$("#genre5").css("display", "block");
			$("#genre6").css("display", "none");
			$("#genre7").css("display", "none");
			$("#genre8").css("display", "none");
			$("#genre9").css("display", "none");
			$("#genre10").css("display", "none");
		} else if (categoryId == 114) {
			$("#genre1").css("display", "none");
			$("#genre2").css("display", "none");
			$("#genre3").css("display", "none");
			$("#genre4").css("display", "none");
			$("#genre5").css("display", "none");
			$("#genre6").css("display", "block");
			$("#genre7").css("display", "none");
			$("#genre8").css("display", "none");
			$("#genre9").css("display", "none");
			$("#genre10").css("display", "none");
		} else if (categoryId == 205) {
			$("#genre1").css("display", "none");
			$("#genre2").css("display", "none");
			$("#genre3").css("display", "none");
			$("#genre4").css("display", "none");
			$("#genre5").css("display", "none");
			$("#genre6").css("display", "none");
			$("#genre7").css("display", "block");
			$("#genre8").css("display", "none");
			$("#genre9").css("display", "none");
			$("#genre10").css("display", "none");
		} else if (categoryId == 117) {
			$("#genre1").css("display", "none");
			$("#genre2").css("display", "none");
			$("#genre3").css("display", "none");
			$("#genre4").css("display", "none");
			$("#genre5").css("display", "none");
			$("#genre6").css("display", "none");
			$("#genre7").css("display", "none");
			$("#genre8").css("display", "block");
			$("#genre9").css("display", "none");
			$("#genre10").css("display", "none");
		} else if (categoryId == 118) {
			$("#genre1").css("display", "none");
			$("#genre2").css("display", "none");
			$("#genre3").css("display", "none");
			$("#genre4").css("display", "none");
			$("#genre5").css("display", "none");
			$("#genre6").css("display", "none");
			$("#genre7").css("display", "none");
			$("#genre8").css("display", "none");
			$("#genre9").css("display", "block");
			$("#genre10").css("display", "none");
		} else if (categoryId == 128) {
			$("#genre1").css("display", "none");
			$("#genre2").css("display", "none");
			$("#genre3").css("display", "none");
			$("#genre4").css("display", "none");
			$("#genre5").css("display", "none");
			$("#genre6").css("display", "none");
			$("#genre7").css("display", "none");
			$("#genre8").css("display", "none");
			$("#genre9").css("display", "none");
			$("#genre10").css("display", "block");
		} else {
			$("#genre1").css("display", "none");
			$("#genre2").css("display", "none");
			$("#genre3").css("display", "none");
			$("#genre4").css("display", "none");
			$("#genre5").css("display", "none");
			$("#genre6").css("display", "none");
			$("#genre7").css("display", "none");
			$("#genre8").css("display", "none");
			$("#genre9").css("display", "none");
			$("#genre10").css("display", "none");
		}
	})
</script>
<title>세상에서 가장 빠른 온라인 서점, 한장두장</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/book_list.css" />
<link rel="shortcut icon" href="resources\img\etc\favicon.ico">

<body>
	<!-- header부분 -->
	<%@ include file="/resources/jsp/header/header.jsp" %>
	<div id="container">
		<div id="title">베스트셀러</div>

		<div id="wrap">
			<div id="category">
				<button style="cursor: pointer;"
					onclick="location='BestSellerList1.do?categoryId=100'">베스트셀러 종류</button>
			</div>

			<div id="genre">
				<input type="hidden" class="genre" value="${categoryId}">
				<ul>
					<li><a href="BestSellerList1.do?categoryId=109"
						onmouseover="this.style.color='#0000FF'"
						onmouseout="this.style.color='#555'">유아/어린이</a></li>
					<li><a href="BestSellerList1.do?categoryId=101"
						onmouseover="this.style.color='#0000FF'"
						onmouseout="this.style.color='#555'">소설/시/희곡</a></li>
					<li><a href="BestSellerList1.do?categoryId=102"
						onmouseover="this.style.color='#0000FF'"
						onmouseout="this.style.color='#555'">에세이</a></li>
					<li><a href="BestSellerList1.do?categoryId=103"
						onmouseover="this.style.color='#0000FF'"
						onmouseout="this.style.color='#555'">인문학</a></li>
					<li><a href="BestSellerList1.do?categoryId=116"
						onmouseover="this.style.color='#0000FF'"
						onmouseout="this.style.color='#555'">과학/역사</a></li>

					<div id="bottomLine">
						<span id="genre1"></span>
						<span id="genre2"></span>
						<span id="genre3"></span>
						<span id="genre4"></span>
						<span id="genre5"></span>
					</div>
					<br>
					<br>
					<li><a href="BestSellerList1.do?categoryId=114"
						onmouseover="this.style.color='#0000FF'"
						onmouseout="this.style.color='#555'">수험서/참고서</a></li>
					<li><a href="BestSellerList1.do?categoryId=205"
						onmouseover="this.style.color='#0000FF'"
						onmouseout="this.style.color='#555'">영미소설</a></li>
					<li><a href="BestSellerList1.do?categoryId=117"
						onmouseover="this.style.color='#0000FF'"
						onmouseout="this.style.color='#555'">경제경영</a></li>
					<li><a href="BestSellerList1.do?categoryId=118"
						onmouseover="this.style.color='#0000FF'"
						onmouseout="this.style.color='#555'">자기계발</a></li>
					<li><a href="BestSellerList1.do?categoryId=128"
						onmouseover="this.style.color='#0000FF'"
						onmouseout="this.style.color='#555'">여행</a></li>

					<div id="bottomLine">
						<span id="genre6"></span>
						<span id="genre7"></span>
						<span id="genre8"></span>
						<span id="genre9"></span>
						<span id="genre10"></span>
					</div>
				</ul>
			</div>

			<hr class="line">

			<div id="content">
				<ul>
					<c:forEach items="${bookList}" var="b">
						<li>
							<div class="thumb_cont">
								<input type="hidden" value="${sessionScope.memberVO.userNo}" />
								<input type="hidden" value="${b.itemID}" />
								<div class="info_area">
									<div class="image">
										<a href="goToBookDetailCrawl.do?title=${b.title}"> 
											<img src="${b.coverLargeUrl}" alt="" />
										</a>
									</div>

									<div class="detail">
										<div class="title">
											<a href="goToBookDetailCrawl.do?title=${b.title}"><strong>${b.title}</strong></a>
										</div>
										<div class="pub_info">
											<span class="author">${b.author}</span>
											<span>
												<c:choose>
													<c:when test="${empty b.author}"></c:when>
													<c:otherwise>|</c:otherwise>
												</c:choose>
											</span>
											<span class="publication">${b.publisher}</span>
											<span>|</span>
											<span class="publication_date">
												<fmt:parseDate value="${b.pubDate}" var="pubDate1" pattern="yyyyMMdd"/>
												<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${pubDate1}"/>
											</span>
										</div>
										<div class="price">
											<span class="sell_price">
												<fmt:formatNumber value="${b.priceStandard}" pattern="#,###" />원
											</span>
										</div>
										<div class="info">
											<span> 
												<c:if test="${empty b.description }">책 설명 업데이트 예정</c:if> 
												${b.description}
											</span>
										</div>
									</div>
								</div>

								<div class="buy_button">
									<button style="cursor: pointer;" onclick="javascript:addCart()">장바구니</button>
									<br>
									<button style="cursor: pointer;"
										onclick="javascript:addOrderList()">바로 구매</button>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>

			<!-- <div class="paging">
				<a class="btn_pre" href="#">&lt;</a>
				<ul>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
				</ul>
				<a class="btn_next" href="#">&gt;</a>
			</div> -->
		</div>
	</div>
	<!-- footer부분 -->
	<%@ include file="/resources/jsp/footer/footer.jsp" %>
</body>
</html>