package com.example.semiproject3.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

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
			return dto;
		}
	};
	
	@Override
	public void insert(CartDto cartDto) {
		String sql="insert into cart values(cart_seq.nextval,?,?,?,?,?,?,sysdate,0)";
		Object[] param= {
				cartDto.getCustomerId(),
				cartDto.getItemNo(),
				cartDto.getCartItemName(),
				cartDto.getCartItemPrice(),
				cartDto.getCartItemColor(),
				cartDto.getCartItemSize()
				
		};
		jdbcTemplate.update(sql,param);
		
	}
	@Override
	public void delete(CartDto cartDto) {
		String sql="delete cart where customer_id=? and item_no=?";
		Object[] param= {
				cartDto.getCustomerId(),
				cartDto.getItemNo()
		};
		jdbcTemplate.update(sql,param);
		
	}
	@Override
	public boolean check(CartDto cartDto) {
		String sql="select count(*) from cart where customer_id=? and item_no=?";
		Object[] param= {
				cartDto.getCustomerId(),
				cartDto.getItemNo()
		};
		int count= jdbcTemplate.queryForObject(sql, int.class,param);
		return count==1;
	}
	
	@Override
	public List<CartDto> selectList(String loginId) {
		String sql="select * from cart where customer_id=?";
		Object[] param= {loginId};
		return jdbcTemplate.query(sql,mapper,param);
	}
	@Override
	public int selectCart(String loginId) {
		String sql="select count(*) cart where customer_id=?";
		Object[] param= {loginId};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}
	
	@Override
	public void plusItem(CartDto cartDto) {
		String sql="update cart set cart_item_money=cart_item_money+cart_item_price where customer_id='test1234' and item_no='7'";
	}
	@Override
	public void minusItem(CartDto cartDto) {
		// TODO Auto-generated method stub
		
	}

}
