package com.example.semiproject3.repository;

import com.example.semiproject3.entity.MainEditDto;

public interface MainEditDao {

	void insert(String loginId);
	
	void update(MainEditDto mainEditDto);

	MainEditDto select();
}
