package com.example.semiproject3.repository;

import com.example.semiproject3.entity.AdminDto;

public interface AdminDao {

	void insert(AdminDto adminDto);
	boolean delete(String adminId);
}
