package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.CustomerDto;

public interface CustomerDao {
	
	//회원 등록
	void insert(CustomerDto dto);
	
	//회원 목록 및 검색
	List<CustomerDto> selectList();
	List<CustomerDto> selectList(String type,String keyword);
	
	//회원 정보
	CustomerDto selectOne(String customerId);
	
	//회원 수정
	boolean update(CustomerDto dto);
	
	//회원 삭제
	boolean delete(String customerId);
}
