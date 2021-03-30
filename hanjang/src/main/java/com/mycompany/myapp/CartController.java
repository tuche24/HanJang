package com.mycompany.myapp;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.myapp.service.CartService;
import com.mycompany.myapp.vo.CartProductVO;
import com.mycompany.myapp.vo.CartVO;
import com.mycompany.myapp.vo.MemberVO;
import com.mycompany.myapp.vo.OrderListVO;

// 장바구니에 담기 버튼을 클릭시 작동하는 컨트롤러
@Controller
public class CartController {

	@Resource(name = "cartService")
	private CartService service;
	
	// 장바구니 담기 서비스
	@RequestMapping(value="/addCart.do")
	public String addCart(CartVO cartVO, HttpSession session) {
		// DB에 cart 정보 담기
		service.insertCart(cartVO);
		
		return "cart/cart";
	}
	
	// 특정 유저 장바구니 확인
	@RequestMapping(value="/getOneCart.do")
	public ModelAndView getOneCart(HttpSession session, HttpServletResponse res) throws IOException {
		ModelAndView mav = new ModelAndView();
		PrintWriter out = res.getWriter();
		/*int UserNo = 27; // test*/
		res.setContentType("text/html; charset=UTF-8");
		MemberVO membervo = (MemberVO) session.getAttribute("memberVO");
		if(membervo != null) {
			System.out.println("memberVO 값이 있습니다");
			List<CartProductVO> cartList = service.getOneCart(membervo.getUserNo());
			
			if(cartList != null) {
				mav.addObject("cartList", cartList);
			}
				// 카트리스트 없을때 오류
			mav.setViewName("cart/cart");
			
			return mav;
		}
		// 유저정보가 없을때 loginForm으로 이동
		mav.setViewName("LoginForm");
		out.println("<script>alert(\"유저정보가 없습니다.\")</script>");
		out.flush();
		return mav;
	}
	
	// 장바구니 수정 ajax
	@PostMapping("updateCart.do")
	@ResponseBody
	public Map<String, Object> updateCart(CartVO cartVO) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		System.out.println("업데이트 카트 테스트 : " + cartVO.getAmount());
		service.updateCart(cartVO);
		
		result.put("code", "서버동기화");
		return result;
	}
	
	// 장바구니 삭제
	@PostMapping(value="deleteCart.do")
	@ResponseBody
	public Map<String, Object> deleteCart(CartVO cartVO) {
		System.out.println("동기화확인");
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		service.deleteCart(cartVO);
		result.put("code", "서버동기화");
		return result;
	}
	
	@RequestMapping(value = "/goToPopUp.do")
	public String goToPopUp() {
		return "cart/address_popup";
	}

}