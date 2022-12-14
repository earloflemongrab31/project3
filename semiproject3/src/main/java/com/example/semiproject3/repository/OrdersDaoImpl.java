package com.example.semiproject3.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.OrdersDto;
import com.example.semiproject3.vo.OrdersListSearchVO;

@Repository
public class OrdersDaoImpl implements OrdersDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private RowMapper<OrdersDto> mapper = (rs, idx)->{
		return OrdersDto.builder()
					.ordersNo(rs.getInt("orders_no"))
					.customerId(rs.getString("customer_id"))
					.itemNo(rs.getInt("item_no"))
					.itemName(rs.getString("item_name"))
					.itemPrice(rs.getInt("item_price"))
					.itemColor(rs.getString("item_color"))
					.itemSize(rs.getString("item_size"))
					.itemCnt(rs.getInt("item_cnt"))
					.imageNo(rs.getInt("image_no"))
				.build();
	};
	
	private ResultSetExtractor<OrdersDto> extractor = (rs)->{
		if(rs.next()) {
			return OrdersDto.builder()
					.ordersNo(rs.getInt("orders_no"))
					.customerId(rs.getString("customer_id"))
					.itemNo(rs.getInt("item_no"))
					.itemName(rs.getString("item_name"))
					.itemPrice(rs.getInt("item_price"))
					.itemColor(rs.getString("item_color"))
					.itemSize(rs.getString("item_size"))
					.itemCnt(rs.getInt("item_cnt"))
					.imageNo(rs.getInt("image_no"))
				.build();
		}
		else {
			return null;
		}
	};
	
	//주문 목록에 담기
	@Override
	public void insert(OrdersDto ordersDto) {
		String sql = "insert into orders("
				+ "orders_no, "
				+ "customer_id, "
				+ "item_no, "
				+ "item_name, "
				+ "item_price, "
				+ "item_size, "
				+ "item_color, "
				+ "item_cnt,"
				+ "image_no) "
				+ "values(orders_seq.nextval,?,?,?,?,?,?,?,?)";
		
		Object[] param = {
				ordersDto.getCustomerId(), 
				ordersDto.getItemNo(),
				ordersDto.getItemName(),
				ordersDto.getItemPrice(),
				ordersDto.getItemSize(), 
				ordersDto.getItemColor(),
				ordersDto.getItemCnt(),
				ordersDto.getImageNo()};
		
		jdbcTemplate.update(sql, param);
	}

	//주문 목록에 있는지 중복 조회
	@Override
	public OrdersDto selectOne(OrdersDto ordersDto) {
		String sql = "select * from orders where item_no = ? and item_size = ? and item_color = ? and customer_id = ?";
		Object[] param = {
				ordersDto.getItemNo(), ordersDto.getItemSize(), ordersDto.getItemColor(), ordersDto.getCustomerId()
		};
		return jdbcTemplate.query(sql, extractor, param);
	}
	
	@Override
	public void delete(int ordersNo) {
		String sql = "delete orders where orders_no=?";
		Object[] param = {ordersNo};
		jdbcTemplate.update(sql, param);
	}

	@Override
	public OrdersDto selectOne2(OrdersDto ordersDto) {
		String sql = "select * from orders where customer_id=? and item_size=? and item_color?";
		Object[] param = {ordersDto.getCustomerId(), ordersDto.getItemSize(), ordersDto.getItemColor()};
		return jdbcTemplate.query(sql, extractor, param);
	}
	
	//주문 목록
	@Override
	public List<OrdersDto> selectList(String loginId) {
		String sql = "select * from orders where customer_id=?";
		return jdbcTemplate.query(sql, mapper, loginId);
	}
	
	//주문 목록에 있는 상품 수량 변경(중복인경우)
	@Override
	public void plus(OrdersDto ordersDto) {
		String sql= "update orders set item_cnt = item_cnt + ? where item_no = ? and item_name = ? and item_size = ? and item_color = ? and customer_id = ? and image_no = ?";
		Object[] param= {
				ordersDto.getItemCnt(), ordersDto.getItemNo(), ordersDto.getItemName(), ordersDto.getItemSize(), ordersDto.getItemColor(), ordersDto.getCustomerId() , ordersDto.getImageNo()
		};
		jdbcTemplate.update(sql,param);
	}
	
	@Override
	public void minus(OrdersDto ordersDto) {
		String sql= "update orders set item_cnt = item_cnt - ? where item_no = ? and item_size = ? and item_color = ? and customer_id = ?";
		Object[] param= {
				ordersDto.getItemCnt(), ordersDto.getItemNo(), ordersDto.getItemSize(), ordersDto.getItemColor(), ordersDto.getCustomerId()
		};
		jdbcTemplate.update(sql,param);
	}

	@Override
	public List<OrdersDto> selectList(OrdersListSearchVO vo) {
		if(vo.isSearch()) {
			return search(vo);
		}
		else {
			return list(vo);
		}
		
	}

	@Override
	public List<OrdersDto> list(OrdersListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from("
					+ "select * from orders order by orders_no desc"
				+ ")TMP"
			+ ") where rn between ? and ?";
		Object[] param = {vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, mapper, param);
	}

	@Override
	public List<OrdersDto> search(OrdersListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select * from orders where instr(#1,?) > 0 "
					+ "order by orders_no desc"
				+ ")TMP"
			+ ") where rn between ? and ?";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {
				vo.getKeyword(), vo.startRow(), vo.endRow()
		};
		return jdbcTemplate.query(sql, mapper, param);
	}

	@Override
	public int count(OrdersListSearchVO vo) {
		if(vo.isSearch()) {
			return searchCount(vo);
		}
		else {
			return listCount(vo);
		}
	}

	@Override
	public int searchCount(OrdersListSearchVO vo) {
		String sql = "select count(*) from orders where instr(#1, ?) > 0";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {vo.getKeyword()};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}

	@Override
	public int listCount(OrdersListSearchVO vo) {
		String sql = "select count(*) from orders";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	@Override
	public boolean deleteAll(String loginId) {
		String sql = "delete orders where customer_id=?";
		return jdbcTemplate.update(sql, loginId) > 0;
	}

	
}