package com.mycompany.myapp;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.service.OrderListService;
import com.mycompany.myapp.vo.MemberVO;
import com.mycompany.myapp.vo.OrderListVO;
import com.mycompany.myapp.vo.PaymentVO;

@Controller
public class PaymentController {

	@Resource(name = "orderListService")
	private OrderListService service;
	
	@RequestMapping(value="/addPayment.do")
	public ModelAndView insertPayment(@RequestParam(required=false) int orderListNo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println(orderListNo);
		List<OrderListVO> orderListVO = service.getOrderList_No(orderListNo);
		PaymentVO paymentVO = transformToPayment(session, orderListVO);
		
		/*mav.addObject("payment", paymentVO);*/
		session.setAttribute("payment", paymentVO);
		mav.setViewName("payment/Payment");
		return mav;
	}
	
	public PaymentVO transformToPayment(HttpSession session, List<OrderListVO> orderListVO) {
		
		String title = orderListVO.get(0).getBookVO().getTitle(); // 상품명
		int orderAmount = orderListVO.size();
		title = title + " 외 " + orderAmount + "의 상품";
		
		int priceTotal = 0; // 총 금액
		for(OrderListVO orderList : orderListVO) {
			String sPrice = orderList.getBookVO().getPriceStandard();
			int price = Integer.parseInt(sPrice);
			int amount = orderList.getCartVO().getAmount();
			priceTotal += price * amount;
		}
		
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String email = memberVO.getEmail();
		String name = memberVO.getName();
		String phone = memberVO.getPhone();
		String address = memberVO.getAddress();
		
		PaymentVO paymentVO = new PaymentVO(title, priceTotal, email, name, phone, address);
		
		System.out.println("test = " + paymentVO.getTitle());
		System.out.println("test = " + paymentVO.getEmail());
		System.out.println("test = " + paymentVO.getPriceTotal());
		return paymentVO;
	}
}
