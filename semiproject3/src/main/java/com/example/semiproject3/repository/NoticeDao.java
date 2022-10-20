package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.NoticeDto;
import com.example.semiproject3.vo.NoticeListSearchVO;
import com.example.semiproject3.vo.NoticeListVO;

public interface NoticeDao {
	
	
	void insert(NoticeDto noticeDto);
	
	int sequence();
	
	List<NoticeDto> selectList(); 

	//통합 검색 메소드(목록+검색)
	List<NoticeListVO> selectList(NoticeListSearchVO vo);
	List<NoticeListVO> list(NoticeListSearchVO vo);
	List<NoticeListVO> search(NoticeListSearchVO vo);
	
	//검색과 목록의 총 데이터 개수를 구하는 메소드(마지막 페이지 번호)
	int count(NoticeListSearchVO vo);
	int searchCount(NoticeListSearchVO vo);
	int listCount(NoticeListSearchVO vo);
	
	List<NoticeDto> selectList(String type, String keyword);
	
	NoticeDto selectOne(int noticeNo);
	NoticeDto read(int noticeNo);
	

	boolean update(NoticeDto noticeDto);


	boolean updateReadcount(int noticeNo);
	

	boolean delete(int noticeNo);


	
}
