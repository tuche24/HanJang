package com.mycompany.myapp.service.impl;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.myapp.service.MemberService;
import com.mycompany.myapp.service.dao.MemberDAOImpl;
import com.mycompany.myapp.vo.MemberVO;


@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDAOImpl dao;
	
	@Override
	public void MemberInsert(MemberVO membervo) throws Exception{
		dao.MemberInsert(membervo);
	}
	
	@Override
	public MemberVO LoginCheck(MemberVO membervo) throws Exception{

      MemberVO membervo2 = dao.LoginCheck(membervo);
     
      return membervo2;
      
      //return dao.LoginCheck(membervo); 이것도해봄.
	}
	@Override
	public int IdCheck(String param) throws Exception{
		int result = dao.IdCheck(param);
		
		return result;
	}
    @Override
    public void logout(HttpServletResponse response) throws Exception{
    	response.setContentType("text/html;charset=utf-8");
    	PrintWriter out = response.getWriter();
    	out.println("<script>");
    	out.println("location.href=document.referrer;");
    	out.println("</script>");
    	out.close();
    }
	
	public void sendEmail(MemberVO vo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "tuche24@naver.com";
		String hostSMTPpwd = "gkswkdvmfhwprxm";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "tuche24@naver.com";
		String fromName = "hanjangProject";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호: ";
			msg += vo.getPassword() + "</p></div>";
		}

		// �޴� ��� E-Mail �ּ�
		String mail = vo.getMail1();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); //네이버 이용시587  gmail 465

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	//비밀번호찾기
	public void findPw(HttpServletResponse response, MemberVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		MemberVO ck = dao.readMember(vo);
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(dao.IdCheck(vo.getId()) == 0 || vo.getId() == "") {
			out.print("test1");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(!vo.getMail1().equals(ck.getMail1())) {
			out.print("test2");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setPassword(pw);
			// 비밀번호 변경
			System.out.println("test3");
			dao.updatePw(vo);
			// 비밀번호 변경 메일 발송
			sendEmail(vo, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}


}
