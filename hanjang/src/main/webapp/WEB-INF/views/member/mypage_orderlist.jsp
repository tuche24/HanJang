<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/mypageStyle.css">
</head>
<body>
<div class="contentPane">
<!-- 좌측 세로 메뉴 시작 -->
<div class="left_menu">
<div class="title">마이 페이지</div>	<!-- 타이틀 -->
<ul>
	<li><a href="mypageOrderList.do">주문내역 조회&nbsp;&nbsp;&nbsp;&nbsp;></a></li>
	<li><a href="mypageMyInfo.do">회원정보 수정&nbsp;&nbsp;&nbsp;&nbsp;></a></li>
</ul>
</div>
<!-- 좌측 세로 메뉴 끝 -->
<!-- 내용 부분 -->
<div class="contents">
<span class="subtitle">주문내역 조회</span>
<hr class="line">
<div class="contents_fontsize">
<c:if test="${list.size() > 0 }">
<span style="font-weight:bold;">주문번호 [${orderlist.orderListNo }]</span></c:if>
<c:if test="${orderlist.size() <= 0 }">
<table class="order_table">
	<tr>
		<td style="text-align:center;">주문하신 내역이 없습니다.</td>
	</tr>
</table>
</c:if>
<c:if test="${orderlist.size() > 0 }">
<c:forEach var="list" items="${orderlist }">
<table class="order_table">
	<tr>	<!-- 책 이미지 들어오는 곳 -->
		<td rowspan="4" style="width:70px;"><img src="${list.bookVO.coverLargeUrl }"></td>
			<!-- 책 제목 들어오는 곳 -->
		<td colspan="2" style="font-weight:bold;">${list.bookVO.title }</td>	
	</tr>
	<tr>	
		<td style="width:100px;">주문번호</td>
		<td>[${list.orderListNo }]</td>
	</tr>
	<tr>
		<td style="width:100px;">결제금액</td>
		<td style="color:#ee5555; font-weight:bold;">결제금액 들어올 곳</td>
	</tr>
	<tr>
		<td style="width:100px;">주문상태</td>
		<td>주문 완료</td>
	</tr>
</table>
</c:forEach>
</c:if>
<!-- 페이징 섹션 -->

</div>
</div>
</div>
</body>
</html>