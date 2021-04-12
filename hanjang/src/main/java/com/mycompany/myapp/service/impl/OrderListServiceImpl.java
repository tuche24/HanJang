package com.mycompany.myapp.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.myapp.service.OrderListService;
import com.mycompany.myapp.service.dao.OrderListDAO;
import com.mycompany.myapp.vo.OrderListVO;
import com.mycompany.myapp.vo.PageVO;

@Service("orderListService")
public class OrderListServiceImpl implements OrderListService {

	@Autowired
	private OrderListDAO dao;

	@Override
	public void insertOrderList(OrderListVO orderListVO) {
		// TODO Auto-generated method stub
		dao.insertOrderList(orderListVO);
	}

	/*
	 * @Override public List<OrderListVO> getOneOrderList(int orderListNo) {
	 * 
	 * List<OrderListVO> list = dao.getOneOrderList(orderListNo); return list; }
	 */

	@Override
	public List<OrderListVO> getLatelyOrderList(OrderListVO orderListVO1) {

		List<OrderListVO> orderListVO = dao.getLatelyOrderList(orderListVO1);
		return orderListVO;
	}

	@Override
	public int checkOrderItemId(OrderListVO orderListVO) {
		int result = dao.checkOrderItemId(orderListVO);
		return result;
	}

	@Override
	public List<OrderListVO> getOrderedList(@Param("userNo") int userNo, @Param("pv") PageVO pv) {
		return dao.getOrderedList(userNo, pv);
	}

	@Override
	public int countPosts(int userNo) {
		return dao.countPosts(userNo);
	}

	public List<OrderListVO> getOrderList_No(int orderListNo) {
		List<OrderListVO> orderListVO = dao.getOrderList_No(orderListNo);
		return orderListVO;
	}

	@Override
	public void updatePayment(int orderListVO) {
		dao.updatePayment(orderListVO);
	}
}
