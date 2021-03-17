<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 테스트</title>
</head>
<body>
	<h1>이름과 내용</h1>
	<table border="2">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>내용</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="imsi" items="${alist}">
				<tr>
					<td><a href="testDelete.do?fNum=${imsi.fNum}">${imsi.fNum}</a></td>
					<td>${imsi.fName}
					<td>${imsi.fContent}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<a href="<c:url value='/testInsertForm.do'/>">[내용등록]</a> <a
			href="<c:url value='/testAll.do'/>">[모두보기]</a>
	</div>



</body>
</html>