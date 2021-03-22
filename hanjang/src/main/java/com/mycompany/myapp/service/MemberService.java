package com.mycompany.myapp.service;

import javax.servlet.http.HttpSession;

import com.mycompany.myapp.vo.MemberVO;

public interface MemberService {

		void MemberInsert(MemberVO membervo) throws Exception;
		public MemberVO LoginCheck(MemberVO membervo) throws Exception;
}
