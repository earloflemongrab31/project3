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

import com.example.semiproject3.entity.BuyDto;
import com.example.semiproject3.entity.CustomerDto;
import com.example.semiproject3.vo.CustomerJoinCountVO;
import com.example.semiproject3.vo.CustomerListSearchVO;
import com.example.semiproject3.vo.LikeCountVO;

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
			customerDto.setCustomerMoney(rs.getLong("customer_money"));
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
				customerDto.setCustomerMoney(rs.getLong("customer_money"));
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
	
	//?????? ??????
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
				+ "customer_email,"
				+ "customer_point,"
				+ "customer_money,"
				+ "customer_join"
				+ ") "
				+ "values(?,?,?,?,?,?,?,?,?,5000,?,to_date(sysdate, 'YYYY-MM-DD'))";
		Object[] param = {
				customerDto.getCustomerId(), customerDto.getCustomerPw(), customerDto.getCustomerPwsearch(),
				customerDto.getCustomerNick(), customerDto.getCustomerName(), customerDto.getCustomerPhone(),
				customerDto.getCustomerTel(), customerDto.getCustomerBirth(), customerDto.getCustomerEmail(),
				customerDto.getCustomerMoney()
				
		};
		jdbcTemplate.update(sql, param);
	}
	
	//?????? ??????
	@Override
	public List<CustomerDto> selectList() {
		String sql = "select * from customer order by customer_join asc";
		return jdbcTemplate.query(sql, mapper);
	}
	
	//?????? ??????
	@Override
	public List<CustomerDto> selectList(String type, String keyword) {
		String sql = "select * from customer where instr(#1, ?) > 0 order by #1 asc";
		sql = sql.replace("#1", type);
		Object[] param = {keyword};
		return jdbcTemplate.query(sql, mapper, param);
	}

	
	//?????? ??????
	@Override
	public CustomerDto selectOne(String customerId) {
		String sql = "select * from customer where customer_id=?";
		Object[] param = {customerId};
		return jdbcTemplate.query(sql, extractor, param);
	}
	
	//?????? ??????
	@Override
	public boolean update(CustomerDto customerDto) {
		String sql = "update customer "
						+ "set customer_point = customer_point + ?, customer_money = customer_money + ?, customer_grade = ? "
					+ "where customer_id = ?";
		Object[] param = {
				customerDto.getCustomerPoint(), customerDto.getCustomerMoney(),
				customerDto.getCustomerGrade(), customerDto.getCustomerId()
		};
		
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	//?????? ??????
	@Override
	public boolean delete(String customerId) {
		String sql = "delete customer where customer_id=?";
		Object[] param = {customerId};
		return jdbcTemplate.update(sql, param) > 0;
	}

	//????????? ????????? ????????? +5000 NL
	@Override
	public boolean updatePoint(String customerId) {
		String sql="update customer set customer_point=customer_point+5000 where customer_id=?";
		Object[] param= {customerId};
		return jdbcTemplate.update(sql,param)>0;
	}
	
	//????????? ????????? ????????????
		@Override
		public int overlapId(String customerId) {
			String sql="select count(*) from customer where customer_id=?";
			Object[] param= {customerId};
			return jdbcTemplate.queryForObject(sql, int.class, param);
		}
		
	//????????? ?????? ?????? 	
		@Override
		public boolean updateLoginTime(String customerId) {
			String sql = "update customer set customer_login=sysdate where customer_id=?";
			Object[] param = {customerId};
			return jdbcTemplate.update(sql, param) > 0;
		}
	
	//???????????? ?????? 
		@Override
		public boolean checkPassword(String customerId, String customerPwsearch) {
			String sql="select count(*) from customer where customer_id=? and customer_pwsearch=?";
			Object[] param= {
					customerId,
					customerPwsearch
			};
			return jdbcTemplate.queryForObject(sql,int.class,param)>0;
		}
		
	//???????????? ??????
		@Override
		public void changePassword(String customerPw, String customerId) {
			String sql="update customer set customer_pw=? where customer_id=?";
			Object[] param= {
					customerPw,
					customerId
			};
			jdbcTemplate.update(sql,param);
			
			
		}

	//????????? ??????
		@Override
		public CustomerDto findByNick(String customerNick) {
			String sql = "select * from customer where customer_nick=?";
			Object[] param = {customerNick};
			return jdbcTemplate.query(sql, extractor, param);
		}

	//???????????? ??????
		@Override
		public boolean changeInformation(CustomerDto customerDto) {
			String sql = "update customer set customer_nick=?, customer_phone=?, customer_email=? where customer_id=?";
			Object[] param = {
					customerDto.getCustomerNick(),
					customerDto.getCustomerPhone(),
					customerDto.getCustomerEmail(),
					customerDto.getCustomerId()
			};
			return jdbcTemplate.update(sql, param) > 0;
		}

		@Override
		public List<CustomerDto> selectAddressList(String addressNo, int begin, int end) {
				String sql = "select * from ("
						+ "select rownum rn, TMP.* from ("
							+ "select * from customer "
							+ "where address_no = ? "
							+ "order by customer_id desc"
						+ ")TMP"
					+ ") where rn between ? and ?";
		Object[] param = {addressNo, begin, end};
		return jdbcTemplate.query(sql, mapper, param);
		}

		//??????????????????
		@Override
		public List<CustomerDto> selectList(CustomerListSearchVO vo) {
			if(vo.isSearch()) {//???????????????
				return search(vo);
			}
			else {
				return list(vo);
			}
		}
		
		//?????????
		@Override
		public List<CustomerDto> list(CustomerListSearchVO vo) {
			String sql = "select * from ("
					+ "select rownum rn, TMP.* from("
						+ "select * from customer order by customer_id desc"
					+ ")TMP"
				+ ") where rn between ? and ?";
			Object[] param = {vo.startRow(), vo.endRow()};
			return jdbcTemplate.query(sql, mapper, param);
		}

		//??????
		@Override
		public List<CustomerDto> search(CustomerListSearchVO vo) {
			String sql = "select * from ("
					+ "select rownum rn, TMP.* from ("
						+ "select * from customer where instr(#1,?) > 0 "
						+ "order by customer_id desc"
					+ ")TMP"
				+ ") where rn between ? and ?";
			sql = sql.replace("#1", vo.getType());
			Object[] param = {
					vo.getKeyword(), vo.startRow(), vo.endRow()
			};
			return jdbcTemplate.query(sql, mapper, param);
		}


		
		@Override
		public int count(CustomerListSearchVO vo) {
			if(vo.isSearch()) { //???????????????
				return searchCount(vo);
			}
			else { //???????????????
				return listCount(vo);
			}
		}

		@Override
		public int searchCount(CustomerListSearchVO vo) {
			String sql = "select count(*) from customer where instr(#1, ?) > 0";
			sql = sql.replace("#1", vo.getType());
			Object[] param = {vo.getKeyword()};
			return jdbcTemplate.queryForObject(sql, int.class, param);
		}

		@Override
		public int listCount(CustomerListSearchVO vo) {
			String sql = "select count(*) from customer";
			return jdbcTemplate.queryForObject(sql, int.class);
		}

		@Override
		public boolean cash(BuyDto buyDto) {
			String sql = "update customer set customer_money = customer_money - ? where customer_id=?";
			Object[] param = {buyDto.getItemTotalPrice(), buyDto.getCustomerId()};
			return jdbcTemplate.update(sql, param) > 0;
		}
		
		private RowMapper<CustomerJoinCountVO> countMapper = new RowMapper<CustomerJoinCountVO>() {
			@Override
			public CustomerJoinCountVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				CustomerJoinCountVO vo = new CustomerJoinCountVO();
				vo.setCustomerJoin(rs.getDate("customer_join"));
				vo.setCnt(rs.getInt("cnt"));
				return vo;
			}
		};
		@Override
		public List<CustomerJoinCountVO> selectCountList() {
			String sql = "select customer_join, count(*) cnt from customer group by customer_join order by customer_join desc";
			return jdbcTemplate.query(sql, countMapper);
		}

		@Override
		public boolean usePoint(int customerPoint, String loginId) {
			String sql = "update customer set customer_point = customer_point - ? where customer_id=?";
			Object[] param = {customerPoint, loginId};
			return jdbcTemplate.update(sql, param) > 0;
		}
		
}