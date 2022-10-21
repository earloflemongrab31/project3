package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.OrderDto;

public interface OrderDao {

	//시퀀스 발행
	int sequence();
	
	//등록
	void insert(OrderDto orderDto);
	
	//목록
	List<OrderDto> selectList();
	List<OrderDto> selectList(String type, String keyword);
	
	//정보
	OrderDto selectOne(int orderNo);
	
	//수정,삭제
	boolean update(OrderDto orderDto);
	boolean delete(int orderNo);
}
