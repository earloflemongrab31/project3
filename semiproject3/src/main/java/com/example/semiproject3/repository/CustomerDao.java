package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.AddressDto;
import com.example.semiproject3.entity.CustomerDto;

public interface CustomerDao {
	
	//회원 등록
	void insert(CustomerDto customerDto);
	
	//회원 목록 및 검색
	List<CustomerDto> selectList();
	List<CustomerDto> selectList(String type,String keyword);
	
	//회원 정보
	CustomerDto selectOne(String customerId);
	
	//회원 수정
	boolean update(CustomerDto customerDto);
	
	//회원 삭제
	boolean delete(String customerId);
	
	//리서치 완료시 포인트 추가 
	boolean updatePoint(String customerId);
	//리서치 아이디중복방지
	int overlapId(String customerId);
	
	//로그인 시간 갱신
	boolean updateLoginTime(String customerId);
	
	//비밀번호 찾기
	boolean checkPassword(String customerId, String customerPwsearch);
	
	//비밀번호 변경
	void changePassword(String customerPw, String customerId);

	//닉네임 찾기
	CustomerDto findByNick(String customerNick);

	//개인정보 변경
	boolean changeInformation(CustomerDto customerDto);


	List<CustomerDto> selectAddressList(String addressNo, int begin, int end);
	
}
