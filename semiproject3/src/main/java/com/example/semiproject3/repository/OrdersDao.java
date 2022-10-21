package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.OrdersDto;

public interface OrdersDao {

	//주문 시퀀스 발행
	int sequence();
	
	//주문 등록
	void insert(OrdersDto ordersDto);
	
	//주문 목록
	List<OrdersDto> selectList();
	List<OrdersDto> selectList(String type, String keyword);
	
	//주문 정보
	OrdersDto selectOne(int ordersNo);
	
	//주문 수정,삭제
	boolean update(OrdersDto ordersDto);
	boolean delete(int ordersNo);
	
}
