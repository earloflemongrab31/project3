package com.example.semiproject3.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.CartDto;

@Repository
public class CartDaoImpl implements CartDao{
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	//RowMapper
	private RowMapper<CartDto> mapper = (rs, idx) -> {
		return CartDto.builder()
							.cartNo(rs.getInt("cart_no"))
							.customerId(rs.getString("customer_id"))
							.itemNo(rs.getInt("item_no"))
							.itemName(rs.getString("item_name"))
							.itemColor(rs.getString("item_color"))
							.itemSize(rs.getString("item_size"))
							.itemCnt(rs.getInt("item_cnt"))
							.cartDate(rs.getDate("cart_date"))
							.itemPrice(rs.getInt("item_price"))
							.deliveryFee(rs.getInt("delivery_fee"))
							.cartPrice(rs.getInt("cart_price"))
				.build();
	};
	
	//re
	private ResultSetExtractor<CartDto> extractor = (rs) -> {
		if(rs.next()) {
			return CartDto.builder()
							.cartNo(rs.getInt("cart_no"))
							.customerId(rs.getString("customer_id"))
							.itemNo(rs.getInt("item_no"))
							.itemName(rs.getString("item_name"))
							.itemColor(rs.getString("item_color"))
							.itemSize(rs.getString("item_size"))
							.itemCnt(rs.getInt("item_cnt"))
							.cartDate(rs.getDate("cart_date"))
							.itemPrice(rs.getInt("item_price"))
							.deliveryFee(rs.getInt("delivery_fee"))
							.cartPrice(rs.getInt("cart_price"))
				.build();
		}
		else {
			return null;
		}
	};
	
	//카트 담기
	@Override
	public void insert(CartDto cartDto) {
		String sql="insert into cart("
				+ "cart_no, "
				+ "customer_id, "
				+ "item_no, "
				+ "item_name, "
				+ "item_color, "
				+ "item_size, "
				+ "item_cnt, "
				+ "item_price, "
				+ "cart_price) "
				+ "values(cart_seq.nextval,?,?,?,?,?,?,?,?)";
		Object[] param= {
				cartDto.getCustomerId(), cartDto.getItemNo(),
				cartDto.getItemName(), cartDto.getItemColor(),
				cartDto.getItemSize(), cartDto.getItemCnt(),
				cartDto.getItemPrice(), cartDto.getCartPrice()
		};
		jdbcTemplate.update(sql,param);	
	}
	
	//장바구니 삭제
	@Override
	public void delete(CartDto cartDto) {
		String sql = "delete cart where cart_no=?";
		Object[] param = {cartDto};
		jdbcTemplate.update(sql, param);
	}
}
		
	
