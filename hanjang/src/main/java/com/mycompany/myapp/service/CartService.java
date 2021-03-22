package com.mycompany.myapp.service;

import java.util.List;

import com.mycompany.myapp.vo.CartProductVO;
import com.mycompany.myapp.vo.CartVO;

// DAO와 연결서비스
public interface CartService {
	// 장바구니 담기
	void insertCart(CartVO cartVO);
	
	// 특정 유저 장바구니 확인 
	List<CartProductVO> getOneCart(int UserNo);
	
	// 장바구니 수정
	void updateCart(CartVO cartVO);
	
	// 장바구니 삭제
	void deleteCart(CartVO cartVO);

}
