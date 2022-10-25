package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.AddressDto;
import com.example.semiproject3.entity.CustomerLikeDto;

public interface CustomerLikeDao {
	
	void insert(CustomerLikeDto customerLikeDto);
	
	void delete(CustomerLikeDto customerLikeDto);
	
	boolean check(CustomerLikeDto customerLikeDto);
	
	int count(int itemNo);
	
	int likeCount(String loginId);
	
	void refresh(int itemNo);
	
	void likeRefresh(String loginId);

	List<CustomerLikeDto> selectList(String loginId);

	
}
