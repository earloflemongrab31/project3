package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.ReviewDto;

public interface ReviewDao {

	//리뷰작성 
	void insert(ReviewDto reviewDto);
	
	//itemNo에 달린 리뷰글 
	List<ReviewDto> selectList(int itemNo);
	
	//하나의관한 리뷰 
	ReviewDto selectOne(int reviewNo);
}
