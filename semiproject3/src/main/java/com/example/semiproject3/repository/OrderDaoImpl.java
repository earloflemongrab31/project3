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

import com.example.semiproject3.entity.OrderDto;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	@Override
	public int sequence() {
		String sql = "select order_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	@Override
	public void insert(OrderDto orderDto) {
		String sql = "insert into order(order_no, customer_id, cart_no, item_no, address_no, item_name, item_price, item_color, item_size, order_cnt, order_date, buy_fee, customer_phone) values(order_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?, ?)";
		Object[] param = {
				orderDto.getOrderNo(), orderDto.getCustomerId(), orderDto.getCartNo(),
				orderDto.getItemNo(), orderDto.getAddressNo(), orderDto.getItemName(),
				orderDto.getItemPrice(), orderDto.getItemColor(), orderDto.getItemSize(),
				orderDto.getOrderCnt(), orderDto.getOrderDate(), orderDto.getBuyFee(),
				orderDto.getCustomerPhone()
				
		};
		jdbcTemplate.update(sql, param);
	}

	//로우 매퍼
	private RowMapper <OrderDto> mapper = new RowMapper<OrderDto>() {

		@Override
		public OrderDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			OrderDto orderDto = new OrderDto();
			orderDto.setOrderNo(rs.getInt("order_no"));
			orderDto.setCustomerId(rs.getString("customer_id"));
			orderDto.setCartNo(rs.getInt("cart_no"));
			orderDto.setItemNo(rs.getInt("item_no"));
			orderDto.setAddressNo(rs.getInt("address_no"));
			orderDto.setItemName(rs.getString("item_name"));
			orderDto.setItemPrice(rs.getInt("item_price"));
			orderDto.setItemColor(rs.getString("item_color"));
			orderDto.setItemSize(rs.getString("item_size"));
			orderDto.setOrderCnt(rs.getInt("order_cnt"));
			orderDto.setOrderDate(rs.getDate("order_date"));
			orderDto.setBuyFee(rs.getInt("buy_fee"));
			orderDto.setCustomerPhone(rs.getString("customer_phone"));
			return orderDto;
		}
	};
	
	//리절트셋
	private ResultSetExtractor<OrderDto> extractor = new ResultSetExtractor<OrderDto>() {

		@Override
		public OrderDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				OrderDto orderDto = new OrderDto();
				orderDto.setOrderNo(rs.getInt("order_no"));
				orderDto.setCustomerId(rs.getString("customer_id"));
				orderDto.setCartNo(rs.getInt("cart_no"));
				orderDto.setItemNo(rs.getInt("item_no"));
				orderDto.setAddressNo(rs.getInt("address_no"));
				orderDto.setItemName(rs.getString("item_name"));
				orderDto.setItemPrice(rs.getInt("item_price"));
				orderDto.setItemColor(rs.getString("item_color"));
				orderDto.setItemSize(rs.getString("item_size"));
				orderDto.setOrderCnt(rs.getInt("order_cnt"));
				orderDto.setOrderDate(rs.getDate("order_date"));
				orderDto.setBuyFee(rs.getInt("buy_fee"));
				orderDto.setCustomerPhone(rs.getString("customer_phone"));
				return orderDto;
			}
			else {
				return null;
			}
		}
	};
	
	@Override
	public List<OrderDto> selectList(String loginId) {
		String sql="select * from order where customer_id=?";
		Object[] param= {loginId};
		return jdbcTemplate.query(sql,mapper,param);
	}
	
	@Override
	public OrderDto selectOne(String loginId) {
		String sql = "select * from order where customer_id=?";
		Object[] param = {loginId};
		return jdbcTemplate.query(sql, extractor, param);
	}

	@Override
	public boolean update(OrderDto orderDto) {
		String sql = "update order set item_color=?, item_size=?, order_cnt=?, customer_phone=? where order_no=?";
		Object[] param = {
				orderDto.getItemColor(), orderDto.getItemSize(),
				orderDto.getOrderCnt(), orderDto.getCustomerPhone(),
				orderDto.getOrderNo()
		};
		return jdbcTemplate.update(sql, param) > 0; //색상, 크기, 주문수량, 휴대폰 번호 변경
	}

	@Override
	public boolean delete(int orderNo) {
		String sql = "delete order where order_no=?";
		Object[] param = {orderNo};
		return jdbcTemplate.update(sql, param) > 0;
	}
}
