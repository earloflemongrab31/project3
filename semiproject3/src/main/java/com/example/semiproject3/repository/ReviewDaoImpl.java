package com.example.semiproject3.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void insert(ReviewDto reviewDto) {
		String sql="insert into review values(review_seq.nextval,?,?,?,?,?,?,sysdate)";
		Object[] param= {
				reviewDto.getCustomerId(),
				reviewDto.getItemNo(),
				reviewDto.getReviewContent(),
				reviewDto.getReviewStar(),
				reviewDto.getReviewShipping(),
				reviewDto.getReviewPackaging()
		};
		jdbcTemplate.update(sql,param);
	}
	
}
