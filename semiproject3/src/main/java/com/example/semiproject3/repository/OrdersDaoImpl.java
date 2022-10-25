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

import com.example.semiproject3.entity.OrdersDto;

@Repository
public class OrdersDaoImpl implements OrdersDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//로우맵퍼
	private RowMapper<OrdersDto> mapper = new RowMapper<OrdersDto>() {

		@Override
		public OrdersDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			OrdersDto ordersDto = new OrdersDto();
			ordersDto.setOrdersNo(rs.getInt("orders_no"));
			ordersDto.setCustomerId(rs.getString("customer_id"));
			ordersDto.setItemNo(rs.getInt("item_no"));
			ordersDto.setAddressNo(rs.getInt("address_no"));
			ordersDto.setAddressName(rs.getString("customer_name"));
			ordersDto.setCustomerNick(rs.getString("customer_nick"));
			ordersDto.setCustomerPhone(rs.getString("customer_phone"));
			ordersDto.setCustomerPoint(rs.getInt("customer_point"));
			ordersDto.setItemName(rs.getString("item_name"));
			ordersDto.setItemColor(rs.getString("item_color"));
			ordersDto.setItemSize(rs.getString("item_size"));
			ordersDto.setItemCnt(rs.getInt("item_cnt"));
			ordersDto.setItemFee(rs.getInt("item_fee"));
			ordersDto.setAddressName(rs.getString("address_name"));
			ordersDto.setCustomerPost(rs.getString("customer_post"));
			ordersDto.setCustomerHost(rs.getString("customer_host"));
			ordersDto.setCustomerDetailHost(rs.getString("customer_detail_host"));
			ordersDto.setCustomerMoney(rs.getInt("customer_money"));
			return ordersDto;
		}
	};
	
	private ResultSetExtractor<OrdersDto> extractor = new ResultSetExtractor<OrdersDto>() {

		@Override
		public OrdersDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				OrdersDto ordersDto = new OrdersDto();
				ordersDto.setOrdersNo(rs.getInt("orders_no"));
				ordersDto.setCustomerId(rs.getString("customer_id"));
				ordersDto.setItemNo(rs.getInt("item_no"));
				ordersDto.setAddressNo(rs.getInt("address_no"));
				ordersDto.setAddressName(rs.getString("customer_name"));
				ordersDto.setCustomerNick(rs.getString("customer_nick"));
				ordersDto.setCustomerPhone(rs.getString("customer_phone"));
				ordersDto.setCustomerPoint(rs.getInt("customer_point"));
				ordersDto.setItemName(rs.getString("item_name"));
				ordersDto.setItemColor(rs.getString("item_color"));
				ordersDto.setItemSize(rs.getString("item_size"));
				ordersDto.setItemCnt(rs.getInt("item_cnt"));
				ordersDto.setItemFee(rs.getInt("item_fee"));
				ordersDto.setAddressName(rs.getString("address_name"));
				ordersDto.setCustomerPost(rs.getString("customer_post"));
				ordersDto.setCustomerHost(rs.getString("customer_host"));
				ordersDto.setCustomerDetailHost(rs.getString("customer_detail_host"));
				ordersDto.setCustomerMoney(rs.getInt("customer_money"));
				return ordersDto;	
			}
			else {
				return null;	
			}
			
		}
	};
	
	@Override
	public void insert(OrdersDto ordersDto) {
		String sql = "insert into orders values(orders_seq.nextval, ?, ?, ?, ?, ?, ?, 0, ?, ?, ?, 0, 3000, ?, ?, ?, ?, 0)";
		Object[] param = {
				ordersDto.getCustomerId(), ordersDto.getItemNo(), ordersDto.getAddressNo(),
				ordersDto.getCustomerName(), ordersDto.getCustomerNick(),ordersDto.getCustomerPhone(), 
				ordersDto.getItemName(), ordersDto.getItemColor(), ordersDto.getItemSize(),
				ordersDto.getAddressName(), ordersDto.getCustomerPost(),
				ordersDto.getCustomerHost(), ordersDto.getCustomerDetailHost()
		};
		jdbcTemplate.update(sql, param);
	}

	@Override
	public void delete(OrdersDto ordersDto) {
		String sql = "delete orders where item_no=? and customer_id=?";
		Object[] param = {
				ordersDto.getItemNo(),
				ordersDto.getCustomerId()
		};
		jdbcTemplate.update(sql,param);
	}

	@Override
	public boolean check(OrdersDto ordersDto) {
		String sql = "select count(*) from orders where customer_id=? and item_no=?";
		Object[] param = {
				ordersDto.getCustomerId(),
				ordersDto.getItemNo()
		};
		int count = jdbcTemplate.queryForObject(sql, int.class, param);
		return count == 1;
	}

	@Override
	public int selectOrders(String customerId) {
		String sql = "select count(*) from orders where customer_id=?";
		Object[] param = {customerId};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}

	public int sequnece() {
		String sql = "select orders_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	@Override
	public List<OrdersDto> selectList() {
		String sql = "select * from orders order by orders_no asc";
		return jdbcTemplate.query(sql, mapper);
	}

	@Override
	public List<OrdersDto> selectList(String type, String keyword) {
		String sql = "select * from orders where instr(#1, ?) > 0 order by #1 asc";
		sql = sql.replace("#1", type);
		Object[] param = {keyword};
		return jdbcTemplate.query(sql, mapper, param);
	}

	@Override
	public List<OrdersDto> selectList(String customerId) {
		String sql = "select * from orders where customer_id=?";
		Object[] param = {customerId};
		return jdbcTemplate.query(sql, mapper, param);
	}

}