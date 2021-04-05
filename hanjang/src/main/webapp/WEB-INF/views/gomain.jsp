<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script>
alert("장바구니에 상품이 담기지 않았습니다");
location.href = '<c:out value="${pageContext.request.contextPath}/mainAll.do"/>';
</script>
</head>
<body>

</body>
</html>