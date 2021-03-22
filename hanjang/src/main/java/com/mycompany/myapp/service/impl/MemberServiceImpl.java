package com.mycompany.myapp.service.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.myapp.service.MemberService;
import com.mycompany.myapp.service.dao.MemberDAO;
import com.mycompany.myapp.vo.MemberVO;


@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDAO dao;
	
	@Override
	public void MemberInsert(MemberVO membervo) {
		dao.MemberInsert(membervo);
	}
	
	@Override
	public boolean LoginCheck(MemberVO membervo,HttpSession session) {
		boolean result = dao.LoginCheck(membervo);
		
		if (result) {
			MemberVO vo2 = viewMember(membervo);
			session.setAttribute("userId", vo2.getId());
			session.setAttribute("username", vo2.getName());
		}
		return result;
	}
	
	@Override 
	public MemberVO viewMember(MemberVO membervo) {
		return dao.viewMember(membervo);
	}

}
