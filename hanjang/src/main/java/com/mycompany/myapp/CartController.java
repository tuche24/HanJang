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

import com.mycompany.myapp.service.CartService;
import com.mycompany.myapp.vo.CartProductVO;
import com.mycompany.myapp.vo.CartVO;

// 장바구니에 담기 버튼을 클릭시 작동하는 컨트롤러
@Controller
public class CartController {

	@Resource(name = "cartService")
	private CartService service;

	// 장바구니 담기 서비스
	@RequestMapping(value = "/addCart.do")
	public String addCart(CartVO cartVO, HttpSession session) {
		int cartNo = 0;

		// 세션에 장바구니 번호 받아오기
		Object strSessionCartNo = session.getAttribute("sessionCartNo");

		if (strSessionCartNo == null) {
			// CartNo 생성
			cartNo = Integer.parseInt(generateCartNo());
		} else {
			cartNo = (int) session.getAttribute("sessionCartNo");
		}

		session.setAttribute("sessionCartNo", cartNo);

		cartVO.setCartNo(cartNo);
		
		int checkItemId = service.checkItemId(cartVO);
		
		if (checkItemId < 1) {
			service.insertCart(cartVO);
		} else {
			System.out.println("ItemId값이 중복되었습니다");
		}
		
		return "cart/cart"; // 다른 string으로 바꾸면 오류
	}

	// 특정 유저 장바구니 확인
	@RequestMapping(value = "/getOneCart.do")
	public ModelAndView getOneCart(HttpSession session, HttpServletResponse res) throws IOException {
		ModelAndView mav = new ModelAndView();
		int cartNo = 0;

		Object sessionCartNo = session.getAttribute("sessionCartNo"); // 장바구니번호가 없을 시 오류

		if (sessionCartNo != null) {
			cartNo = (int) session.getAttribute("sessionCartNo");

			List<CartProductVO> cartList = service.getOneCart(cartNo);

			if (cartList != null) {
				mav.addObject("cartList", cartList);
			}
			mav.setViewName("cart/cart");

			return mav;
		} else {				
			// 장바구니 정보가 없을 때 새 책 으로 이동 // OR 최근 장바구니 정보 가져오기
			/*alertMessage("장바구니에 상품이 담기지 않았습니다", res);*/
			mav.setViewName("gomain");
			System.out.println("장바구니 정보가 없습니다");
			return mav;
		} 
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
	@PostMapping(value = "deleteCart.do")
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

	// 장바구니 번호 생성
	public String generateCartNo() {
		String result = "";
		Calendar cal = Calendar.getInstance();
		String ymd = new DecimalFormat("##").format(cal.get(Calendar.DATE));
		String subNum = "";
		for (int i = 1; i <= 6; i++) {
			subNum += (int) (Math.random() * 10);
		}
		result = ymd + subNum;

		System.out.println("장바구니번호가 생성되었습니다 = " + result);
		return result;
	}
	
	public void alertMessage(String msg, HttpServletResponse res) throws IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		
		out.println("<script>alert(\"" + msg + "\")</script>");
		out.flush();
		
	}
	
	
}