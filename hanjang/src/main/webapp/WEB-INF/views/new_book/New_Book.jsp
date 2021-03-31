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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- 헤더연결 -->
<script defer>
	$(document)
			.ready(
					function() {
						$("#header")
								.load(
										"${pageContext.request.contextPath}/resources/jsp/header/header.jsp");
					})
</script>
<!-- 푸터연결 -->
<script defer>
	$(document).ready(function() {
		$("#footer").load("/myapp/resources/jsp/footer/footer.jsp");
	})
</script>
<script>
	/* 장바구니 담기 버튼을 눌렀을 시 책 정보를 장바구니에 담음 */
	function addCart() {
		let UserNo = event.target.parentElement.parentElement.firstElementChild
				.getAttribute('value');
		if (UserNo == null || UserNo == "") {
			swal("로그인", "로그인이 필요합니다", "error");
			false
		}
		/* else {swal(UserNo)} */
		let itemID = event.target.parentElement.parentElement.firstElementChild.nextElementSibling
				.getAttribute('value');
		/* alert(itemID); */
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

<title>새로 나온 책</title>
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/book_list.css" />

<style>
#title {
	margin-top: 100px;
}

.footer div {
	float: left;
}

.footer {
	margin: 0 auto;
	width: 1050px;
	height: 300px;
}
</style>

