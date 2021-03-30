<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>배송지 변경</title>
</head>

<style>
.basic {
	width: 50px;
}

.change {
	width: 50px;
}
</style>

<body>
<h2>배송지 변경</h2>

<div id="address">
	<input type="text" id="basic" readonly/> 변경 전 주소
	<input type="text" id="change" /> 변경 후 주소
</div>

<div id="button">
	<button id="complete">변경</button>
	<button id="cancel" onclick="self.close();">취소</button>
</div>
</body>
</html>