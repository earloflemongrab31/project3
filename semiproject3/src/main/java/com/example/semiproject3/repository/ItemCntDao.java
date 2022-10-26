package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.InvenDto;
import com.example.semiproject3.entity.ItemCntDto;

public interface ItemCntDao {
	//처음 상품의 재고 등록 시 들어가는 기능
	void insert(InvenDto invenDto);
	
	//재고 입출력 시 총수량 수정 기능
	void plus(InvenDto invenDto);
	
	void minus(InvenDto invenDto);
	
	ItemCntDto selectOne(InvenDto invenDto);

	List<ItemCntDto> selectList(int itemNo);

}
