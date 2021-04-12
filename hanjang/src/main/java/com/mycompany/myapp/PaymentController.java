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

	// 결제에 필요한 정보를 가지고 payment로 이동
	@RequestMapping(value = "/goToPayment.do")
	public ModelAndView insertPayment(@RequestParam(required = false) int orderListNo, HttpSession session) {
		ModelAndView mav = new ModelAndView();

		List<OrderListVO> orderListVO = service.getOrderList_No(orderListNo);
		PaymentVO paymentVO = transformToPayment(session, orderListVO);

		session.setAttribute("payment", paymentVO);
		mav.setViewName("payment/Payment");
		return mav;
	}

	// orderList와 session 값을 paymentVO로 변환
	public PaymentVO transformToPayment(HttpSession session, List<OrderListVO> orderListVO) {
		String title = orderListVO.get(0).getBookVO().getTitle(); // 상품명
		int orderAmount = orderListVO.size() - 1;
		if (orderAmount >= 1) {
			title = title + " 외 " + orderAmount + "개의 상품";
		}

		int priceTotal = 0; // 총 금액
		for (OrderListVO orderList : orderListVO) {
			String sPrice = orderList.getBookVO().getPriceStandard();
			int price = Integer.parseInt(sPrice);
			int amount = orderList.getCartVO().getAmount();
			priceTotal += price * amount;
		}
		
		int orderListNo = orderListVO.get(0).getOrderListNo();
		
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String email = memberVO.getEmail();
		String name = memberVO.getName();
		String phone = memberVO.getPhone();
		String address = memberVO.getAddress();

		PaymentVO paymentVO = new PaymentVO(title, priceTotal, email, name, phone, address, orderListNo);

		System.out.println("test = " + paymentVO.getTitle());
		System.out.println("test = " + paymentVO.getEmail());
		System.out.println("test = " + paymentVO.getPriceTotal());

		return paymentVO;
	}

	// 결제 완료 페이지
	@RequestMapping(value = "/goToComplete.do")
	public ModelAndView goToComplete(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		PaymentVO paymentVO = (PaymentVO) session.getAttribute("payment");
		
		// 결제완료시 IsFinished Update
		service.updatePayment(paymentVO.getOrderListNo());
		
		session.removeAttribute("payment"); // 주문내역서 paymentVO에 옮기고 세션에서 지우기

		mav.addObject("payment", paymentVO);
		mav.setViewName("payment/Complete");
		return mav;
	}
}
