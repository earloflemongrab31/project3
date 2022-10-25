package com.example.semiproject3.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.MainEditDto;

@Repository
public class MainEditDaoImpl implements MainEditDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void insert(MainEditDto mainEditDto) {
		String sql = "insert into main_edit(image_path, ";
	}
	
	
}
