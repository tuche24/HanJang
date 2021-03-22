package com.mycompany.myapp.service.dao;

import com.mycompany.myapp.vo.MemberVO;

public interface MemberDAO {

	
	void MemberInsert(MemberVO membervo);
	
	public MemberVO LoginCheck(MemberVO membervo) throws Exception;
	public MemberVO viewMember(MemberVO membervo) throws Exception;
}
