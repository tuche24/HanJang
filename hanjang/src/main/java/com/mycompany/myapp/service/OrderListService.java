package com.mycompany.myapp.service;

import java.util.List;

import com.mycompany.myapp.vo.OrderListVO;

// 주문확인서비스
public interface OrderListService {

	// 주문확인서 인서트
	void insertOrderList(OrderListVO orderListVO);

	// 주문확인서 하나보기
	List<OrderListVO> getOneOrderList(int orderListNo);

	// 주문확인서 최근 하나보기
	List<OrderListVO> getLatelyOrderList(OrderListVO orderListVO);

	// 인서트시 아이템아이디 체크
	int checkOrderItemId(OrderListVO orderListVO);
	
	// 주분내역 가져오기
	List<OrderListVO> getOrderedList(OrderListVO orderListVO);
}
