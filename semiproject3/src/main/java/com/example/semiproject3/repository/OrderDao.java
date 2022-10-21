package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.OrderDto;

public interface OrderDao {

	//시퀀스 발행
	int sequence();
	
	//등록
	void insert(OrderDto orderDto);
	
	//목록
	List<OrderDto> selectList(String loginId);
	
	//정보
	OrderDto selectOne(String loginId);
	
	//수정,삭제
	boolean update(OrderDto orderDto);
	boolean delete(int orderNo);
}
