package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.AddressDto;
import com.example.semiproject3.entity.BuyDto;
import com.example.semiproject3.entity.NoticeDto;
import com.example.semiproject3.entity.ReviewDto;
import com.example.semiproject3.vo.ReviewListSearchVO;

public interface ReviewDao {

	//시퀀스 번호 생성
	int sequence();
	//리뷰작성 
	void insert(ReviewDto reviewDto);
	
	//itemNo에 달린 리뷰글 
	List<ReviewDto> selectList(int itemNo);
	
	//하나의관한 리뷰+이미지 
	ReviewDto selectOne(int reviewNo);
	
	//하나의관한 리뷰
	ReviewDto selectOne2(int reviewNo);
	
	//리뷰이미지 연결
	void connectAttachment(int reviewNo, int imageNo);
	
	//review_real+이미지
	List<ReviewDto> selectList2(int itemNo);
	
	//통합 메소드(검색+목록)
	List<ReviewDto> selectList(ReviewListSearchVO vo);
	List<ReviewDto> list(ReviewListSearchVO vo);
	List<ReviewDto> search(ReviewListSearchVO vo);
		
	//검색과 목록의 총 데이터 개수를 구하는 메소드(마지막 페이지 번호)
	int count(ReviewListSearchVO vo);
	int searchCount(ReviewListSearchVO vo);
	int listCount(ReviewListSearchVO vo);
	//블라인드 처리 
	boolean updateBlind(int reviewNo, boolean b);
	
	//좋아요 클릭했을때 하나 플러스 
	void plus(int reviewNo);
	//좋아요를 취소 했을해 하나 마이너스 
	void minus(int reviewNo);

	List<ReviewDto> customerSelectList(String loginId);
	
}
