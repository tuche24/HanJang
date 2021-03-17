package com.mycompany.myapp.service;

import java.util.ArrayList;

import com.mycompany.myapp.vo.TestVO;

public interface TestService {

	ArrayList<TestVO> getAllTest();
	
	void insertTest(TestVO testVO);
	
	void deleteTest(TestVO testVO);
}
