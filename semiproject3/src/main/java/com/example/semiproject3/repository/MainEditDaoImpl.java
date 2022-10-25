package com.example.semiproject3.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MainEditDaoImpl implements MainEditDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void update(String mainEditor, String mainContent) {
		String sql = "update main_edit set main_editor=?, main_content=? where main_no=1";
		Object[] param = {mainEditor, mainContent};
		jdbcTemplate.update(sql, param);
	}
	
	
}
