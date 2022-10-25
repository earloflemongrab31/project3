package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.CardDto;
import com.example.semiproject3.entity.CartDto;

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
		
		
}
