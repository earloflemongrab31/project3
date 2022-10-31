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
					.itemSize(rs.getString("item_size"))
					.itemColor(rs.getString("item_color"))
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
//					.addressName(rs.getString("address_name"))
//					.addressPhone(rs.getString("address_phone"))
//					.addressPost(rs.getString("address_post"))
//					.addressHost(rs.getString("address_host"))
//					.addressDetailHost(rs.getString("address_detail_host"))
//					.payMoney(rs.getInt("pay_money"))
//					.imageNo(rs.getInt("image_no"))
					.itemName(rs.getString("item_name"))
					.itemPrice(rs.getInt("item_price"))
					.itemSize(rs.getString("item_size"))
					.itemColor(rs.getString("item_color"))
					.itemCnt(rs.getInt("item_cnt"))
//					.ordersTime(rs.getDate("orders_time"))
					.imageNo(rs.getInt("image_no"))
				.build();
		}
		else {
			return null;
		}
	};
	
	

	@Override
	public List<OrdersDto> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

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

	@Override
	public OrdersDto selectOne(String customerId) {
		String sql = "select * from orders where customer_id=?";
		return jdbcTemplate.query(sql, extractor, customerId);
	}
	
	@Override
	public boolean delete(int ordersNo) {
		String sql = "delete orders where orders_no=?";
		return jdbcTemplate.update(sql, ordersNo) > 0;
	}

