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

	

	//주문 번호 생생

	@Override
	public int sequence() {
		String sql = "select orders_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	//주문 등록
	@Override
	public void insert(OrdersDto ordersDto) {
		String sql = "insert into orders(orders_no, customer_id, cart_no, item_no, address_no, item_name, item_price, item_color, item_size, orders_cnt, orders_date, buy_fee, customer_phone) values(order_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?, ?)";
		Object[] param = {
				ordersDto.getOrdersNo(), ordersDto.getCustomerId(), ordersDto.getCartNo(),
				ordersDto.getItemNo(), ordersDto.getAddressNo(), ordersDto.getItemName(),
				ordersDto.getItemPrice(), ordersDto.getItemColor(), ordersDto.getItemSize(),
				ordersDto.getOrdersCnt(), ordersDto.getOrdersDate(), ordersDto.getBuyFee(),
				ordersDto.getCustomerPhone()
				
		};
		jdbcTemplate.update(sql, param);
	}

	//로우 매퍼
	private RowMapper <OrdersDto> mapper = new RowMapper<OrdersDto>() {

		@Override
		public OrdersDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			OrdersDto ordersDto = new OrdersDto();
			ordersDto.setOrdersNo(rs.getInt("orders_no"));
			ordersDto.setCustomerId(rs.getString("customer_id"));
			ordersDto.setCartNo(rs.getInt("cart_no"));
			ordersDto.setItemNo(rs.getInt("item_no"));
			ordersDto.setAddressNo(rs.getInt("address_no"));
			ordersDto.setItemName(rs.getString("item_name"));
			ordersDto.setItemPrice(rs.getInt("item_price"));
			ordersDto.setItemColor(rs.getString("item_color"));
			ordersDto.setItemSize(rs.getString("item_size"));
			ordersDto.setOrdersCnt(rs.getInt("orders_cnt"));
			ordersDto.setOrdersDate(rs.getDate("orders_date"));
			ordersDto.setBuyFee(rs.getInt("buy_fee"));
			ordersDto.setCustomerPhone(rs.getString("customer_phone"));
			return ordersDto;
		}
	};
	
	//리절트셋
	private ResultSetExtractor<OrdersDto> extractor = new ResultSetExtractor<OrdersDto>() {

		@Override
		public OrdersDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				OrdersDto ordersDto = new OrdersDto();
				ordersDto.setOrdersNo(rs.getInt("orders_no"));
				ordersDto.setCustomerId(rs.getString("customer_id"));
				ordersDto.setCartNo(rs.getInt("cart_no"));
				ordersDto.setItemNo(rs.getInt("item_no"));
				ordersDto.setAddressNo(rs.getInt("address_no"));
				ordersDto.setItemName(rs.getString("item_name"));
				ordersDto.setItemPrice(rs.getInt("item_price"));
				ordersDto.setItemColor(rs.getString("item_color"));
				ordersDto.setItemSize(rs.getString("item_size"));
				ordersDto.setOrdersCnt(rs.getInt("orders_cnt"));
				ordersDto.setOrdersDate(rs.getDate("orders_date"));
				ordersDto.setBuyFee(rs.getInt("buy_fee"));
				ordersDto.setCustomerPhone(rs.getString("customer_phone"));
				return ordersDto;
			}
			else {
				return null;
			}
		}
	};
	

	@Override
	public List<OrdersDto> selectList(String type, String keyword) {
		String sql = "select * from orders where instr(#1, ?) > 0 order by orders_no desc";
		sql = sql.replace("#1", type);
		Object[] param = {keyword};
		return jdbcTemplate.query(sql, mapper, param);
	}

	@Override
	public OrdersDto selectOne(int ordersNo) {
		String sql = "select * from orders where orders_no=?";
		Object[] param = {ordersNo};
		return jdbcTemplate.query(sql, extractor, param);
	}

	@Override
	public boolean update(OrdersDto ordersDto) {
		String sql = "update orders set item_color=?, item_size=?, orders_cnt=?, customer_phone=? where orders_no=?";
		Object[] param = {
				ordersDto.getItemColor(), ordersDto.getItemSize(),
				ordersDto.getOrdersCnt(), ordersDto.getCustomerPhone(),
				ordersDto.getOrdersNo()
		};
		return jdbcTemplate.update(sql, param) > 0; //색상, 크기, 주문수량, 휴대폰 번호 변경
	}

	@Override
	public boolean delete(int ordersNo) {
		String sql = "delete orders where orders_no=?";
		Object[] param = {ordersNo};
		return jdbcTemplate.update(sql, param) > 0;
	}

	@Override
	public List<OrdersDto> selectList() {
		String sql = "select * from orders order by orders_no desc";
		return jdbcTemplate.query(sql, mapper);
	}
}
