package com.example.semiproject3.repository;

import java.util.List;

public interface InvenDao {
	
	void insert(InvenDto invenDto);
	List<InvenDto> selectList();
	List<InvenDto> selectList(String type, String keyword);
	
	
}
