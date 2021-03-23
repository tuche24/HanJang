package com.mycompany.myapp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.myapp.service.MemberService;
import com.mycompany.myapp.service.dao.MemberDAO;
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
	

}
