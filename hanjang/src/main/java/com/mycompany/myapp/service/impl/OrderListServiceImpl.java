package com.mycompany.myapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.myapp.service.OrderListService;
import com.mycompany.myapp.service.dao.OrderListDAO;
import com.mycompany.myapp.vo.OrderListVO;

@Service("orderListService")
public class OrderListServiceImpl implements OrderListService {

	@Autowired
	private OrderListDAO dao;
	
	@Override
	public void insertOrderList(OrderListVO orderListVO) {
		// TODO Auto-generated method stub
		dao.insertOrderList(orderListVO);
	}

	@Override
	public List<OrderListVO> getOneOrderList(int orderListNo) {
		
		List<OrderListVO> list = dao.getOneOrderList(orderListNo);
		return list;
	}

	@Override
	public OrderListVO getLatelyOrderList(int userNo) {
		
		OrderListVO orderListVO = dao.getLatelyOrderList(userNo);
		return orderListVO;
	}

}
