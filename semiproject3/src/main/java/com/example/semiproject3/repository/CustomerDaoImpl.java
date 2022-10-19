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

import com.example.semiproject3.entity.CustomerDto;

@Repository
public class CustomerDaoImpl implements CustomerDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void insert(CustomerDto dto) {
		String sql = "insert into customer("
				+ "customer_id,"
				+ "customer_pw,"
				+ "customer_pwsearch,"
				+ "customer_nick,"
				+ "customer_name,"
				+ "customer_phone,"
				+ "customer_tel,"
				+ "customer_birth,"
				+ "customer_email,"
				+ ")"
				+ "values(?,?,?,?,?,?,?,?,?)";
		Object[] param = {
				dto.getCustomerId(), dto.getCustomerPw(), dto.getCustomerPwsearch(),
				dto.getCustomerNick(), dto.getCustomerName(), dto.getCustomerPhone(),
				dto.getCustomerTel(), dto.getCustomerBirth(), dto.getCustomerEmail()
		};
		jdbcTemplate.update(sql, param);
	}
	
	private RowMapper<CustomerDto> mapper = new RowMapper<CustomerDto>() {

		@Override
		public CustomerDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			CustomerDto dto = new CustomerDto();
			dto.setCustomerId(rs.getString("customer_id"));
			dto.setCustomerPw(rs.getString("customer_pw"));
			dto.setCustomerPwsearch(rs.getString("customer_pwsearch"));
			dto.setCustomerNick(rs.getString("customer_nick"));
			dto.setCustomerName(rs.getString("customer_name"));
			dto.setCustomerPhone(rs.getString("customer_phone"));
			dto.setCustomerTel(rs.getString("customer_tel"));
			dto.setCustomerBirth(rs.getDate("customer_birth"));
			dto.setCustomerEmail(rs.getString("customer_email"));
			dto.setCustomerPoint(rs.getInt("customer_point"));
			dto.setCustomerMoney(rs.getInt("customer_money"));
			dto.setCustomerGrade(rs.getString("customer_grade"));
			dto.setCustomerJoin(rs.getDate("customer_join"));
			dto.setCustomerLogin(rs.getDate("customer_login"));
			dto.setCartTotalCnt(rs.getInt("cart_total_cnt"));
			dto.setCartTotalMoney(rs.getInt("cart_total_money"));
			dto.setCustomerLike(rs.getInt("customer_like"));
			return dto;
		}
	};
	
	
	
	@Override
	public List<CustomerDto> selectList(String type, String keyword) {
		String sql = "select from customer where instr(#1, ?)>0 order by #1 asc";
		sql = sql.replace("#1", type);
		Object[] param = {keyword};
		return jdbcTemplate.query(sql, mapper, param);
	}

	private ResultSetExtractor <CustomerDto> extractor = new ResultSetExtractor<CustomerDto>() {

		@Override
		public CustomerDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				CustomerDto dto = new CustomerDto();
				dto.setCustomerId(rs.getString("customer_id"));
				dto.setCustomerPw(rs.getString("customer_pw"));
				dto.setCustomerPwsearch(rs.getString("customer_pwsearch"));
				dto.setCustomerNick(rs.getString("customer_nick"));
				dto.setCustomerName(rs.getString("customer_name"));
				dto.setCustomerPhone(rs.getString("customer_phone"));
				dto.setCustomerTel(rs.getString("customer_tel"));
				dto.setCustomerBirth(rs.getDate("customer_birth"));
				dto.setCustomerEmail(rs.getString("customer_email"));
				dto.setCustomerPoint(rs.getInt("customer_point"));
				dto.setCustomerMoney(rs.getInt("customer_money"));
				dto.setCustomerGrade(rs.getString("customer_grade"));
				dto.setCustomerJoin(rs.getDate("customer_join"));
				dto.setCustomerLogin(rs.getDate("customer_login"));
				dto.setCartTotalCnt(rs.getInt("cart_total_cnt"));
				dto.setCartTotalMoney(rs.getInt("cart_total_money"));
				dto.setCustomerLike(rs.getInt("customer_like"));
				return dto;
			}
			else {
				return null;
			}
		}
	};
	
	@Override
	public CustomerDto selectOne(String customerId) {
		String sql = "select * from customer where customer_id=?";
		Object[] param = {customerId};
		return jdbcTemplate.query(sql, extractor, param);
	}

	@Override
	public boolean update(CustomerDto dto) {
		String sql = "update customer set "
				+ "customer_nick=?,"
				+ "customer_name=?,"
				+ "customer_phone=?, "
				+ "customer_email=?"
				+ "where "
				+ "customer_id";
		Object[] param = {
				dto.getCustomerNick(), dto.getCustomerName(),
				dto.getCustomerPhone(),dto.getCustomerEmail(),
				dto.getCustomerId()
		};
		
		return jdbcTemplate.update(sql, param) > 0;
	}

	@Override
	public boolean delete(String customerId) {
		String sql = "delete customer where customer_id=?";
		Object[] param = {customerId};
		return jdbcTemplate.update(sql, param) > 0;
	}

	@Override
	public List<CustomerDto> selectList() {
		String sql = "select * from customer";
		return jdbcTemplate.query(sql, mapper);
	}

	
}