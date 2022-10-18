package com.kh.semiproject.repository;

import java.util.List;

import com.kh.semiproject.entity.CustomerDto;

public interface CustomerDao {
	
	void insert(CustomerDto dto);
	List<CustomerDto> selectList();
	List<CustomerDto> selectList(String type,String keyword);
	CustomerDto selectOne(String customerId);
	
}
