package com.example.semiproject3.repository;

import com.example.semiproject3.entity.AdminDto;

public interface AdminDao {

	//등록
	void insert(AdminDto adminDto);
	
	//삭제
	boolean delete(String adminId);
}
