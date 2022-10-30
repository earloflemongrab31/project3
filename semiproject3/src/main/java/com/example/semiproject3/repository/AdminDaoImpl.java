package com.example.semiproject3.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.AdminDto;
import com.example.semiproject3.entity.CustomerDto;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void insert(AdminDto adminDto) {
		String sql = "insert into admin(admin_id,"
				+ "admin_pw,"
				+ "admin_name,"
				+ "admin_nick)"
				+ "values(?,?,?,?)";
		Object[] param = {
				adminDto.getAdminId(),
				adminDto.getAdminPw(),
				adminDto.getAdminName(),
				adminDto.getAdminNick(),
		};
		jdbcTemplate.update(sql, param);
	}

	@Override
	public boolean delete(String adminId) {
		String sql = "delete admin where admin_id=?";
		Object[] param = {adminId};
		return jdbcTemplate.update(sql, param) > 0;
	}

	 private RowMapper<AdminDto> mapper=new RowMapper<AdminDto>() {
	      
	      @Override
	      public AdminDto mapRow(ResultSet rs, int rowNum) throws SQLException {
	         return AdminDto.builder()
						.adminId(rs.getString("admin_id"))
						.adminPw(rs.getString("admin_pw"))
						.adminName(rs.getString("admin_name"))
						.adminNick(rs.getString("admin_nick"))
						.adminGrade(rs.getString("admin_grade"))
						.build();
	      }
	   }; 
	
	private ResultSetExtractor<AdminDto> extractor = (rs)->{
		if(rs.next()) {
			return AdminDto.builder()
					.adminId(rs.getString("admin_id"))
					.adminPw(rs.getString("admin_pw"))
					.adminName(rs.getString("admin_name"))
					.adminNick(rs.getString("admin_nick"))
					.adminGrade(rs.getString("admin_grade"))
					.build();
		}
		else {
			return null;
		}
	};
	
	@Override
	public AdminDto selectOne(String adminId) {
		String sql = "select * from admin where admin_id=?";
		Object[] param = {adminId};
		return jdbcTemplate.query(sql, extractor, param);
	}

	@Override
	public List<AdminDto> selectList() {
		String sql = "select * from admin order by admin_id asc";
		return jdbcTemplate.query(sql, mapper);
	}

	@Override
	public boolean update(AdminDto adminDto) {
		String sql = "update admin set admin_grade=? where admin_id=?";
		Object[]param = {adminDto.getAdminGrade(), adminDto.getAdminId()};
		return jdbcTemplate.update(sql,param)>0;
		}

	@Override
	public boolean update2(AdminDto adminDto) {
	String sql = "update admin set admin_grade = '일반관리자' where admin_id != ?";
	Object[]param = {adminDto.getAdminId()};
	return jdbcTemplate.update(sql, param) > 0;
	}
	
}
