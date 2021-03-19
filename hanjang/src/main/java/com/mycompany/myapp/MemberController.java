package com.mycompany.myapp;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.myapp.service.MemberService;
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
	/* *** 여기서부터 이 책 추천해요 게시판 컨트롤러 *** */
	
	// 게시물 목록 조회 + 페이징
	
	
	
}
