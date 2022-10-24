package com.example.semiproject3.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.CartDto;
import com.example.semiproject3.vo.CartListVO;

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
	
	private RowMapper<CartListVO> cartListMapper = (rs, idx) -> {
		return CartListVO.builder()
								.imageNo(rs.getInt("image_no"))
								.cartNo(rs.getInt("cart_no"))
								.customerId(rs.getString("customer_id"))
								.itemNo(rs.getInt("item_no"))
								.cartItemName(rs.getString("cart_item_name"))
								.cartItemPrice(rs.getInt("cart_item_price"))
								.cartItemColor(rs.getString("cart_item_color"))
								.cartItemSize(rs.getString("cart_item_size"))
								.cartDate(rs.getDate("cart_date"))
								.cartItemMoney(rs.getInt("cart_item_money"))
								.imageMain(rs.getString("image_main"))
							.build();
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
	
//	@Override
//	public int selectCart(String loginId) {
//		String sql="select count(*) from cart where customer_id=?";
//		Object[] param= {loginId};
//		return jdbcTemplate.queryForObject(sql, int.class, param);
//	}
	
	@Override
	public int selectCart(String loginId) {
		String sql="select count(*) from cart_list_view where customer_id=? and image_main = 1";
		Object[] param= {loginId};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}
	
	//장바구니 이미지 추가 리스트
	@Override
	public List<CartListVO> selectCartList(String loginId) {
		String sql = "select * from cart_list_view where customer_id = ?";
		Object[] param = {loginId};
		return jdbcTemplate.query(sql, cartListMapper, param);
	}
}
		
	