//	@Override
//	public boolean update(OrdersDto ordersDto) {
//		String sql = "update orders set "
//						+ "address_name,"
//						+ "address_phone,"
//						+ "address_post,"
//						+ "address_host,"
//						+ "address_detail_host,"
//						+ "pay_money,"
//						+ "delivery_fee,"
//						+ "image_no,"
//					+ "orders_time) values(?,?,?,?,?,?,3000,?,sysdate)";
//		Object[] param = {
//				ordersDto.getAddressName(),
//				ordersDto.getAddressPhone(),
//				ordersDto.getAddressPost(),
//				ordersDto.getAddressHost(),
//				ordersDto.getAddressDetailHost(),
//				ordersDto.getPayMoney(),
//				ordersDto.getImageNo()
//		};
//				
//		return jdbcTemplate.update(sql, param) > 0;
//	}

	@Override
	public boolean check(OrdersDto ordersDto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<OrdersDto> selectList(String type, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectOrders(int ordersNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public OrdersDto selectOne2(OrdersDto ordersDto) {
		String sql = "select * from orders where customer_id=? and item_size=? and item_color?";
		Object[] param = {ordersDto.getCustomerId(), ordersDto.getItemSize(), ordersDto.getItemColor()};
		return jdbcTemplate.query(sql, extractor, param);
	}

	@Override
	public List<OrdersDto> selectList(String loginId) {
		String sql = "select * from orders where customer_id=?";
		return jdbcTemplate.query(sql, mapper, loginId);
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


//	//로우맵퍼
//	private RowMapper<OrdersDto> mapper = new RowMapper<OrdersDto>() {
//
//		@Override
//		public OrdersDto mapRow(ResultSet rs, int rowNum) throws SQLException {
//			OrdersDto ordersDto = new OrdersDto();
//				ordersDto.setOrdersNo(rs.getInt("orders_no"));
//				ordersDto.setCustomerId(rs.getString("customer_id"));
//				ordersDto.setItemFee(rs.getInt("item_fee"));
//			return ordersDto;
//		}
//	};
//	
//	private ResultSetExtractor<OrdersDto> extractor = new ResultSetExtractor<OrdersDto>() {
//
//		@Override
//		public OrdersDto extractData(ResultSet rs) throws SQLException, DataAccessException {
//			if(rs.next()) {
//				OrdersDto ordersDto = new OrdersDto();
//				ordersDto.setOrdersNo(rs.getInt("orders_no"));
//				ordersDto.setCustomerId(rs.getString("customer_id"));
//				ordersDto.setItemFee(rs.getInt("item_fee"));
//				return ordersDto;	
//			}
//			else {
//				return null;	
//			}
//			
//		}
//	};
//
//	@Override
//	public void delete(OrdersDto ordersDto) {
//		String sql = "delete orders where orders_no=? and customer_id=?";
//		Object[] param = {
//				ordersDto.getOrdersNo(),
//				ordersDto.getCustomerId()
//		};
//		jdbcTemplate.update(sql,param);
//	}
//
//	@Override
//	public boolean check(OrdersDto ordersDto) {
//		String sql = "select count(*) from orders where customer_id=? and orders_no=?";
//		Object[] param = {
//				ordersDto.getCustomerId(),
//				ordersDto.getOrdersNo()
//		};
//		int count = jdbcTemplate.queryForObject(sql, int.class, param);
//		return count == 1;
//	}
//
//	@Override
//	public int selectOrders(int ordersNo) {
//		String sql = "select count(*) from orders where orders_no=?";
//		Object[] param = {ordersNo};
//		return jdbcTemplate.queryForObject(sql, int.class, param);
//	}
//
//	public int sequence() {
//		String sql = "select orders_seq.nextval from dual";
//		return jdbcTemplate.queryForObject(sql, int.class);
//	}
//
//	@Override
//	public List<OrdersDto> selectList() {
//		String sql = "select * from orders order by orders_no asc";
//		return jdbcTemplate.query(sql, mapper);
//	}
//
//	@Override
//	public List<OrdersDto> selectList(String type, String keyword) {
//		String sql = "select * from orders where instr(#1, ?) > 0 order by #1 asc";
//		sql = sql.replace("#1", type);
//		Object[] param = {keyword};
//		return jdbcTemplate.query(sql, mapper, param);
//	}
//
//	@Override
//	public List<OrdersDto> selectList(String customerId) {
//		String sql = "select * from orders where customer_id=?";
//		Object[] param = {customerId};
//		return jdbcTemplate.query(sql, mapper, param);
//	}
//
//	@Override
//	public void insert(int ordersNo, String customerId) {
//		String sql = "insert into orders("
//						+ "orders_no,"
//						+ "customer_id) "
//						+ "values(?, ?)";
//		Object[] param = { 
//						ordersNo, 
//						customerId
//		};
//		
//		jdbcTemplate.update(sql, param);
//	}
//
//	@Override
//	public List<OrdersDto> selectList(OrdersListSearchVO vo) {
//		if(vo.isSearch()) {
//			return search(vo);
//		}
//		else {
//			return list(vo);
//		}
//	}
//
//	@Override
//	public List<OrdersDto> list(OrdersListSearchVO vo) {
//		String sql = "select * from ("
//				+ "select rownum rn, TMP.* from("
//					+ "select * from orders order by orders_no desc"
//				+ ")TMP"
//			+ ") where rn between ? and ?";
//		Object[] param = {vo.startRow(), vo.endRow()};
//		return jdbcTemplate.query(sql, mapper, param);
//	}
//
//	@Override
//	public List<OrdersDto> search(OrdersListSearchVO vo) {
//		String sql = "select * from ("
//				+ "select rownum rn, TMP.* from ("
//					+ "select * from orders where instr(#1,?) > 0 "
//					+ "order by orders_no desc"
//				+ ")TMP"
//			+ ") where rn between ? and ?";
//		sql = sql.replace("#1", vo.getType());
//		Object[] param = {
//				vo.getKeyword(), vo.startRow(), vo.endRow()
//		};
//		return jdbcTemplate.query(sql, mapper, param);
//	}
//
//	@Override
//	public int count(OrdersListSearchVO vo) {
//		if(vo.isSearch()) {
//			return searchCount(vo);
//		}
//		else {
//			return listCount(vo);
//		}
//	}
//	
//	@Override
//	public int searchCount(OrdersListSearchVO vo) {
//		String sql = "select count(*) from orders where instr(#1, ?) > 0";
//		sql = sql.replace("#1", vo.getType());
//		Object[] param = {vo.getKeyword()};
//		return jdbcTemplate.queryForObject(sql, int.class, param);
//	}
//
//	@Override
//	public int listCount(OrdersListSearchVO vo) {
//		String sql = "select count(*) from orders";
//		return jdbcTemplate.queryForObject(sql, int.class);
//	}
//
//	@Override
//	public OrdersDto selectOne(int ordersNo) {
//		String sql = "select * from orders where orders_no=?";
//		Object[] param = {ordersNo};
//		return jdbcTemplate.query(sql, extractor, param);
//	}
//
//	@Override
//	public OrdersDto selectOne2(int itemCnt) {
//		String sql = "select * from orders where item_cnt=?";
//		Object[] param = {itemCnt};
//		return jdbcTemplate.query(sql, extractor, param);
//	}
	
	
}