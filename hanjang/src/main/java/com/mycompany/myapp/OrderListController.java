package com.mycompany.myapp;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.service.OrderListService;
import com.mycompany.myapp.vo.MemberVO;
import com.mycompany.myapp.vo.OrderListVO;

@Controller
public class OrderListController {

	@Resource(name = "orderListService")
	private OrderListService service;

	// 주문확인서이동
	@RequestMapping(value = "/goToOrderList.do")
	public ModelAndView goToOrderList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");

		/*
		 * if(memberVO == null) { // 유저정보가 없을 시 main 페이지로 이동
		 * System.out.println("memberVO 값이 없습니다"); mav.setViewName("main"); return mav;
		 * } // css 작업을 위해 주석처리
		 */
		int userNo = memberVO.getUserNo(); // 유저번호로 최근 OrderList DB 정보 불러오기

		System.out.println("goToOrderList.do userNo = " + userNo); // test

		int cartNo = (int) session.getAttribute("sessionCartNo");
		OrderListVO orderListVO1 = new OrderListVO();
		orderListVO1.setCartNo(cartNo);
		orderListVO1.setUserNo(userNo);

		List<OrderListVO> orderListVO = service.getLatelyOrderList(orderListVO1);

		mav.addObject("orderList", orderListVO);
		mav.setViewName("cart/orderList");

		return mav;
	}

	// 장바구니에서 주문확인서로 구매확인
	@PostMapping(value = "insertOrderList.do")
	@ResponseBody
	public void insertOrderList(OrderListVO orderListVO, HttpSession session) {

		// 세션에서 UserNo 가져오기
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		int userNo = memberVO.getUserNo();
		System.out.println("insertOrderList userNo= " + userNo);

		orderListVO.setUserNo(userNo);

		int checkOrderItemId = service.checkOrderItemId(orderListVO);

		if (checkOrderItemId < 1) {
			service.insertOrderList(orderListVO);
		} else {
			System.out.println("ItemId값이 중복되었습니다");
		}
	}

	// 즉시구매시 컨트롤
	@PostMapping(value = "insertOrderListDirect.do")
	@ResponseBody
	public void insertOrderListDirect(OrderListVO orderListVO, HttpSession session) {

		// 세션에서 UserNo 가져오기
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		int userNo = memberVO.getUserNo();
		System.out.println("insertOrderList userNo= " + userNo);
		int cartNo = (int) session.getAttribute("sessionCartNo");
		
		orderListVO.setUserNo(userNo);
		orderListVO.setCartNo(cartNo);
		
		service.insertOrderList(orderListVO);
	}

}
