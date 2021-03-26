package com.mycompany.myapp.service;

import javax.servlet.http.HttpServletResponse;

import com.mycompany.myapp.vo.MemberVO;

public interface MemberService {

		void MemberInsert(MemberVO membervo) throws Exception;
		public MemberVO LoginCheck(MemberVO membervo) throws Exception;
		public int IdCheck(String param) throws Exception;
		void logout(HttpServletResponse response) throws Exception;
}
