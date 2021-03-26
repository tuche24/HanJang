package com.mycompany.myapp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
		/*System.out.println("cartList 테스트 : " + cartList.get(0).getBookVO().getTitle());*/
		if(cartList != null) {
			mav.addObject("cartList", cartList);
		}
			// 카트리스트 없을때 오류
		mav.setViewName("cart/cart");
		
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
	
	// 주문확인서이동
	@RequestMapping(value="/goToOrderList.do")
	public String goToOrderList() {
		
		return "cart/orderList";
	}
}
