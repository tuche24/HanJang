<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 변경</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function(){
	document.querySelector('#complete').addEventListener('click', function() {
		address_popup_let.changeAddr();
	})
})

let address_popup_let = {
		changeAddr : function(){
			let userNo = document.querySelector('#val_userNo').getAttribute("value");
			let address = document.getElementById('change').value;
		
			var params = {
					userNo : userNo,
					address : address
			}
			
			$.ajax({
				type : "POST",
				url : "updateAddress.do",
				data : params,
				success : function(){
					console.log("동기화성공");
					/* 자식창 닫고 부모창 새로고침 */
					opener.document.location.reload();
					self.close();
				},
				error : function() {
					console.log("동기화실패");
				}
			});
			
		}
}
</script>
</head>

<style>
#container {
	margin: 0;
	height: 100%;
}

/* 제목 */
#container .title {
	display: block;
    height: 25px;
    margin-bottom: 40px;
    color: #04B404;
}

/* 주소창 */
#address {
	margin: 0 10px;
	width: 95%;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
	table-layout: fixed;
	width: 95%;
}

colgroup {
	display: table-column-group;
}

tr {
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
}

tr:first-child {
	border-top: 1px solid #444;
}


th {
	padding: 20px 20px 20px 5px;
	line-height: 18px;
	color: #777;
	font-size: 15px;
	text-align: left;
	border-bottom: 1px solid #dedede;
	border-right: 1px solid #dedede;
	background: #f7f7f7;
}

th:first-child {
	border-top: 1px solid #444;
}

td {
	position: relative;
	padding: 20px 0 20px 10px;
	border-bottom: 1px solid #dedede;
	color: #777;
}

input {
	width: 430px;
	height: 30px;
	vertical-align: middle;
}

/* 버튼 */
#button {
	text-align: center;
    padding-top: 40px;
    padding: 200px 0 0 220px;
    margin: 0;
    display: flex;
}

button {
	vertical-align: middle;
	cursor: pointer;
}

#complete {
	text-align: center;
    overflow: hidden;
    background: #2E64FE;
	outline: 0;
	border: 0;
    color: #FFF;
    font-size: 13px;
    font-weight: bold;
    font-family: malgun, "Malgun Gothic", Dotum, 돋움, sans-serif;
    line-height: 1.5;
    display: block;
    white-space: nowrap;
    margin: 0;
    padding: 15px 25px 15px 25px;
    margin-right: 50px;
}

#cancel {
	text-align: center;
    overflow: hidden;
    background: #848484;
	outline: 0;
	border: 0;
    color: #FFF;
    font-size: 13px;
    font-weight: bold;
    font-family: malgun, "Malgun Gothic", Dotum, 돋움, sans-serif;
    line-height: 1.5;
    display: block;
    white-space: nowrap;
    margin: 0;
    padding: 15px 25px 15px 25px;
}
</style>

<body>
	<div id="container">
		<h2 class="title">배송지 변경</h2>
		
		<div id="address">
			<table>
				<colgroup>
					<col style="width: 25%;" >
					<col style="width: *;" >
				</colgroup>
				<tbody>
					<tr>
						<th>변경 전 주소</th>
						<td><input type="text" id="basic" value="${sessionScope.memberVO.address}" readonly /></td>
					</tr>
					<tr>
						<th>변경 후 주소</th>
						<td><input type="text" id="change" /></td>
					</tr>
				</tbody>
			</table>
		</div>

		<div id="button">
			<button id="complete">변경</button>
			<button id="cancel" onclick="self.close();">취소</button>
		</div>
	</div>
	<input type="hidden" id="val_userNo" value="${sessionScope.memberVO.userNo}" />
</body>
</html>