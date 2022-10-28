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
						.build();
	};
	
	//ResultSetExtractor
	private ResultSetExtractor<BuyDto> extractor = (rs)->{
		if(rs.next()) {
			return BuyDto.builder()
				.build();
		}
		else {
			return null;
		}
	};
	
	//구매
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
				+ "delivery_detail_host) "
				+ "values(buy_seq.nextval,?,?,3000,?,?,?,?,?,?,?,?,?,?)";
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
				buyDto.getDeliveryDetailHost()
		};
		jdbcTemplate.update(sql, param);
	}

	//구매 목록
	@Override
	public List<BuyDto> selectList(String loginId) {
		String sql = "select * from buy where customer_id=? "
				+ "order by buy_no desc";
		return jdbcTemplate.query(sql, mapper, loginId);
	}

	//구매 목록 검색
	@Override
	public List<BuyDto> selectList(String loginId, String type, String keyword) {
		String sql = "select * from buy "
				+ "where instr(#1, ?) > 0 and customer_id=? "
				+ "order by buy_no desc";
		sql = sql.replace("#1", type);
		Object[] param = {keyword, loginId};
		return jdbcTemplate.query(sql, mapper, param);
	}
//
//	//구매 정보
//	@Override
//	public BuyDto selectOne(int buyNo) {
//		String sql = "select * from buy where buy_no = ?";
//		Object[] param = {buyNo};
//		return jdbcTemplate.query(sql, extractor, param);
//	}

}
