package com.example.semiproject3.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.CartDto;

@Repository
public class CartDaoImpl implements CartDao{
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private RowMapper<CartDto> mapper = new RowMapper<CartDto>() {
		@Override
		public CartDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			CartDto dto = new CartDto();
			dto.setCartNo(rs.getInt("cart_no"));
			dto.setCustomerId(rs.getString("customer_id"));
			dto.setItemNo(rs.getInt("item_no"));
			dto.setCartItemName(rs.getString("cart_item_name"));
			dto.setCartItemPrice(rs.getInt("cart_item_price"));
			dto.setCartItemColor(rs.getString("cart_item_color"));
			dto.setCartItemSize(rs.getString("cart_item_size"));
			dto.setCartDate(rs.getDate("cart_date"));
			dto.setCartItemMoney(rs.getInt("cart_item_money"));
			dto.setCartItemQnty(rs.getInt("cart_item_qnty"));
			return dto;
		}
	};
	
	
	@Override
	public void insert(CartDto cartDto) {
		String sql="insert into cart values(cart_seq.nextval,?,?,?,?,?,?,sysdate,0,?)";
		Object[] param= {
				cartDto.getCustomerId(),
				cartDto.getItemNo(),
				cartDto.getCartItemName(),
				cartDto.getCartItemPrice(),
				cartDto.getCartItemColor(),
				cartDto.getCartItemSize(),
				cartDto.getCartItemQnty()
				
		};
		jdbcTemplate.update(sql,param);	
	}
	@Override
	public void delete(CartDto cartDto) {
		String sql = "delete cart where cart_no=?";
		Object[] param = {cartDto};
		jdbcTemplate.update(sql, param);
	}
}
		
	
