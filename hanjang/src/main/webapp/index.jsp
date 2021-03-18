<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Index</h1>
<form action="testAll.do">
<input type="submit" value="마이바티스 테스트" /></form>

<form action="mainAll.do">
<input type="submit" value="메인페이지이동" /></form>

<form action="testError.do">
<input type="submit" value="위치못찾는파일설정" />
</form>

<form action="goToNewBook.do" >
<input type="submit" value="새책페이지" />
</form>

<form action="bookList.do">
<input type="submit" value="책검색 (네이버 api)" />
</form>

<form action="goToPopular.do">
<input type="submit" value="인기대출 (도서관 api)"/>
</form>

<form action="recommendList.do">
<input type="submit" value="커뮤니티 - 책 추천 게시판" />
</form>

<form action="bestSellerList.do">
<input type="submit" value="베스트셀러 (인터파크 api)" />
</form>

<form action="recommendBookList.do">
<input type="submit" value="추천도서 (인터파크 api)" />
</form>

<form action="goToBestSeller.do">
<input type="submit" value="베스트셀러" />
</form>

</body>
</html>