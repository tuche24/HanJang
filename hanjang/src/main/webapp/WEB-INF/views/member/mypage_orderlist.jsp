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
		<td style="color:#ee5555; font-weight:bold;">${list.bookVO.priceStandard * list.cartVO.amount }</td>
	</tr>
	<tr>
		<td style="width:100px;">주문상태</td>
		<td>주문 완료</td>
	</tr>
</table>
</c:forEach>
</c:if>
<div class="pagingSection">	<!-- 페이징 부분 -->
	<!-- 이전 버튼 -->
	<c:if test="${po.prev }">
	<div class="pagingBtn">
		<a href="<c:url value='mypageOrderList.do?page=${po.firstPage-1 }&countPerPage=${po.paging.countPerPage }'/>">prev</a>
	</div>
	</c:if>
	<!-- 페이지 버튼 -->
	<c:forEach var="pageNum" begin="${po.firstPage }" end="${po.lastPage }">
	<!-- 현재 선택된 페이지 배경색 바꾸기 -->
	<c:choose>
	<c:when test="${po.paging.page == pageNum }">
	<div class="pagingBtn" style="background-color: #f7f7f7;">
		<a href="<c:url value='mypageOrderList.do?page=${pageNum }&countPerPage=${po.paging.countPerPage }'/>">${pageNum }</a>
	</div>
	</c:when>
	<c:otherwise>
	<div class="pagingBtn">
		<a href="<c:url value='mypageOrderList.do?page=${pageNum }&countPerPage=${po.paging.countPerPage }'/>">${pageNum }</a>
	</div>
	</c:otherwise>
	</c:choose>
	</c:forEach>
	<!-- 다음 버튼 -->
	<c:if test="${po.next }">
	<div class="pagingBtn">
		<a href="<c:url value='recommendList.do?page=${po.lastPage +1 }&countPerPage=${po.paging.countPerPage }'/>">next</a>
	</div>
	</c:if>
</div>
</div>
</div>
</div>
</body>
</html>