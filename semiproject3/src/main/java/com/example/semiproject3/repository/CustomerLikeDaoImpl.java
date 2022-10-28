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

import com.example.semiproject3.entity.CustomerLikeDto;
import com.example.semiproject3.vo.CustomerListSearchVO;

@Repository
public class CustomerLikeDaoImpl implements CustomerLikeDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	private RowMapper <CustomerLikeDto> mapper = new RowMapper<CustomerLikeDto>() {

		@Override
		public CustomerLikeDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			CustomerLikeDto customerLikeDto = new CustomerLikeDto();
			customerLikeDto.setCustomerId(rs.getString("customer_id"));
			customerLikeDto.setItemNo(rs.getInt("item_no"));
			customerLikeDto.setLikeTime(rs.getDate("like_time"));
			return customerLikeDto;
		}
	};
	
	private ResultSetExtractor <CustomerLikeDto> extractor = new ResultSetExtractor<CustomerLikeDto>() {

		@Override
		public CustomerLikeDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				CustomerLikeDto customerLikeDto = new CustomerLikeDto();
				customerLikeDto.setCustomerId(rs.getString("customer_id"));
				customerLikeDto.setItemNo(rs.getInt("item_no"));
				customerLikeDto.setLikeTime(rs.getDate("like_time"));
				return customerLikeDto;
			}
			else {
				return null;	
			}
		}
	};
	
	//찜 등록
	@Override
	public void insert(CustomerLikeDto customerLikeDto) {
		String sql = "insert into customer_like(customer_id, item_no) values(?,?)";
		Object[] param = {customerLikeDto.getCustomerId(), customerLikeDto.getItemNo()};
		jdbcTemplate.update(sql, param);
	}
	
	//찜 삭제
	@Override
	public void delete(CustomerLikeDto customerLikeDto) {
		String sql = "delete customer_like where customer_id = ? and item_no = ?";
		Object[] param = {customerLikeDto.getCustomerId(), customerLikeDto.getItemNo()};
		jdbcTemplate.update(sql, param);
	}
	
	//찜 기록
	@Override
	public boolean check(CustomerLikeDto customerLikeDto) {
		String sql = "select count(*) from customer_like where customer_id = ? and item_no = ?";
		Object[] param = {customerLikeDto.getCustomerId(), customerLikeDto.getItemNo()};
		int count = jdbcTemplate.queryForObject(sql, int.class, param);
		return count == 1; //좋아요 상태면 1 아니면 0
	}
	
	//찜 개수
	@Override
	public int count(int itemNo) {
		String sql = "select count(*) from customer_like where item_no = ?";
		Object[] param = {itemNo};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}
	
	@Override
	public int likeCount(String loginId) {
		String sql = "select count(*) from customer_like where customer_id = ?";
		Object[] param = {loginId};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}

	//찜 갱신
	@Override
	public void refresh(int itemNo) {
		String sql = "update item set item_like_cnt = ("
				+ "select count(*) from customer_like "
				+ "where item_no = ?) "
				+ "where item_no = ?";
		Object[] param = {itemNo, itemNo};
		jdbcTemplate.update(sql, param);
	}
	
	@Override
	public void likeRefresh(String loginId) {
		String sql = "update customer set customer_like = ("
				+ "select count(*) from customer_like "
				+ "where customer_id = ?) "
				+ "where customer_id = ?";
		Object[] param = {loginId, loginId};
		jdbcTemplate.update(sql, param);
		
	}

	   @Override
	   public List<CustomerLikeDto>selectList(String loginId) {
	      String sql = "select * from customer_like where customer_id=?";
	      Object[] param = {loginId};
		return jdbcTemplate.query(sql, mapper, param);
	   }

	   
	 //페이징처리
	@Override
	public List<CustomerLikeDto> selectList(CustomerListSearchVO vo) {
		if(vo.isSearch()) {
			return search(vo);
		}
		else {
			return list(vo);
	}
}
	@Override
	public List<CustomerLikeDto> list(CustomerListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from("
					+ "select * from customer_like order by customer_id desc"
				+ ")TMP"
			+ ") where rn between ? and ?";
		Object[] param = {vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, mapper, param);
	}

	@Override
	public List<CustomerLikeDto> search(CustomerListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select * from customer_like where instr(#1,?) > 0 "
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
		if(vo.isSearch()) {
			return searchCount(vo);
		}
		else {
			return listCount(vo);
		}
	}

	@Override
	public int searchCount(CustomerListSearchVO vo) {
		String sql = "select count(*) from customer_like where instr(#1, ?) > 0";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {vo.getKeyword()};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}

	@Override
	public int listCount(CustomerListSearchVO vo) {
		String sql = "select count(*) from customer_like";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
}


