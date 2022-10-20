package com.example.semiproject3.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.CustomerLikeDto;

@Repository
public class CustomerLikeDaoimpl implements CustomerLikeDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
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

	//찜 갱신
	@Override
	public void refresh(int itemNo) {
		String sql = "update item set item_like_cnt = ("
				+ "select count(*) from customer_like "
				+ "where item_no = ?)"
				+ " where item_no = ?";
		Object[] param = {itemNo, itemNo};
		jdbcTemplate.update(sql, param);
	}
}
