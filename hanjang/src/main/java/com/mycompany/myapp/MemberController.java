package com.mycompany.myapp;


import java.text.ParseException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.myapp.service.MemberService;
import com.mycompany.myapp.service.dao.MemberDAO;
import com.mycompany.myapp.vo.MemberVO;



@Controller
public class MemberController {
	
	@Resource(name = "memberService")
	private MemberService memberservice1;
	
	
	@RequestMapping(value="/JoinPro.do")
	public String InsertMember(MemberVO membervo) {
		
		memberservice1.MemberInsert(membervo);
		return "LoginForm";
	}
	
	
	@RequestMapping(value="/login.do")
	public String loginMember(Model model,@ModelAttribute MemberVO membervo,HttpSession session) {
		
		boolean result = memberservice1.LoginCheck(membervo,session);

		if(result== true) {
			model.addAttribute("msg","success");
			return "main";
		}else {
			model.addAttribute("msg","failure");
			return "LoginForm";
		}
	}
	/*@ResponseBody
	@RequestMapping(value="/idcheck.do",produces="text/plane")
	public String IDCheck(@RequestBody String paramData) throws ParseException{
		String ID = paramData.trim();
		System.out.println(ID);
		MemberVO mvo = memberservice1.Id_Check(ID);
	}*/
	
	
	
	
	
	/* *** 여기서부터 이 책 추천해요 게시판 컨트롤러 *** */
	
	// 게시물 목록 조회 + 페이징
	
	
	
}
