package com.example.semiproject3.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
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
		String sql = "insert into order(order_no, customer_id, cart_no, item_no, address_no, item_name, item_price, item_color, order_cnt, order_date, buy_fee, customer_phone) values(order_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?, ?)";
		Object[] param = {
				orderDto.getOrderNo(), orderDto.getCustomerId(), orderDto.getCartNo(),
				orderDto.getItemNo(), orderDto.getAddressNo(), orderDto.getItemName(),
				orderDto.getItemPrice(), orderDto.getItemColor(), orderDto.getOrderCnt(),
				orderDto.getOrderDate(), orderDto.getBuyFee(), orderDto.getCustomerPhone()
		};
		jdbcTemplate.update(sql, param);
	}

	//로우 매퍼
//	private RowMapper <OrderDto> 
//	
//	@Override
//	public List<OrderDto> selectList() {
//		String sql = "select * from order order by order_no desc";
//		return jdbcTemplate.query(sql, mapper);
//	}

	@Override
	public List<OrderDto> selectList(String type, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OrderDto selectOne(int orderNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(OrderDto orderDto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int orderNo) {
		// TODO Auto-generated method stub
		return false;
	}
}
