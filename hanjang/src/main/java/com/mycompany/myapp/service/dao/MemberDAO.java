package com.mycompany.myapp.service.dao;

import com.mycompany.myapp.vo.MemberVO;

public interface MemberDAO {

	
	void MemberInsert(MemberVO membervo) throws Exception;
	
	public MemberVO LoginCheck(MemberVO membervo) throws Exception;
	
	public int IdCheck(String param) throws Exception;
}
