package com.example.semiproject3.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.CartDto;
import com.example.semiproject3.vo.CartListVO;

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
							.cartCount(rs.getInt("cart_count"))
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
	
	//RowMapper(cart list)
	private RowMapper<CartListVO> cartMapper = (rs, idx) -> {
		return CartListVO.builder()
							.imageNo(rs.getInt("image_no"))
							.cartNo(rs.getInt("cart_no"))
							.customerId(rs.getString("customer_id"))
							.itemNo(rs.getInt("item_no"))
							.cartCount(rs.getInt("cart_count"))
							.itemName(rs.getString("item_name"))
							.itemColor(rs.getString("item_color"))
							.itemSize(rs.getString("item_size"))
							.itemCnt(rs.getInt("item_cnt"))
							.cartDate(rs.getDate("cart_date"))
							.itemPrice(rs.getInt("item_price"))
							.deliveryFee(rs.getInt("delivery_fee"))
							.cartPrice(rs.getInt("cart_price"))
							.imageMain(rs.getString("image_main"))
				.build();
	};
	
	//ResultSetExtractor
	private ResultSetExtractor<CartDto> extractor = (rs) -> {
		if(rs.next()) {
			return CartDto.builder()
							.cartNo(rs.getInt("cart_no"))
							.customerId(rs.getString("customer_id"))
							.itemNo(rs.getInt("item_no"))
							.cartCount(rs.getInt("cart_count"))
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
	
	//ResultSetExtractor(cart list)
	private ResultSetExtractor<CartListVO> cartExtractor = (rs) -> {
		if(rs.next()) {
			return CartListVO.builder()
								.imageNo(rs.getInt("image_no"))
								.cartNo(rs.getInt("cart_no"))
								.customerId(rs.getString("customer_id"))
								.itemNo(rs.getInt("item_no"))
								.cartCount(rs.getInt("cart_count"))
								.itemName(rs.getString("item_name"))
								.itemColor(rs.getString("item_color"))
								.itemSize(rs.getString("item_size"))
								.itemCnt(rs.getInt("item_cnt"))
								.cartDate(rs.getDate("cart_date"))
								.itemPrice(rs.getInt("item_price"))
								.deliveryFee(rs.getInt("delivery_fee"))
								.cartPrice(rs.getInt("cart_price"))
								.imageMain(rs.getString("image_main"))
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
	
	//장바구니 리스트
	@Override
	public List<CartListVO> selectList(String loginId) {
		String sql = "select * from cart_list_view  where customer_id = ? order by cart_no desc";
		return jdbcTemplate.query(sql, cartMapper, loginId);
	}
	
	//장바구니 삭제
	@Override
	public void delete(int cartNo) {
		String sql = "delete cart where cart_no=?";
		Object[] param = {cartNo};
		jdbcTemplate.update(sql, param);
	}
	
	//장바구니 개수
	@Override
	public void cartCount(CartDto cartDto) {
		// TODO Auto-generated method stub
		
	}
	
	//장바구니에 있는 상품 수량 변경(중복인경우)
	@Override
	public void plus(CartDto cartDto) {
		String sql= "update cart set item_cnt = item_cnt + ? where item_no = ? and item_size = ? and item_color = ? and customer_id = ?";
		Object[] param= {
				cartDto.getItemCnt(), cartDto.getItemNo(), cartDto.getItemSize(), cartDto.getItemColor(), cartDto.getCustomerId()
		};
		jdbcTemplate.update(sql,param);
	}
	
	@Override
	public void minus(CartDto cartDto) {
		String sql= "update cart set item_cnt = item_cnt - ? where item_no = ? and item_size = ? and item_color = ? and customer_id = ?";
		Object[] param= {
				cartDto.getItemCnt(), cartDto.getItemNo(), cartDto.getItemSize(), cartDto.getItemColor(), cartDto.getCustomerId()
		};
		jdbcTemplate.update(sql,param);
		
	}
	
	//장바구니에 상품이 있는지 중복조회
	@Override
	public CartDto selectOne(CartDto cartDto) {
		String sql = "select * from cart where item_no = ? and item_size = ? and item_color = ? and customer_id = ?";
		Object[] param = {
				cartDto.getItemNo(), cartDto.getItemSize(), cartDto.getItemColor(), cartDto.getCustomerId()
		};
		return jdbcTemplate.query(sql, extractor, param);
	}
	
}
		
	
