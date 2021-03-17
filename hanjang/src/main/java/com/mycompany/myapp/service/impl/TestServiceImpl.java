package com.mycompany.myapp.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.myapp.service.TestService;
import com.mycompany.myapp.service.dao.TestDAO;
import com.mycompany.myapp.vo.TestVO;

@Service("testService")
public class TestServiceImpl implements TestService{

	@Autowired
	private TestDAO testkaja;
	
	@Override
	@Transactional
	public ArrayList<TestVO> getAllTest() {
		return testkaja.getAllTest();
	}

	@Override
	public void insertTest(TestVO testVO) {
		testkaja.insertTest(testVO);
	}

	@Override
	public void deleteTest(TestVO testVO) {
		testkaja.deleteTest(testVO);
	}

}
