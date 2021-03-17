<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>내용등록</title>
</head>
<body>
	<h1>내용 등록</h1>
	<form action="testInsert.do" method="post">
		<table border="2">
			<tr>
				<td>이름</td>
				<td><input type="text" name="fName"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="fContent"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="추가"></td>
			</tr>
		</table>
	</form>
</body>
</html>
