package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.CardDto;
import com.example.semiproject3.entity.CartDto;
import com.example.semiproject3.entity.CardDto;
import com.example.semiproject3.vo.CardListSearchVO;

public interface CardDao {
		
		//번호생성
		int sequence();
		//입력
		void insert(CardDto cardDto);
		//전체리스트
		List<CardDto> selectList();
		//하나의 이미지 
		CardDto selectOne(int cardNo);
		//이미지 삭제 
		boolean delete(int cardNo);
		
		//통합 메소드(검색+목록)
		List<CardDto> selectList(CardListSearchVO vo);
		List<CardDto> list(CardListSearchVO vo);
		List<CardDto> search(CardListSearchVO vo);
			
		//검색과 목록의 총 데이터 개수를 구하는 메소드(마지막 페이지 번호)
		int count(CardListSearchVO vo);
		int searchCount(CardListSearchVO vo);
		int listCount(CardListSearchVO vo);
		
		
		
		
}
