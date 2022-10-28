package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.AddressDto;
import com.example.semiproject3.vo.AddressUniteVO;
import com.example.semiproject3.vo.CompanyUniteVO;

public interface AddressDao {

	//번호 생성
	int sequence();
	
	//등록
	List<AddressDto> insert(AddressDto addressDto);
	
	//목록 & 타입키워드 목록
	List<AddressDto> selectList(String loginId);
	List<AddressDto> selectList(String type, String keyword);
	
	
	List<AddressDto> selectOneBasic(String loginId);
	
	
	//셀렉트원
	AddressDto selectOne(int addressNo);
	AddressDto selectOne(String loginId);
	
	//수정 , 삭제
	boolean update(AddressDto addressDto);
	boolean delete(int addressNo);
	boolean addBasic(int addressNo, String addBasic);
	boolean addBasicUpdate(int addressNo,String loginId);
	boolean basicUpdate(int addressNo);
	

	List<AddressDto> selectAddressList(String customerId, int begin, int end);

	//통합 메소드(검색+목록)
	List<AddressDto> selectList(AddressUniteVO vo);
	List<AddressDto> list(AddressUniteVO vo);
	List<AddressDto> search(AddressUniteVO vo);
			
	//검색과 목록의 총 데이터 개수를 구하는 메소드(마지막 페이지 번호)
	int count(AddressUniteVO vo);
	int searchCount(AddressUniteVO vo);
	int listCount(AddressUniteVO vo);
	
	


}
