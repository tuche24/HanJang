package com.mycompany.myapp.service;

import javax.servlet.http.HttpServletResponse;

import com.mycompany.myapp.vo.MemberVO;

public interface MemberService {

	void MemberInsert(MemberVO membervo) throws Exception;

	public MemberVO LoginCheck(MemberVO membervo) throws Exception;

	public int IdCheck(String param) throws Exception;
	/* void logout(HttpServletResponse response) throws Exception; */

	// 이메일발송
	public void sendEmail(MemberVO vo, String div) throws Exception;

	// 비밀번호찾기
	public void findPw(HttpServletResponse resp, MemberVO vo) throws Exception;

	// 카카오회원가입여부
	public int kakaoidfind(String nickname) throws Exception;

	public MemberVO findoneinfo(String nickname) throws Exception;

	// 회원정보 수정
	void MemberUpdate(MemberVO membervo) throws Exception;

	// 회원탈퇴
	void MemberDelete(MemberVO membervo) throws Exception;

	// 회원주소 수정
	void updateAddress(MemberVO memberVO);

	// 아이디 찾기
	public String findId(HttpServletResponse res, MemberVO memberVO) throws Exception;
}
