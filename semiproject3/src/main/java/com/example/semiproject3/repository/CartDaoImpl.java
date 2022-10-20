package com.example.semiproject3.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.CartDto;

@Repository
public class CartDaoImpl implements CartDao{
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public void insert(CartDto cartDto) {
		String sql="insert into cart(cart_no,customer_id,item_no,cart_item_name,cart_item_price,cart_item_color,cart_item_size) "
				+ "values(cart_seq.nextval,?,?,?,?,?,?)";
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
		String sql="delete cart where customer_id=?, item_no=?";
		Object[] param= {
				cartDto.getCustomerId(),
				cartDto.getItemNo()
		};
		jdbcTemplate.update(sql,param);
		
	}
	@Override
	public boolean check(CartDto cartDto) {
		String sql="select count(*) from cart where customer_id=?, item_no=?";
		Object[] param= {
				cartDto.getCustomerId(),
				cartDto.getItemNo()
		};
		int count= jdbcTemplate.queryForObject(sql, int.class,param);
		return count==1;
	}

}
