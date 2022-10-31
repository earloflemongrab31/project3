package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.AdminDto;
import com.example.semiproject3.vo.BuyListSearchVO;

public interface AdminDao {

	//등록
	void insert(AdminDto adminDto);
	
	//삭제
	boolean delete(String adminId);

	AdminDto selectOne(String adminId);

	List<AdminDto> selectList();
	
	boolean update(AdminDto adminDto);

	boolean update2(AdminDto adminDto);
	
	//통합 메소드(검색+목록)
	List<AdminDto> selectList(String loginId, BuyListSearchVO vo);
	List<AdminDto> list(String loginId, BuyListSearchVO vo);
	List<AdminDto> search(String loginId, BuyListSearchVO vo);
				
	//검색과 목록의 총 데이터 개수를 구하는 메소드(마지막 페이지 번호)
	int count(BuyListSearchVO vo);
	int searchCount(BuyListSearchVO vo);
	int listCount(BuyListSearchVO vo);
	
}
