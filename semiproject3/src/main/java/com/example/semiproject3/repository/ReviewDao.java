package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.ReviewDto;

public interface ReviewDao {

	//시퀀스 발행
	int sequence();
	
	//등록
	void insert(ReviewDto reviewDto);
	
	//목록
	List<ReviewDto> selectList();
	List<ReviewDto> selectList(String type, String keyword);
	
	//리뷰 정보
	ReviewDto selectOne(int reviewNo);
	
	//수정,삭제
	boolean update(ReviewDto reviewDto);
	boolean delete(int reviewNo);
	
}
