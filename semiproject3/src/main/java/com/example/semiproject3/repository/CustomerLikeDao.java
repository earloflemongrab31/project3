package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.AddressDto;
import com.example.semiproject3.entity.CustomerDto;
import com.example.semiproject3.entity.CustomerLikeDto;
import com.example.semiproject3.vo.CustomerListSearchVO;

public interface CustomerLikeDao {
	
	void insert(CustomerLikeDto customerLikeDto);
	
	void delete(CustomerLikeDto customerLikeDto);
	
	boolean check(CustomerLikeDto customerLikeDto);
	
	int count(int itemNo);
	
	int likeCount(String loginId);
	
	void refresh(int itemNo);
	
	void likeRefresh(String loginId);

	List<CustomerLikeDto> selectList(String loginId);
	
	//통합 메소드(검색+목록)
	List<CustomerLikeDto> selectList(CustomerListSearchVO vo);
	List<CustomerLikeDto> list(CustomerListSearchVO vo);
	List<CustomerLikeDto> search(CustomerListSearchVO vo);
		
	//검색과 목록의 총 데이터 개수를 구하는 메소드(마지막 페이지 번호)
	int count(CustomerListSearchVO vo);
	int searchCount(CustomerListSearchVO vo);
	int listCount(CustomerListSearchVO vo);

	
}
