<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- 자바빈 클래스 import --%>      
<%@ page import="jsp.member.model.MemberBean" %>  
<%-- DAO import --%>   
<%@ page import="jsp.member.model.MemberDAO" %> 
    
<html>
<head>
	<title>회원정보 수정처리</title>
</head>
<body>
	<%-- 자바빈 관련 액션태그 사용 --%>
	<jsp:useBean id="memberBean" class="jsp.member.model.MemberBean" /> <!-- 예시라 바꿔야할수도있습니다 -->
	<jsp:setProperty property="*" name="memberBean"/>	
	
	<%
		// 세션에서 아이디를 가져와 MemberBean에 세팅한다. 예시입니다.
		String id= (String)session.getAttribute("sessionID"); 
		memberBean.setId(id);
	
		// 수정할 회원정보를 담고있는 MemberBean을 DAO로 전달하여 회원정보 수정을 한다. 예시입니다.
		MemberDAO dao = MemberDAO.getInstance();
		dao.updateMember(memberBean);
	%>
	
	<br><br>
	<font size="5" color="balck">회원정보가 수정되었습니다.</font>
	<br><br>
	<input type="button" value="메인으로" onclick=""/> <!-- 메인 -->
	
</body>
</html>