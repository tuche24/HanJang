package com.mycompany.myapp.service.dao;

import com.mycompany.myapp.vo.MemberVO;

public interface MemberDAO {

	
	void MemberInsert(MemberVO membervo) throws Exception;
	
	public MemberVO LoginCheck(MemberVO membervo) throws Exception;
	
	public int IdCheck(String param) throws Exception;
	
	// 비밀번호찾기
	public int updatePw(MemberVO vo) throws Exception;
	
	// readmember test
	public MemberVO readMember(MemberVO vo);
	
	public int kakaoidfind(String nickname) throws Exception;
	
	public MemberVO findoneinfo(String nickname)throws Exception;
	
	//회원정보 수정
	void MemberUpdate(MemberVO membervo) throws Exception;
}
