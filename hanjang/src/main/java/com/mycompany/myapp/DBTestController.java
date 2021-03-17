package com.mycompany.myapp;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.myapp.service.TestService;
import com.mycompany.myapp.vo.TestVO;

@Controller
public class DBTestController {
	
	@Resource(name = "testService")
	private TestService testService;
	
	@RequestMapping(value = "/testAll.do")
	public String testAll(Model model) {
		
		ArrayList<TestVO> alist = testService.getAllTest();
		
		model.addAttribute("alist", alist);
		
		return "/test/testAll";
	}
	
	@RequestMapping(value = "/testInsertForm.do")
	public String testInsertForm(@ModelAttribute("testVO")TestVO testVO, Model model) {
		
		return "/test/testInsertForm";
		// testInsertForm.jsp로 다시간다
	}
	
	@RequestMapping(value = "/testInsert.do")
	public String testInsert(@ModelAttribute("testVO") TestVO testVO, Model model) {
		
		testService.insertTest(testVO);
		return "redirect:/testAll.do";
	}
	
	@RequestMapping("/testDelete.do")
	public String testDelete(TestVO testVO, Model model) {
		
		testService.deleteTest(testVO);
		
		return "redirect:/testAll.do";
	}
}
