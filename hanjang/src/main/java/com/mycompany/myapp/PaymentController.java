package com.mycompany.myapp;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.service.OrderListService;
import com.mycompany.myapp.vo.OrderListVO;

@Controller
public class PaymentController {

	@Resource(name = "orderListService")
	private OrderListService service;
	
	@RequestMapping(value="/addPayment.do")
	public ModelAndView insertPayment(@RequestParam(required=false) int orderListNo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		List<OrderListVO> orderListVO = service.getOrderList_No(orderListNo);
		orderListVO.get(0).getBookVO().getTitle();
		
		mav.setViewName("payment/Payment");
		return mav;
	}
	
	
}
