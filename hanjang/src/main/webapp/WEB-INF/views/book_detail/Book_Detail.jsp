<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 상세내용</title>
</head>
<link rel="stylesheet" href="../resources/css/reset.css" />
<link rel="stylesheet" href="../resources/css/book_detail.css" />

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
$(function only_number(){
	$('#decreaseQuantity').click(function(e){
	e.preventDefault();
	var stat = $('#count_form_input').text();
	var num = parseInt(stat,10);
	num--;
	if (num <= 0) {
		swal("구매 횟수 제한","책은 1권 이상 구매 할 수 있습니다.","warning");
		num = 1;
	}
	
	$('#count_form_input').text(num);
	});
	
	$('#increaseQuantity').click(function(e){
	e.preventDefault();
	var stat = $('#count_form_input').text();
	var num = parseInt(stat,10);
	num++;

	if (num > 5) {
		swal("구매 횟수 제한","구매 제한은 5권입니다.","warning");
		num = 5;
	}
	
	$('#count_form_input').text(num);
	});
});
</script>

<body>
	<div id="container">
		<div id="header"></div>

		<div id="wrap">
			<div id="detail_title">
				<ul>
					<li><span class="title"> <strong>우리는 안녕</strong>
					</span></li>

					<li>
						<div id="info">
							<span id="author">박준 지음</span> 
							<span>|</span> <span id="draw">김한나 그림</span>
							<span>|</span>
							<span id="publication">난다</span>
							<span>|</span>
							<span id="publication_date">2021년 03월 20일</span>
						</div>
					</li>
				</ul>
			</div>

			<hr>

			<div id="bookwrap">
				<div class="prod_bookwrap">
					<div class="detail_picture">
						<img
							src="${pageContext.request.contextPath}/resources/img/new/baby/baby1.jpg"
							alt="우리는 안녕" />
					</div>

					<div class="detail_order">
						<div class="price">
							<ul>
								<li>
									<div class="Litem">판매가</div>
									<div class="Ritem">14,850원</div>
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
									<div class="Ritem">서울특별시 종로구 세종대로</div>
								</li>
							</ul>
						</div>

						<div class="quantity">
							<ul>
								<li>
									<div class="Litem">수량</div>
									<div class="Ritem">
										<div class="count_input_box">
											<button style="cursor: pointer;" onclick="javascript:only_number();"
											id="decreaseQuantity">-</button>
											<!-- <input type="text" id="count_form_input" value="1" maxlength="3" 
											onkeyup="javascript:only_number();"/> -->
											<span id="count_form_input">1</span>
											<button style="cursor: pointer;" onclick="javascript:only_number();"
											id="increaseQuantity">+</button>
										</div>
									</div>
								</li>
							</ul>
						</div>

						<div class="buy_btn">						
							<div class="cart">
								<button style="cursor: pointer;" onclick="location='#'">장바구니 담기</button>
							</div>

							<div class="buynow">
								<button style="cursor: pointer;" onclick="location='#'">바로 구매하기</button>
							</div>
						</div>
					</div>
				</div>

				<hr>

				<div class="detail_info">
					<div class="book_introduce">
						<div class="intro_title">책소개</div>
						<div class="intro_content">안녕은 그리는 거야. 그리고 그리고 또 그리는 것을
							그리움이라고 하는 거야. 시인 박준의 첫 시 그림책 『우리는 안녕』 첫 시집 『당신의 이름을 지어다가 며칠은
							먹었다』와 첫 산문집 『운다고 달라지는 일은 아무것도 없겠지만』을 쓴 시인 박준의 첫 시 그림책이다. 『우리는
							안녕』이라는 제목의 시 그림책이다. 시인의 아버지가 키우는 개 ‘단비’를 주인공으로 하는 시 그림책이다. 「단비」라는
							제목의 시(올해 두 살 된 단비는/첫배에 새끼 여섯을 낳았다//딸이 넷이었고/아들이 둘이었다/ /한 마리는
							인천으로/한 마리는 모래내로/한 마리는 또 천안으로//그렇게 가도/내색이 없다가//마지막 새끼를/보낸 날부터/
							/단비는 집 안 곳곳을/쉬지 않고 뛰어다녔다//밤이면/마당에서 길게 울었고//새벽이면/올해 예순아홉 된 아버지와/
							/멀리 방죽까지 나가/함께 울고 돌아왔다)도 시인의 두번째 시집 『우리가 함께 장마를 볼 수도 있겠습니다』를 통해
							발표한 적 있거니와, 어느 날 단비에게 날아든 새가 있어 그 새와 친구가 되어가는 과정 속에 저마다의 ‘안녕’을
							되새겨보게 하는 시 그림책이다.</div>
					</div>

					<hr>

					<div class="book_author">
						<div class="author_title">저자 및 역자 소개</div>
						<div class="author_content">
							<div class="author_name">
								박준 <span>(지은이)</span>
							</div>
							<div class="author_detail">
								시집 『당신의 이름을 지어다가 며칠은 먹었다』 『우리가 함께 장마를 볼 수도 있겠습니다』,<br>
								산문집『운다고 달라지는 일은 아무것도 없겠지만』. 늘 개와 함께 살고 있다.
							</div>
							<div class="drawer_name">
								김한나 <span>(그린이)</span>
							</div>
							<div class="drawer_detail">
								일상생활의 승리〉 〈미세한 기쁨의 격려〉 〈먼지가 방귀 뀌는 소리〉 등의 전시를 했다.<br> 항상 토끼와
								붙어다니고 있다.
							</div>
						</div>
					</div>

					<hr>

					<div class="book_preview">
						<div class="preview_title">출판사 서평</div>
						<div class="preview_content">
							만남이라는 안녕의 기쁨에 설레게 하는 시 그림책이다.<br> 이별이라는 안녕의 슬픔에 시무룩하게도 만드는 시
							그림책이다. 시작이라는 안녕에서 ‘삶’이라는 단어를 발음하게 하고 끝이라는 안녕에서 ‘죽음’이라는
							단어에 눈뜨게 하고 싶어 준비한 시 그림책이다. “만나지 못한 이를 그리워할 때,
							눈은 먼 곳으로 가닿습니다. 보고 싶은 이를 보고 싶어할 때, 마음은 가까이 있고요.” 우리가 안녕을
							말하는 순간 우리 안팎을 휘감는 공기의 근원이 곧 그리움이구나, 알게 하는 시 그림책이다.
							“한번 눈으로 본 것들은 언제라도 다시 그려낼 수 있어. 그리고 그리고 또 그리는 것을 그리움이라고 하는 거야.”
							보고 싶어 애가 타는 마음일 때 그리면 그려지는 마음이라 하니 그리움의 정의를 새롭게도 쓰게 하는 시 그림책이다.<br>
							퍽 어려운 주제이기도 하므로 접근만큼은 쉬워야 한다는 생각으로 짧지만 여운이 긴 문장으로 채워나간 시 그림책이다.
							되도록 천천히 읽어주시길 바라마지않는 건 해석의 여지가 다양하기도 해서거니와, 사랑하는 가족 간에 연인끼리
							친구 사이에 소리를 내어 들려줬을 때 그 울림의 일렁임이 각기 다른 진폭으로 기록됨을 짐작하기도 해서거니와,
							그림에 있어서도 단순히 보게 하는 데 그치는 것이 아니라 촘촘히 읽게 함으로써 그림만의 한 서사가 따로 또 같이
							구축됨을 증명해 보이기도 한 시 그림책이다.<br>
							<br> 서양화가 김한나와 함께한 시 그림책이다.<br> 사계절을 통과하는 일 년 가까운 시간 동안
							시인과 화가가 서로의 글과 그림을 주고받으면서 하나의 책으로 한 데 꾸려지기까지 고치고 또 고치고
							그리고 다시 그리기를 쉴새없이 반복해온 시 그림책이다. “안녕, 안녕은 말하고 싶을 때 말하고 안녕,
							안녕은 말하기 싫을 때에도 해야 하는 말이야.” 헤어지며 놓아주는 순간의 안녕, 기다리며 기약하는
							순간의 안녕, 이 사이를 사는 우리는 안녕이라 우리를 안녕하게 하는 시 그림책이다.
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>