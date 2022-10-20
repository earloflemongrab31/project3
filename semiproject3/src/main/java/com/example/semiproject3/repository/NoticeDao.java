package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.NoticeDto;

public interface NoticeDao {
	
	
	void insert(NoticeDto noticeDto);
	
	int sequence();
	
	List<NoticeDto> selectList();
	List<NoticeDto> selectList(String type, String keyword);
	
	NoticeDto selectOne(int noticeNo);
	
	boolean update(NoticeDto noticeDto);
	boolean delete(int noticeNo);
	
}
