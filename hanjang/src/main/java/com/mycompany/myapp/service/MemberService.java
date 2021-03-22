package com.mycompany.myapp.service;

import javax.servlet.http.HttpSession;

import com.mycompany.myapp.vo.MemberVO;

public interface MemberService {

		void MemberInsert(MemberVO membervo);
		public boolean LoginCheck(MemberVO membervo ,HttpSession session);
		public MemberVO viewMember(MemberVO membervo);
}
