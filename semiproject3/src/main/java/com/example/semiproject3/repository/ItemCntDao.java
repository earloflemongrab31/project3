package com.example.semiproject3.repository;

import com.example.semiproject3.entity.InvenDto;
import com.example.semiproject3.entity.ItemCntDto;

public interface ItemCntDao {
	//처음 상품의 재고 등록 시 들어가는 기능
	void insert(InvenDto invenDto);
	
	//재고 입출력 시 총수량 수정 기능
	void plus(int quantity, int itemNo);
	void minus(int quantity, int itemNo);
	
	ItemCntDto selectOne(InvenDto invenDto);
}
