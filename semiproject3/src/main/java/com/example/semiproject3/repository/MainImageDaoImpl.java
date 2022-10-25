package com.example.semiproject3.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MainImageDaoImpl implements MainImageDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void insert(int imageNo, String imagePath) {
		String sql = "insert into main_image(main_no, image_no, image_path) values(1, ?, ?)";
		Object[] param = {imageNo, imagePath};
		jdbcTemplate.update(sql, param);
	}

}
