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
		String test = orderListVO.get(0).getBookVO().getTitle(); // 상품명
		orderListVO.get(0).getBookVO().getPriceStandard();
		orderListVO.get(0).getCartVO().getAmount();
		
		int sum = 0;
		for(OrderListVO orderList : orderListVO) {
			String sPrice = orderList.getBookVO().getPriceStandard();
			int price = Integer.parseInt(sPrice);
			int amount = orderList.getCartVO().getAmount();
			sum += price * amount;
		}
		int priceTotal = sum;
		
		mav.setViewName("payment/Payment");
		return mav;
	}
	
	
}
