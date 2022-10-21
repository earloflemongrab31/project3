package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.OrderDto;

public interface OrderDao {

	//주문 시퀀스 발행
	int sequence();
	
	//주문 등록
	void insert(OrderDto orderDto);
	
	//주문 목록
	List<OrderDto> selectList();
	List<OrderDto> selectList(String type, String keyword);
	
	//주문 정보
	OrderDto selectOne(int orderNo);
	
	//주문 수정,삭제
	boolean update(OrderDto orderDto);
	boolean delete(int orderNo);
	
}
