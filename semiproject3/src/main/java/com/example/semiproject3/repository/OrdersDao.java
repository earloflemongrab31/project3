package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.OrdersDto;

public interface OrdersDao {

	//시퀀스 발행
	int sequnece();
	
	//목록
	List<OrdersDto> selectList();
	
	//주문 입력
	void insert(OrdersDto ordersDto);
	
	//주문 삭제
	void delete(OrdersDto ordersDto);
	
	//주문 체크
	boolean check(OrdersDto ordersDto);
	
	//회원이 주문할 아이템
	List<OrdersDto> selectList(String type, String keyword);
	
	//회원이 선택한 총 주문수 
	int selectOrders(String loginId);

	List<OrdersDto> selectList(String customerId);
	
}
