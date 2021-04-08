<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���󿡼� ���� ���� �¶��� ����, �������</title>

<link rel="shortcut icon" href="resources\img\etc\favicon.ico">
</head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
	/* $(function pay() { */
		$(/* "#check_module").click( */function() {
			var IMP = window.IMP; // ��������
			IMP.init('imp70077133');
			// 'iamport' ��� �ο����� "������ �ĺ��ڵ�"�� ���
			// 'iamport' ������ ������ -> ������ -> �������ĺ��ڵ�
			IMP.request_pay({
				pg : 'inicis', // version 1.1.0���� ����.
				/*
				 'kakao':īī������,
				 html5_inicis':�̴Ͻý�(��ǥ�ذ���)
				 'nice':���̽�����
				 'jtnet':����Ƽ��
				 'uplus':LG���÷���
				 'danal':�ٳ�
				 'payco':������
				 'syrup':�÷�����
				 'paypal':������
				 */

				pay_method : 'card',
				/*
				 'samsung':�Ｚ����,
				 'card':�ſ�ī��,
				 'trans':�ǽð�������ü,
				 'vbank':�������,
				 'phone':�޴����Ҿװ���
				 */
				merchant_uid : 'merchant_' + new Date().getTime(),
				/*
				 merchant_uid�� ���
				 https://docs.iamport.kr/implementation/payment
				 ���� url�� ���󰡽ø� ���� �� �ִ� ����� �ֽ��ϴ�.
				 */
				name : '${sessionScope.payment.title}',
				//����â���� ������ �̸�
				amount : ${sessionScope.payment.priceTotal},
				//����
				buyer_email : '${sessionScope.payment.email}',
				buyer_name : '${sessionScope.payment.name}',
				buyer_tel : '${sessionScope.payment.phone}',
				buyer_addr : '${sessionScope.payment.address}',
				buyer_postcode : '123-456', 
				/* m_redirect_url : 'mainAll.do' */ 
			/*
			 ����� ������,
			 ������ ������ �����Ǵ� URL�� ����
			 (īī������, ������, �ٳ��� ���� �ʿ����. PC�� ���������� callback�Լ��� ����� ������)
			 */
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '������ �Ϸ�Ǿ����ϴ�.';
					msg += '����ID : ' + rsp.imp_uid;
					msg += '���� �ŷ�ID : ' + rsp.merchant_uid;
					msg += '���� �ݾ� : ' + rsp.paid_amount;
					msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;
					alert(msg);
					document.location.href="goToComplete.do"; //alertâ Ȯ�� �� �̵��� url ����
				} else {
					var msg = '������ �����Ͽ����ϴ�.';
					msg += '�������� : ' + rsp.error_msg;
					alert(msg);
					document.location.href="mainAll.do"; //alertâ Ȯ�� �� �̵��� url ����
				}
			});
		});
	/* }); */
</script>

<body>
	<!-- <p>���� ����Ʈ ���� ��� �׽�Ʈ �غ���</p>
	<button id="check_module" onclick="javascript:pay();">���� ����Ʈ
		���� ��� �׽�Ʈ �غ���</button>
 -->

</body>
</html>