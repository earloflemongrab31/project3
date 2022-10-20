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
	
	//RowMapper
	private RowMapper<CustomerDto> mapper = new RowMapper<CustomerDto>() {

		@Override
		public CustomerDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			CustomerDto customerDto = new CustomerDto();
			customerDto.setCustomerId(rs.getString("customer_id"));
			customerDto.setCustomerPw(rs.getString("customer_pw"));
			customerDto.setCustomerPwsearch(rs.getString("customer_pwsearch"));
			customerDto.setCustomerNick(rs.getString("customer_nick"));
			customerDto.setCustomerName(rs.getString("customer_name"));
			customerDto.setCustomerPhone(rs.getString("customer_phone"));
			customerDto.setCustomerTel(rs.getString("customer_tel"));
			customerDto.setCustomerBirth(rs.getDate("customer_birth"));
			customerDto.setCustomerEmail(rs.getString("customer_email"));
			customerDto.setCustomerPoint(rs.getInt("customer_point"));
			customerDto.setCustomerMoney(rs.getInt("customer_money"));
			customerDto.setCustomerGrade(rs.getString("customer_grade"));
			customerDto.setCustomerJoin(rs.getDate("customer_join"));
			customerDto.setCustomerLogin(rs.getDate("customer_login"));
			customerDto.setCartTotalCnt(rs.getInt("cart_total_cnt"));
			customerDto.setCartTotalMoney(rs.getInt("cart_total_money"));
			customerDto.setCustomerLike(rs.getInt("customer_like"));
			return customerDto;
		}
	};
	
	//ResultSetExtractor
	private ResultSetExtractor <CustomerDto> extractor = new ResultSetExtractor<CustomerDto>() {

		@Override
		public CustomerDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				CustomerDto customerDto = new CustomerDto();
				customerDto.setCustomerId(rs.getString("customer_id"));
				customerDto.setCustomerPw(rs.getString("customer_pw"));
				customerDto.setCustomerPwsearch(rs.getString("customer_pwsearch"));
				customerDto.setCustomerNick(rs.getString("customer_nick"));
				customerDto.setCustomerName(rs.getString("customer_name"));
				customerDto.setCustomerPhone(rs.getString("customer_phone"));
				customerDto.setCustomerTel(rs.getString("customer_tel"));
				customerDto.setCustomerBirth(rs.getDate("customer_birth"));
				customerDto.setCustomerEmail(rs.getString("customer_email"));
				customerDto.setCustomerPoint(rs.getInt("customer_point"));
				customerDto.setCustomerMoney(rs.getInt("customer_money"));
				customerDto.setCustomerGrade(rs.getString("customer_grade"));
				customerDto.setCustomerJoin(rs.getDate("customer_join"));
				customerDto.setCustomerLogin(rs.getDate("customer_login"));
				customerDto.setCartTotalCnt(rs.getInt("cart_total_cnt"));
				customerDto.setCartTotalMoney(rs.getInt("cart_total_money"));
				customerDto.setCustomerLike(rs.getInt("customer_like"));
				return customerDto;
			}
			else {
				return null;
			}
		}
	};
	
	//회원 등록
	@Override
	public void insert(CustomerDto customerDto) {
		String sql = "insert into customer("
				+ "customer_id,"
				+ "customer_pw,"
				+ "customer_pwsearch,"
				+ "customer_nick,"
				+ "customer_name,"
				+ "customer_phone,"
				+ "customer_tel,"
				+ "customer_birth,"
				+ "customer_email"
				+ ") "
				+ "values(?,?,?,?,?,?,?,?,?)";
		Object[] param = {
				customerDto.getCustomerId(), customerDto.getCustomerPw(), customerDto.getCustomerPwsearch(),
				customerDto.getCustomerNick(), customerDto.getCustomerName(), customerDto.getCustomerPhone(),
				customerDto.getCustomerTel(), customerDto.getCustomerBirth(), customerDto.getCustomerEmail()
		};
		jdbcTemplate.update(sql, param);
	}
	
	//회원 목록
	@Override
	public List<CustomerDto> selectList() {
		String sql = "select * from customer order by customer_id asc";
		return jdbcTemplate.query(sql, mapper);
	}
	
	//회원 검색
	@Override
	public List<CustomerDto> selectList(String type, String keyword) {
		String sql = "select * from customer where instr(#1, ?) > 0 order by #1 asc";
		sql = sql.replace("#1", type);
		Object[] param = {keyword};
		return jdbcTemplate.query(sql, mapper, param);
	}

	
	//회원 정보
	@Override
	public CustomerDto selectOne(String customerId) {
		String sql = "select * from customer where customer_id=?";
		Object[] param = {customerId};
		return jdbcTemplate.query(sql, extractor, param);
	}
	
	//회원 수정
	@Override
	public boolean update(CustomerDto customerDto) {
		String sql = "update customer set "
				+ "customer_nick=?,"
				+ "customer_name=?,"
				+ "customer_phone=?, "
				+ "customer_email=?"
				+ "where "
				+ "customer_id = ?";
		Object[] param = {
				customerDto.getCustomerNick(), customerDto.getCustomerName(),
				customerDto.getCustomerPhone(), customerDto.getCustomerEmail(),
				customerDto.getCustomerId()
		};
		
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	//회원 삭제
	@Override
	public boolean delete(String customerId) {
		String sql = "delete customer where customer_id=?";
		Object[] param = {customerId};
		return jdbcTemplate.update(sql, param) > 0;
	}

	//리서치 완료시 포인트 +5000 NL
	@Override
	public boolean updatePoint(String customerId) {
		String sql="update customer set customer_point=customer_point+5000 where customer_id=?";
		Object[] param= {customerId};
		return jdbcTemplate.update(sql,param)>0;
	}
	
	//리서치 아이디 중복방지
		@Override
		public int overlapId(String customerId) {
			String sql="select count(*) from customer where customer_id=?";
			Object[] param= {customerId};
			return jdbcTemplate.queryForObject(sql, int.class, param);
		}
		
	//로그인 시간 갱신 	
		@Override
		public boolean updateLoginTime(String customerId) {
			String sql = "update customer set customer_login=sysdate where customer_id=?";
			Object[] param = {customerId};
			return jdbcTemplate.update(sql, param) > 0;
		}

}