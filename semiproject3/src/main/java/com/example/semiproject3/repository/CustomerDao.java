package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.CustomerDto;

public interface CustomerDao {
	
	void insert(CustomerDto dto);
	List<CustomerDto> selectList();
	List<CustomerDto> selectList(String type,String keyword);
	CustomerDto selectOne(String customerId);
	
	boolean update(CustomerDto dto);
	boolean delete(String customerId);
}
