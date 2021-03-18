<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${bookList}" var="b">
<ul>
	<li>${b.title}</li>
	<li>${b.isbn}</li>
	<li><img src="${b.coverLargeUrl}" alt="" /></li>
	<li>${b.author}</li>
	<li>${b.description}</li>
	<li>${b.priceStandard}</li>
	<li>${b.categoryId}</li>
	<li>${b.categoryName}</li>
	<li>${b.publisher}</li>
	<li>${b.pubDate}</li>
</ul>
</c:forEach>
</body>
</html>