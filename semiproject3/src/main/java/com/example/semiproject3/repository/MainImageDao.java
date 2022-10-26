package com.example.semiproject3.repository;

import java.util.List;

import com.example.semiproject3.entity.MainImageDto;

public interface MainImageDao {
	void insert (int imageNo, String imagePath);

	List<MainImageDto> selectAll();
}
