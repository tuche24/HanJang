package com.mycompany.myapp.service.dao;

import java.util.ArrayList;

import com.mycompany.myapp.vo.TestVO;

public interface TestDAO {

	ArrayList<TestVO> getAllTest();
	
	void insertTest(TestVO testVO);
	
	void deleteTest(TestVO testVO);
}
