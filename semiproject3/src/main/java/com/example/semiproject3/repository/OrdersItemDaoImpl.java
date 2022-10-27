package com.example.semiproject3.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.OrdersItemDto;

@Repository
public class OrdersItemDaoImpl implements OrdersItemDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void insert(OrdersItemDto ordersItemDto) {
		String sql= "insert into orders_item("
						+ "customer_id,"
						+ "item_no,"
						+ "item_name,"
						+ "item_size,"
						+ "item_color,"
						+ "item_cnt,"
						+ "item_price) values(?,?,?,?,?,?,?)";
		Object[] param = {
						ordersItemDto.getCustomerId(),
						ordersItemDto.getItemNo(),
						ordersItemDto.getItemName(),
						ordersItemDto.getItemSize(),
						ordersItemDto.getItemColor(),
						ordersItemDto.getItemCnt(),
						ordersItemDto.getItemPrice()
		};
		jdbcTemplate.update(sql, param);
	}

	private RowMapper<OrdersItemDto> mapper = (rs, idx)->{
		return OrdersItemDto.builder()
						.customerId(rs.getString("customer_id"))
						.itemNo(rs.getInt("item_no"))
						.itemName(rs.getString("item_name"))
						.itemSize(rs.getString("item_size"))
						.itemColor(rs.getString("item_color"))
						.itemCnt(rs.getInt("item_cnt"))
						.itemPrice(rs.getInt("item_price"))
				.build();
	};
	
	@Override
	public List<OrdersItemDto> selectOrdersItemList(String customerId) {
		String sql = "select * from orders_item where customer_id=?";

		return jdbcTemplate.query(sql, mapper, customerId);
	}

	@Override
	public boolean delete(String loginId) {
		String sql = "delete orders_item where customer_id=?";
		return jdbcTemplate.update(sql, loginId) > 0;
	}
	
	
}
