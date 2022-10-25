package com.example.semiproject3.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PathImageDaoImpl implements PathImageDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void insert(String imagePath, int imageNo) {
		String sql = "insert into path_image(image_path, image_no) values(?, ?)";
		Object[] param = {imagePath, imageNo};
		jdbcTemplate.update(sql, param);
	}

}
