package com.mycompany.myapp.service.dao;

import com.mycompany.myapp.vo.MemberVO;

public interface MemberDAO {

	
	void MemberInsert(MemberVO membervo);
	
	public boolean LoginCheck(MemberVO membervo);
	public MemberVO viewMember(MemberVO membervo);
}