<body>
	<div id="container">
		<!-- header부분 -->
		<div id="header"></div>

		<div id="title">
			<ul>
				<li class="title_wrap"><p>새로 나온 책</p></li>
			</ul>
		</div>

		<div id="wrap">
			<div id="category">
				<button style="cursor: pointer;"
					onclick="location='NewBookList1.do?categoryId=100'">신간 종류</button>
			</div>

			<div id="genre">
				<input type="hidden" class="genre" value="${categoryId}">
				<ul>
					<li><a id="baby" href="NewBookList1.do?categoryId=109"
						onmouseover="this.style.color='#0000FF'"
						onmouseout="this.style.color='#555'">유아/어린이</a></li>
					<li><a href="NewBookList1.do?categoryId=101"
						onmouseover="this.style.color='#0000FF'"
						onmouseout="this.style.color='#555'">소설/시/희곡</a></li>
					<li><a href="NewBookList1.do?categoryId=102"
						onmouseover="this.style.color='#0000FF'"
						onmouseout="this.style.color='#555'">에세이</a></li>
					<li><a href="NewBookList1.do?categoryId=103"
						onmouseover="this.style.color='#0000FF'"
						onmouseout="this.style.color='#555'">인문학</a></li>
					<li><a href="NewBookList1.do?categoryId=116"
						onmouseover="this.style.color='#0000FF'"
						onmouseout="this.style.color='#555'">과학/역사</a></li>

					<div id="bottomLine">
						<span id="genre1"></span> <span id="genre2"></span> <span
							id="genre3"></span> <span id="genre4"></span> <span id="genre5"></span>
					</div>
					<br>
					<br>
					<li><a href="NewBookList1.do?categoryId=114"
						onmouseover="this.style.color='#0000FF'"
						onmouseout="this.style.color='#555'">수험서/참고서</a></li>
					<li><a href="NewBookList1.do?categoryId=205"
						onmouseover="this.style.color='#0000FF'"
						onmouseout="this.style.color='#555'">영미소설</a></li>
					<li><a href="NewBookList1.do?categoryId=117"
						onmouseover="this.style.color='#0000FF'"
						onmouseout="this.style.color='#555'">경제경영</a></li>
					<li><a href="NewBookList1.do?categoryId=118"
						onmouseover="this.style.color='#0000FF'"
						onmouseout="this.style.color='#555'">자기계발</a></li>
					<li><a href="NewBookList1.do?categoryId=128"
						onmouseover="this.style.color='#0000FF'"
						onmouseout="this.style.color='#555'">여행</a></li>

					<div id="bottomLine">
						<span id="genre6"></span> <span id="genre7"></span> <span
							id="genre8"></span> <span id="genre9"></span> <span id="genre10"></span>
					</div>
				</ul>
			</div>

			<hr>

			<div id="content">

				<ul>
					<c:forEach items="${bookList}" var="b">
						<li>
							<div class="thumb_cont">
								<input type="hidden" value="${sessionScope.memberVO.userNo}" />
								<input type="hidden" value="${b.itemID}" />
								<div class="info_area">
									<div class="image">
										<a href="goToBookDetail.do"> <img src="${b.coverLargeUrl}"
											alt="" /> <%-- <img src="${pageContext.request.contextPath}/resources/img/new/baby/baby1.jpg" 
									alt="우리는 안녕"/> --%></a>
									</div>

									<div class="detail">
										<div class="title">
											<a href="goToBookDetail.do"><strong>${b.title}</strong></a>
										</div>
										<div class="pub_info">
											<span class="author">${b.author}</span> <span>|</span> <span
												class="publication">${b.publisher}</span> <span>|</span> <span
												class="publication_date"> <fmt:parseDate
													value="${b.pubDate}" var="pubDate1" pattern="yyyyMMdd" />
												<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${pubDate1}" />
											</span>
										</div>
										<div class="price">
											<span class="sell_price"><fmt:formatNumber
													value="${b.priceStandard}" pattern="#,###" />원</span>
										</div>
										<div class="info">
											<span> <c:if test="${empty b.description }">책 설명 업데이트 예정<br>
													<br>
													<br>
													<br>
												</c:if> ${b.description} <!-- "안녕은 그리는 거야." 박준 시인의 첫 시 그림책<br> 안녕은 그리는 거야.<br>
											그리고 그리고 또 그리는 것을 그리움이라고 하는 거야.<br> 시인 박준의 첫 시 그림책 '우리는
											안녕' -->
											</span>
										</div>
									</div>
								</div>

								<div class="buy_button">
									<button style="cursor: pointer;" onclick="javascrpt:addCart()">장바구니</button>
									<br>
									<button style="cursor: pointer;"
										onclick="location='goToOrderList.do'">바로 구매</button>
								</div>
							</div>
						</li>
					</c:forEach>
					<%-- 
					<li>
						<div class="info_area">
							<div class="image">
								<a href="#"><img src="${pageContext.request.contextPath}/resources/img/new/baby/baby2.jpg"
									alt="수상한 기차역" /></a>
							</div>

							<div class="detail">
								<div class="title">
									<a href="#"><strong>수상한 기차역</strong></a>
								</div>
								<div class="pub_info">
									<span class="author">박현숙</span>
									<span>|</span>
									<span class="publication">북멘토</span>
									<span>|</span>
									<span class="publication_date">2021년 03월 30일</span>
								</div>
								<div class="price">
									<span class="sell_price">10,350원</span>
								</div>
								<div class="info">
									<span>북멘토 가치동화 42권. 여진이네 역사 동아리는 박물관으로 견학을 떠나게 된다.<br>
										그런데 견학을 마치고 돌아오는 버스 안에서 폭우와 만나게 되고, <br>
										쏟아지는 비로 인해 산사태가 나서 산중에 갇히는 일이 벌어지고 마는데...
									</span>
								</div>
							</div>

							<div class="buy_button">
								<button style="cursor: pointer;" onclick="location='#'">장바구니</button>
								<br>
								<button style="cursor: pointer;" onclick="location='#'">바로 구매</button>
							</div>
						</div>
					</li>

					<li>
						<div class="info_area">
							<div class="image">
								<a href="#"><img src="${pageContext.request.contextPath}/resources/img/new/baby/baby3.jpg"
									alt="눈보라" /></a>
							</div>

							<div class="detail">
								<div class="title">
									<a href="#"><strong>눈보라</strong></a>
								</div>
								<div class="pub_info">
									<span class="author">강경수</span>
									<span>|</span>
									<span class="publication">창비</span>
									<span>|</span>
									<span class="publication_date">2021년 01월 29일</span>
								</div>
								<div class="price">
									<span class="sell_price">12,600원</span>
								</div>
								<div class="info">
									<span>얼어붙은 마음을 녹이는 강력한 목소리<br> 
									볼로냐 라가치 상 수상 작가 강경수 신작
									</span>
								</div>
							</div>

							<div class="buy_button">
								<button style="cursor: pointer;" onclick="location='#'">장바구니</button>
								<br>
								<button style="cursor: pointer;" onclick="location='#'">바로 구매</button>
							</div>
						</div>
					</li>

					<li>
						<div class="info_area">
							<div class="image">
								<a href="#"><img src="${pageContext.request.contextPath}/resources/img/new/baby/baby4.jpg"
									alt="모두 웃는 장례식" /></a>
							</div>

							<div class="detail">
								<div class="title">
									<a href="#"><strong>모두 웃는 장례식</strong></a>
								</div>
								<div class="pub_info">
									<span class="author">홍민정</span>
									<span>|</span>
									<span class="publication">별숲</span>
									<span>|</span>
									<span class="publication_date">2021년 03월 19일</span>
								</div>
								<div class="price">
									<span class="sell_price">10,800원</span>
								</div>
								<div class="info">
									<span>별숲 동화 마을 33권. 동화책 《고양이 해결사 깜냥》으로 어린이에게<br>
									 많은 사랑을 받고있는 홍민정 동화작가의 첫 고학년 장편동화다.<br>
									 암에 걸려 곧 죽음을 맞게 될 할머니가 ‘생전장례식’을<br>
									 치르면서 일어나는 일을 다루고 있다.
									</span>
								</div>
							</div>

							<div class="buy_button">
								<button style="cursor: pointer;" onclick="location='#'">장바구니</button>
								<br>
								<button style="cursor: pointer;" onclick="location='#'">바로 구매</button>
							</div>
						</div>
					</li>

					<li>
						<div class="info_area">
							<div class="image">
								<a href="#"><img src="${pageContext.request.contextPath}/resources/img/new/baby/baby5.jpg"
									alt="행복책" /></a>
							</div>

							<div class="detail">
								<div class="title">
									<a href="#"><strong>행복책</strong></a>
								</div>
								<div class="pub_info">
									<span class="author">GO스마일연구소</span>
									<span>|</span>
									<span class="publication">큰웃음</span>
									<span>|</span>
									<span class="publication_date">2021년 02월 15일</span>
								</div>
								<div class="price">
									<span class="sell_price">16,200원</span>
								</div>
								<div class="info">
									<span>세상에서 가장 쉬운 15가지 행복 찾기 나를 위한 행복을 찾고 싶다면<br> 
									나를 위한 행복을 갖고 싶다면 행복책을 읽어보세요.
									</span>
								</div>
							</div>

							<div class="buy_button">
								<button style="cursor: pointer;" onclick="location='#'">장바구니</button>
								<br>
								<button style="cursor: pointer;" onclick="location='#'">바로 구매</button>
							</div>
						</div>
					</li>

 --%>
				</ul>
			</div>

			<!-- 			<div class="paging">
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
	<div id="footer"></div>
</body>
</html>