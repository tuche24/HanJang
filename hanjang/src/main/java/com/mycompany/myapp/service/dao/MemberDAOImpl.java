package com.mycompany.myapp.service.dao;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.myapp.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	 
	    @Inject SqlSessionTemplate sql;
	 public static String namespace = "com.mycompany.myapp.service.dao.MemberDAO";

	@Override
	public void MemberInsert(MemberVO membervo) throws Exception {
		sql.insert(namespace+".MemberInsert",membervo);
		
	}

	@Override
	public MemberVO LoginCheck(MemberVO membervo) throws Exception {
	
		return sql.selectOne(namespace+".LoginCheck",membervo);
	}

}
