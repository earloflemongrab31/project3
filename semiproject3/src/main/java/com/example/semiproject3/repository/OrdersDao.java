package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.CartDto;
import com.example.semiproject3.entity.OrdersDto;
import com.example.semiproject3.vo.OrdersListSearchVO;

public interface OrdersDao {

	//목록
	List<OrdersDto> selectList();
	
	//주문 입력
	void insert(OrdersDto ordersDto);
	
	//주문하기
//	boolean update(OrdersDto ordersDto);
	
	//주문 삭제
	void delete(int ordersNo);
	
	//주문 체크
	boolean check(OrdersDto ordersDto);
	
	//회원이 주문할 아이템
	List<OrdersDto> selectList(String type, String keyword);
	
	//회원이 선택한 총 주문수 
	int selectOrders(int ordersNo);
	
	//주문 목록에 있는지 중복 조회
	OrdersDto selectOne(OrdersDto ordersDto);
	OrdersDto selectOne2(int itemCnt);
	
	//주문 목록
	List<OrdersDto> selectList(String loginId);
	
	
	//통합 메소드(검색+목록)
	List<OrdersDto> selectList(OrdersListSearchVO vo);
	List<OrdersDto> list(OrdersListSearchVO vo);
	List<OrdersDto> search(OrdersListSearchVO vo);
	
	//검색과 목록의 총 데이터 개수를 구하는 메소드(마지막 페이지 번호)
	int count(OrdersListSearchVO vo);
	int searchCount(OrdersListSearchVO vo);
	int listCount(OrdersListSearchVO vo);
	
	//주문 목록에 있는 상품 수량 변경(중복인경우)
	void plus(OrdersDto ordersDto);
	
	void minus(OrdersDto ordersDto);
	
}
