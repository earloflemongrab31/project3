package com.example.semiproject3.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.AdminDto;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void insert(AdminDto adminDto) {
		String sql = "insert into admin(admin_id,"
				+ "admin_pw,"
				+ "admin_name,"
				+ "admin_nick,"
				+ "admin_grade) "
				+ "values(?,?,?,?,?)";
		Object[] param = {
				adminDto.getAdminId(),
				adminDto.getAdminPw(),
				adminDto.getAdminName(),
				adminDto.getAdminNick(),
				adminDto.getAdminGrade()
		};
		jdbcTemplate.update(sql, param);
	}

	@Override
	public boolean delete(String adminId) {
		String sql = "delete admin where admin_id=?";
		Object[] param = {adminId};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
}
