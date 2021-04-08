<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세상에서 가장 빠른 온라인 서점, 한장두장</title>
<link rel="shortcut icon" href="resources\img\etc\favicon.ico">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
window.onload = function() {
	var result = "${msg}";
	console.log(result)
	if(result == 'cartError') {
		swal.fire({
			icon:'error',
			title:'장바구니 관련 안내',
			text:'장바구니에 상품이 담기지 않았습니다.',
			showCancelButton: false,
			confirmButtonText: '확인'
		}).then((result) => {
			if(result.isConfirmed) {
				location.href="mainAll.do";
			}
		})
	}
}
</script>
</head>
<body>
</body>
</html>