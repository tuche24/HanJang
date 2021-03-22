package com.mycompany.myapp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.service.CartService;
import com.mycompany.myapp.vo.CartProductVO;
import com.mycompany.myapp.vo.CartVO;

// 장바구니에 담기 버튼을 클릭시 작동하는 컨트롤러
@Controller
public class CartController {

	@Resource(name = "cartService")
	private CartService service;
	
	// 장바구니 담기 서비스
	@RequestMapping(value="/addCart.do")
	public String addCart(CartVO cartVO) {
		service.insertCart(cartVO);
		
		return "cart/cart";
	}
	
	// 특정 유저 장바구니 확인
	@RequestMapping(value="/getOneCart.do")
	public ModelAndView getOneCart() {
		ModelAndView mav = new ModelAndView();
		int UserNo = 27; // test
		
		List<CartProductVO> cartList = service.getOneCart(UserNo);
		System.out.println("cartList 테스트 : " + cartList.get(0).getBookVO().getTitle());
		mav.addObject("cartList", cartList);
		mav.setViewName("cart/cart");
		
		return mav;
	}
	
	// 장바구니 수정
	@RequestMapping(value="/updateCart.do")
	public String updateCart(CartVO cartVO) {
		service.updateCart(cartVO);
		
		return "cart/cart";
	}
	
	// 장바구니 삭제
	@RequestMapping(value="/deleteCart.do")
	public String deleteCart(CartVO cartVO) {
		service.deleteCart(cartVO);
		
		return "cart/cart";
	}
	
}
