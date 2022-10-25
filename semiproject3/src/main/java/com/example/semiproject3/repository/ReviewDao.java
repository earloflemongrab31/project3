package com.example.semiproject3.repository;

import com.example.semiproject3.entity.ReviewDto;

public interface ReviewDao {

	//리뷰작성 
	void insert(ReviewDto reviewDto);
	
}
