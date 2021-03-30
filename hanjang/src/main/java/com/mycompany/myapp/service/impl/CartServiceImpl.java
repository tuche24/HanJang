package com.mycompany.myapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.myapp.service.CartService;
import com.mycompany.myapp.service.dao.CartDAO;
import com.mycompany.myapp.vo.CartProductVO;
import com.mycompany.myapp.vo.CartVO;
import com.mycompany.myapp.vo.OrderListVO;

@Service("cartService")
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO dao;
	
	@Override
	public void insertCart(CartVO cartVO) {
		dao.insertCart(cartVO);
	}

	@Override
	public List<CartProductVO> getOneCart(int UserNo) {
		List<CartProductVO> cartVO = dao.getOneCart(UserNo);
		return cartVO;
	}
	
	@Override
	public void updateCart(CartVO cartVO) {
		dao.updateCart(cartVO);
	}

	@Override
	public void deleteCart(CartVO cartVO) {
		dao.deleteCart(cartVO);		
	}

}
