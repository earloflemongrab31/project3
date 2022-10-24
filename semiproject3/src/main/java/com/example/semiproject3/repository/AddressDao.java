package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.AddressDto;

public interface AddressDao {

	//번호 생성
	int sequence();
	
	//등록
	List<AddressDto> insert(AddressDto addressDto);
	
	//목록 & 타입키워드 목록
	List<AddressDto> selectList();
	List<AddressDto> selectList(String type, String keyword);
	
	
	List<AddressDto> selectOneBasic();
	
	
	//셀렉트원
	AddressDto selectOne(int addressNo);

	
	//수정 , 삭제
	boolean update(AddressDto addressDto);
	boolean delete(int addressNo);
	boolean addBasic(int addressNo, String addBasic);
	boolean addBasicUpdate(int addressNo);
	boolean basicUpdate(int addressNo);
	


}
