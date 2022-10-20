package com.example.semiproject3.repository;

import com.example.semiproject3.entity.CustomerLikeDto;

public interface CustomerLikeDao {
	
	void insert(CustomerLikeDto customerLikeDto);
	
	void delete(CustomerLikeDto customerLikeDto);
	
	boolean check(CustomerLikeDto customerLikeDto);
	
	int count(int itemNo);
	
	void refresh(int itemNo);
}
