<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="popularList.do">
<input type="submit" value="검색" />
</form>

<h1>인기도서test</h1>
<c:forEach items="${bookList}" var="b">
<ul>
	<li>${b.ranking}</li>
	<li>${b.bookname}</li>
	<li>${b.authors}</li>
	<li>${b.publisher}</li>
	<li>${b.publication_year}</li>
	<li>${b.isbn13}</li>
	<li><img src="${b.bookImageURL}" alt="" /></li>
</ul>


</c:forEach>


</body>
</html>