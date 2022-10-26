package com.example.semiproject3.repository;

import com.example.semiproject3.entity.InvenDto;
import com.example.semiproject3.entity.ItemCntDto;
import com.example.semiproject3.entity.ItemDto;

public interface ItemCntDao {
	
	void insert(InvenDto invenDto);
	
	boolean update(InvenDto invenDto);
	
	ItemCntDto selectOne(InvenDto invenDto);
}
