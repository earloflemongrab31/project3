package com.example.semiproject3.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
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
	
	@Override
	public void insert(OrdersDto ordersDto) {
		String sql = "insert into orders values(orders_seq.nextval,?,?,?,?,?,?,?,0,sysdate,3000,?)";
		Object[] param = {
				ordersDto.getCustomerId(),
				ordersDto.getItemNo(),
				ordersDto.getAddressNo(),
				ordersDto.getItemName(),
				ordersDto.getItemPrice(),
				ordersDto.getItemColor(),
				ordersDto.getItemSize(),
				ordersDto.getCustomerPhone()
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
	public List<OrdersDto> selectList(String loginId) {
		String sql = "select * from orders where customer_id=?";
		Object[] param = {loginId};
		return jdbcTemplate.query(sql, mapper, param);
	}

	@Override
	public int selectOrders(String loginId) {
		String sql = "select count(*) from orders where customer_id=?";
		Object[] param = {loginId};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}
	
	
	//번호를 미리 생성한 뒤 등록하는 기능
	@Override
	public int insert2(OrdersDto ordersDto) {
		String sql = "select orders_seq.nextval from dual";
		int itemNo = jdbcTemplate.queryForObject(sql, int.class);
		
		sql = "insert into orders(orders_no, item_no, item_name, item_color, item_size, orders_cnt, customer_phone) values(?,?,?,?,?,?,?)";
		Object[] param = {
				ordersDto.getOrdersNo(),
				itemNo,
				ordersDto.getItemName(),
				ordersDto.getItemColor(),
				ordersDto.getItemSize(),
				ordersDto.getOrdersCnt(),
				ordersDto.getCustomerPhone()
				
		};
		jdbcTemplate.update(sql, param);
		return itemNo;
		
	}

	@Override
	public int sequnece() {
		String sql = "select ordres_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
}