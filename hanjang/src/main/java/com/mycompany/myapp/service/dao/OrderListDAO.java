package com.mycompany.myapp.service.dao;

import java.util.List;

import com.mycompany.myapp.vo.OrderListVO;

// 주문확인리스트
public interface OrderListDAO {

	// 주문확인서 인서트
	void insertOrderList(OrderListVO orderListVO);
	// 주문확인서 하나보기
	List<OrderListVO> getOneOrderList(int orderListNo);
	// 주문확인서 유저별 최근 하나 가져오기
	OrderListVO getLatelyOrderList(int userNo);
}
