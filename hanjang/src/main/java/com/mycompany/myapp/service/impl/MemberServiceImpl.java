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
	public void MemberInsert(MemberVO membervo) throws Exception{
		dao.MemberInsert(membervo);
	}
	
	@Override
	public MemberVO LoginCheck(MemberVO membervo) throws Exception{

      MemberVO membervo2 = dao.LoginCheck(membervo);
      return membervo2;
	}
	

}
