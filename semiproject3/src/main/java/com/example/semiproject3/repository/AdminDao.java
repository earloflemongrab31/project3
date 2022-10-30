package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.AdminDto;

public interface AdminDao {

	//등록
	void insert(AdminDto adminDto);
	
	//삭제
	boolean delete(String adminId);

	AdminDto selectOne(String adminId);

	List<AdminDto> selectList();
	
	boolean update(AdminDto adminDto);

	boolean update2(AdminDto adminDto);
}
