package com.example.semiproject3.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.BuyDto;

@Repository
public class BuyDaoImpl implements BuyDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//RowMapper
	private RowMapper<BuyDto> mapper = (rs, idx) -> {
		return BuyDto.builder()
							.buyNo(rs.getInt("buy_no"))
							.orderNo(rs.getInt("order_no"))
							.CustomerId(rs.getString("customer_id"))
							.itemNo(rs.getInt("item_no"))
							.addressNo(rs.getInt("address_no"))
							.buyCnt(rs.getInt("buy_cnt"))
							.buyDate(rs.getDate("buy_date"))
						.build();
	};
	
	//ResultSetExtractor
	private ResultSetExtractor<BuyDto> extractor = (rs)->{
		if(rs.next()) {
			return BuyDto.builder()
					.buyNo(rs.getInt("buy_no"))
					.orderNo(rs.getInt("order_no"))
					.CustomerId(rs.getString("customer_id"))
					.itemNo(rs.getInt("item_no"))
					.addressNo(rs.getInt("address_no"))
					.buyCnt(rs.getInt("buy_cnt"))
					.buyDate(rs.getDate("buy_date"))
				.build();
		}
		else {
			return null;
		}
	};
	
	//번호 생성
	@Override
	public int sequence() {
		String sql = "select buy_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	//구매
	@Override
	public void insert(BuyDto buyDto) {
		String sql = "insert into buy("
				+ "buy_no, "
				+ "order_no, "
				+ "customer_id, "
				+ "item_no, "
				+ "address_no, "
				+ "buy_cnt, "
				+ "buy_date) "
				+ "values(?, ?, ? ,? ,? ,?, ?)";
		Object[] param = {
				buyDto.getBuyNo(), buyDto.getOrderNo(),
				buyDto.getCustomerId(), buyDto.getItemNo(),
				buyDto.getAddressNo(), buyDto.getBuyCnt(),
				buyDto.getBuyDate()
		};
		jdbcTemplate.update(sql, param);
	}

	//구매 목록
	@Override
	public List<BuyDto> selectList() {
		String sql = "select * from buy order by buy_no desc";
		return jdbcTemplate.query(sql, mapper);
	}

	//구매 목록 검색
	@Override
	public List<BuyDto> selectList(String type, String keyword) {
		String sql = "select * from buy "
				+ "where instr(#1, ?) > 0 order by buy_no desc";
		sql = sql.replace("#1", type);
		Object[] param = {keyword};
		return jdbcTemplate.query(sql, mapper, param);
	}

	//구매 정보
	@Override
	public BuyDto selectOne(int buyNo) {
		String sql = "select * from buy where buy_no = ?";
		Object[] param = {buyNo};
		return jdbcTemplate.query(sql, extractor, param);
	}

}
