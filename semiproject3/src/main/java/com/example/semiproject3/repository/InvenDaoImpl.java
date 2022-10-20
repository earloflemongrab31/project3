package com.example.semiproject3.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class InvenDaoImpl implements InvenDao{

	@Autowired 
	private JdbcTemplate jdbcTemplate;
}
