package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.BuyDto;
import com.example.semiproject3.entity.CustomerDto;
import com.example.semiproject3.vo.CustomerJoinCountVO;
import com.example.semiproject3.vo.CustomerListSearchVO;

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
	
	
	//통합 메소드(검색+목록)
	List<CustomerDto> selectList(CustomerListSearchVO vo);
	List<CustomerDto> list(CustomerListSearchVO vo);
	List<CustomerDto> search(CustomerListSearchVO vo);
	
	//검색과 목록의 총 데이터 개수를 구하는 메소드(마지막 페이지 번호)
	int count(CustomerListSearchVO vo);
	int searchCount(CustomerListSearchVO vo);
	int listCount(CustomerListSearchVO vo);
	
	//회원 캐시 차감
	boolean cash(BuyDto buyDto);

	List<CustomerJoinCountVO> selectCountList();
}
