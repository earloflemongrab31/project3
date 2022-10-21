package com.example.semiproject3.repository;

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
							.CustomerId(rs.getString("customer_id"))
							.itemName(rs.getString("item_Name"))
							.itemPrice(rs.getInt("item_price"))
							.itemColor(rs.getString("item_color"))
							.itemSize(rs.getString("item_size"))
							.buyCnt(rs.getInt("buy_cnt"))
							.buyDate(rs.getDate("buy_date"))
							.buyFee(rs.getInt("buy_fee"))
							.customerPhone(rs.getString("customer_phone"))
						.build();
	};
	
	//ResultSetExtractor
	private ResultSetExtractor<BuyDto> extractor = (rs)->{
		if(rs.next()) {
			return BuyDto.builder()
					.buyNo(rs.getInt("buy_no"))
					.CustomerId(rs.getString("customer_id"))
					.itemName(rs.getString("item_Name"))
					.itemPrice(rs.getInt("item_price"))
					.itemColor(rs.getString("item_color"))
					.itemSize(rs.getString("item_size"))
					.buyCnt(rs.getInt("buy_cnt"))
					.buyDate(rs.getDate("buy_date"))
					.buyFee(rs.getInt("buy_fee"))
					.customerPhone(rs.getString("customer_phone"))
				.build();
		}
		else {
			return null;
		}
	};
	
	//번호 생성
	@Override
	public int sequence() {
		String sql = "";
		return 0;
	}
	
	@Override
	public void insert(BuyDto buyDto) {
		String sql = "insert into buy(buy_seq.netxval,";
		
	}
}
