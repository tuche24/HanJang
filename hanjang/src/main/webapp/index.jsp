<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="mainAll.do">

<input type="submit" value="메인페이지이동" /></form>

<form action="loginform.do">
<input type="submit" value="로그인폼" />
</form>
<form action="joinform.do">
<input type="submit" value="회원가입폼" />
</form>

<form action="recommendList.do">
<input type="submit" value="커뮤니티 - 책 추천 게시판"/>
</form>

<form action="requestList.do">
<input type="submit" value="커뮤니티 - 없는 책 게시판" />
</form>	

<form action="NewBookList1.do">
<input type="submit" value="새책페이지1" />
</form>

<form action="BestSellerList1.do">
<input type="submit" value="베스트셀러" />
</form>

<form action="goToPay.do">
<input type="submit" value="결제창" />
</form>

<form action="gotofindpw.do">
<input type="submit" value="비밀번호찾기" />
</form>

<form action="goToComplete.do">
<input type="submit" value="결제완료" />
</form>

<form action="goToBookDetailTest.do">
<input type="hidden" name="title" value="java" />
<input type="submit" value="크롤링test" />
</form>
</body>
</html>