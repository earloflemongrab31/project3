package com.example.semiproject3.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.BuyDto;
import com.example.semiproject3.vo.BuyListCountVO;
import com.example.semiproject3.vo.BuyListSearchVO;

@Repository
public class BuyDaoImpl implements BuyDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//RowMapper
	private RowMapper<BuyDto> mapper = (rs, idx) -> {
		return BuyDto.builder()
				.buyNo(rs.getInt("buy_no"))
				.customerId(rs.getString("customer_id"))
				.itemNo(rs.getInt("item_no"))
				.buyDate(rs.getDate("buy_date"))
				.deliveryFee(rs.getInt("delivery_fee"))
				.itemName(rs.getString("item_name"))
				.itemSize(rs.getString("item_size"))
				.itemColor(rs.getString("item_color"))
				.itemCnt(rs.getInt("item_cnt"))
				.deliveryStatus(rs.getString("delivery_status"))
				.itemTotalPrice(rs.getInt("item_total_price"))
				.deliveryName(rs.getString("delivery_name"))
				.deliveryPhone(rs.getString("delivery_phone"))
				.deliveryPost(rs.getString("delivery_post"))
				.deliveryHost(rs.getString("delivery_host"))
				.deliveryDetailHost(rs.getString("delivery_detail_host"))
				.imageNo(rs.getInt("image_no"))
			.build();
	};
	
	//ResultSetExtractor
	private ResultSetExtractor<BuyDto> extractor = (rs)->{
		if(rs.next()) {
			return BuyDto.builder()
					.buyNo(rs.getInt("buy_no"))
					.customerId(rs.getString("customer_id"))
					.itemNo(rs.getInt("item_no"))
					.buyDate(rs.getDate("buy_date"))
					.deliveryFee(rs.getInt("delivery_fee"))
					.itemName(rs.getString("item_name"))
					.itemSize(rs.getString("item_size"))
					.itemColor(rs.getString("item_color"))
					.itemCnt(rs.getInt("item_cnt"))
					.deliveryStatus(rs.getString("delivery_status"))
					.itemTotalPrice(rs.getInt("item_total_price"))
					.deliveryName(rs.getString("delivery_name"))
					.deliveryPhone(rs.getString("delivery_phone"))
					.deliveryPost(rs.getString("delivery_post"))
					.deliveryHost(rs.getString("delivery_host"))
					.deliveryDetailHost(rs.getString("delivery_detail_host"))
					.imageNo(rs.getInt("image_no"))
				.build();
		}
		else {
			return null;
		}
	};
	
	//??????
	@Override
	public void insert(BuyDto buyDto) {
		String sql = "insert into buy("
				+ "buy_no,"
				+ "customer_id,"
				+ "item_no,"
				+ "delivery_fee,"
				+ "item_name,"
				+ "item_size,"
				+ "item_color,"
				+ "item_cnt,"
				+ "item_total_price,"
				+ "delivery_name,"
				+ "delivery_phone,"
				+ "delivery_post,"
				+ "delivery_host,"
				+ "delivery_detail_host,"
				+ "image_no) "
				+ "values(buy_seq.nextval,?,?,3000,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] param = {
				buyDto.getCustomerId(),
				buyDto.getItemNo(),
				buyDto.getItemName(),
				buyDto.getItemSize(),
				buyDto.getItemColor(),
				buyDto.getItemCnt(),
				buyDto.getItemTotalPrice(),
				buyDto.getDeliveryName(),
				buyDto.getDeliveryPhone(),
				buyDto.getDeliveryPost(),
				buyDto.getDeliveryHost(),
				buyDto.getDeliveryDetailHost(),
				buyDto.getImageNo()
		};
		jdbcTemplate.update(sql, param);
	}

	//?????? ??????
	@Override
	public List<BuyDto> selectBuyList(BuyListSearchVO vo, String loginId) {
		if(vo.isSearch()) {
			return buySearch(vo, loginId);
		}
		else {
			return buyList(vo, loginId);
		}
	}
	//?????? ?????? ?????? ??? ??????(?????????)
	@Override
	public List<BuyDto> buySearch(BuyListSearchVO vo, String loginId) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select * from buy where instr(#1,?) > 0 and where customer_id = ? "
					+ "order by buy_date desc"
				+ ")TMP"
			+ ") where rn between ? and ?";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {
				vo.getKeyword(), loginId, vo.startRow(), vo.endRow()
		};
	return jdbcTemplate.query(sql, mapper, param);
	}
	
	@Override
	public List<BuyDto> buyList(BuyListSearchVO vo, String loginId) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select * from buy where customer_id = ? order by buy_date desc"
				+ ")TMP"
			+") where rn between ? and ?";
		Object[] param = {loginId, vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, mapper, param);
	}
	
	//?????? ?????? ?????? ????????????
	@Override
	public int buyCount(BuyListSearchVO vo, String loginId) {
		if(vo.isSearch()) {
			return buySearchCount(vo, loginId);
		}
		else {
			return buyListCount(vo, loginId);
		}
	}
	
	@Override
	public int buyListCount(BuyListSearchVO vo, String loginId) {
		String sql = "select count(*) from buy where customer_id = ?";
		Object[] param = {loginId};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}
	
	@Override
	public int buySearchCount(BuyListSearchVO vo, String logindId) {
		String sql = "select count(*) from buy where instr(#1, ?) > 0 and customer_id = ?";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {vo.getKeyword(), logindId};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}
	
	//????????? ?????? ?????? ??????
	@Override
	public void minus(BuyDto buyDto) {
		String sql= "update item_cnt set item_total_cnt = item_total_cnt - ? where item_no = ? and item_size = ? and item_color = ?";
		Object[] param= {
				buyDto.getItemCnt(), buyDto.getItemNo(), buyDto.getItemSize(), buyDto.getItemColor()
		};
		jdbcTemplate.update(sql,param);
	}
	
	//?????? ??????????????? ?????? ??? ?????? ??????
	@Override
	public void itemMinus(BuyDto buyDto) {
		String sql= "update item set item_total_cnt = item_total_cnt - ? where item_no = ?";
		Object[] param= {
				buyDto.getItemCnt(), buyDto.getItemNo()
		};
		jdbcTemplate.update(sql,param);
	}

	@Override
	public BuyDto selectOne(int buyNo) {
		String sql = "select * from buy where buy_no=?";
		return jdbcTemplate.query(sql, extractor, buyNo);
	}

	@Override
	public boolean update(int buyNo, String deliveryStatus) {
		String sql = "update buy set delivery_status=? where buy_no=?";
		Object[] param = {deliveryStatus, buyNo};
		return jdbcTemplate.update(sql, param) > 0;
	}

	@Override
	public List<BuyDto> selectAdminList(BuyListSearchVO vo) {
		if(vo.isSearch()) {
			return adminSearch(vo);
		}
		else {
			return adminList(vo);
		}
	}

	@Override
	public List<BuyDto> adminList(BuyListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from("
					+ "select * from buy order by buy_no desc"
				+ ")TMP"
			+ ") where rn between ? and ?";
		Object[] param = {vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, mapper, param);
	}

	@Override
	public List<BuyDto> adminSearch(BuyListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select * from buy where instr(#1,?) > 0"
					+ "order by buy_no desc"
				+ ")TMP"
			+ ") where rn between ? and ?";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {
				vo.getKeyword(), vo.startRow(), vo.endRow()
		};
		return jdbcTemplate.query(sql, mapper, param);
	}

	@Override
	public int count(BuyListSearchVO vo) {
		if(vo.isSearch()) {
			return searchCount(vo);
		}
		else {
			return listCount(vo);
		}
	}

	@Override
	public int searchCount(BuyListSearchVO vo) {
		String sql = "select count(*) from buy where instr(#1, ?) > 0";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {vo.getKeyword()};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}

	@Override
	public int listCount(BuyListSearchVO vo) {
		String sql = "select count(*) from buy";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
			private RowMapper<BuyListCountVO> countMapper = new RowMapper<BuyListCountVO>() {
				@Override
				public BuyListCountVO mapRow(ResultSet rs, int rowNum) throws SQLException {
					BuyListCountVO vo = new BuyListCountVO();
					vo.setItemName(rs.getString("item_name"));
					vo.setCnt(rs.getInt("cnt"));
					return vo;
				}
			};

	@Override
	public List<BuyListCountVO> selectCountList() {
		String sql = "select item_name, count(*) cnt from buy group by item_name order by cnt desc";
		return jdbcTemplate.query(sql, countMapper);
}
}