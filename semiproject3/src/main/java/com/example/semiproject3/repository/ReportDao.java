package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.ReportDto;

public interface ReportDao {

	//입력
	void insert(ReportDto roportDto);
	
	//목록
	List<ReportDto> selectList();
	
	//타입 키워드
	List<ReportDto> selectList(String type, String keyword);
	
}
