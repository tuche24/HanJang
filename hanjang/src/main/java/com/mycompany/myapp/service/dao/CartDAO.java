package com.mycompany.myapp.service.dao;

import java.util.List;

import com.mycompany.myapp.vo.CartProductVO;
import com.mycompany.myapp.vo.CartVO;
import com.mycompany.myapp.vo.OrderListVO;

// 장바구니 DAO
public interface CartDAO {
	// 카트DB 인서트
	void insertCart(CartVO cartVO);
	
	// 특정 유저 장바구니 확인 
	List<CartProductVO> getOneCart(int UserNo);
	
	// 장바구니 수정
	void updateCart(CartVO cartVO);
	
	// 장바구니 삭제
	void deleteCart(CartVO cartVO);
	
	int checkItemId(CartVO cartVO);
}
