package com.example.semiproject3.repository;

import com.example.semiproject3.entity.ReviewLikeDto;

public interface ReviewLikeDao {

	//입력
	void insert(ReviewLikeDto dto);
	//삭제
	void delete(ReviewLikeDto dto);
	//체크
	boolean check(ReviewLikeDto dto);
	//갯수확인
	int count(int reviewNo);
	
}

