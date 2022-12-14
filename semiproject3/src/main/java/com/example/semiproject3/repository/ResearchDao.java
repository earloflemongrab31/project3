package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.ResearchDto;
import com.example.semiproject3.vo.BuyListCountVO;
import com.example.semiproject3.vo.ResearchCountVO;

public interface ResearchDao {
	
	//insert 	
	void insert(ResearchDto researchDto);
	//리서치 아이디중복방지
	int overlapId(String customerId);
	
	List<ResearchDto> selectList();
	
	List<ResearchCountVO> selectCountList();
	List<ResearchCountVO> selectCountList1();
	List<ResearchCountVO> selectCountList2();
	List<ResearchCountVO> selectCountList3();
	List<ResearchCountVO> selectCountList4();
	List<ResearchCountVO> selectCountList5();
}
