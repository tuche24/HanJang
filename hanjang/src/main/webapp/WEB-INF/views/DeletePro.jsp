<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="jsp.member.model.MemberDAO" %>    
<%@ page import="jsp.member.model.MemberBean" %>    
<html>
<head>
	<title>ȸ�� ���� ó��</title>
</head>
<body>
	<%
		String id= (String)session.getAttribute("sessionID"); 
		String pw = request.getParameter("password");
		
		// ���ǿ��� ���̵�, DeleteForm.jsp���� �Է¹��� ��й�ȣ�� �����´�. //�����Դϴ� DB
		// ������ ����� ������ ȸ�������� �����Ѵ�. - ��������� ��ȯ
		MemberDAO dao = MemberDAO.getInstance();
		int check = dao.deleteMember(id, pw);
		
		if(check == 1){
			session.invalidate(); // �����ߴٸ� ���������� �����Ѵ�.
	%>
		<br><br>
		<b><font size="4" color="black">ȸ�������� �����Ǿ����ϴ�.</font></b>
		<br><br><br>
	
		<input type="button" value="Ȯ��" onclick=""> <!-- ���� -->
	
	<%	
	 	// ��й�ȣ�� Ʋ����� - ������ �ȵǾ��� ���
		}else{
	%>
		<script>
			alert("��й�ȣ�� ���� �ʽ��ϴ�.");
			history.go(-1);
		</script>
	<%
		} 
	%>
</body>
</html>