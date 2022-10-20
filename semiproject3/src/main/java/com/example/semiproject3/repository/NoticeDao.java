package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.NoticeDto;
import com.example.semiproject3.vo.NoticeListSearchVO;

public interface NoticeDao {
	
	
	void insert(NoticeDto noticeDto);//번호를 만들면서 생성하는 메소드
	int sequence(); // 시퀀스 발행
	
	
	List<NoticeDto> selectList(); 
	List<NoticeDto> selectList(String type, String keyword);
	
	//통합 메소드(검색+목록)
	List<NoticeDto> selectList(NoticeListSearchVO vo);
	List<NoticeDto> list(NoticeListSearchVO vo);
	List<NoticeDto> search(NoticeListSearchVO vo);
	
	//검색과 목록의 총 데이터 개수를 구하는 메소드(마지막 페이지 번호)
	int count(NoticeListSearchVO vo);
	int searchCount(NoticeListSearchVO vo);
	int listCount(NoticeListSearchVO vo);
	
	
	
	NoticeDto selectOne(int noticeNo);
	NoticeDto read(int noticeNo);
	

	boolean update(NoticeDto noticeDto);
	boolean updateReadcount(int noticeNo);
	

	boolean delete(int noticeNo);



	

	
}
