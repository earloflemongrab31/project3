package com.example.semiproject3.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.InvenDto;
import com.example.semiproject3.entity.ItemCntDto;

@Repository
public class ItemCntDaoImpl implements ItemCntDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<ItemCntDto> mapper = (rs, idx) -> {
		return ItemCntDto.builder()
							.itemNo(rs.getInt("item_no"))
							.itemSize(rs.getString("item_size"))
							.itemColor(rs.getString("item_color"))
							.itemTotalCnt(rs.getInt("item_total_cnt"))
				.build();
	};
	
	private ResultSetExtractor<ItemCntDto> extractor = (rs) -> {
		if(rs.next()) {
			return ItemCntDto.builder()
					.itemNo(rs.getInt("item_no"))
					.itemSize(rs.getString("item_size"))
					.itemColor(rs.getString("item_color"))
					.itemTotalCnt(rs.getInt("item_total_cnt"))
				.build();
		}
		else {
			return null;
		}
		
	};
	
	@Override
	public void insert(InvenDto invenDto) {
		String sql = "insert into item_cnt(item_no, item_size, item_color, item_total_cnt) values(?, ?, ?, ?)";
		Object[] param = {
				invenDto.getItemNo(), invenDto.getItemSize(), 
				invenDto.getItemColor(), invenDto.getInvenQuantity()};
		jdbcTemplate.update(sql, param);
		
	}
	
	@Override
	public boolean update(InvenDto invenDto) {
		String sql = "update item_cnt set item_total_cnt = item_total_cnt - ? where item_no = ? and item_size = ? and item_color = ?";
		Object[] param = {
				invenDto.getInvenQuantity(), invenDto.getItemNo(), invenDto.getItemSize(), invenDto.getItemColor()
		};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	@Override
	public ItemCntDto selectOne(InvenDto invenDto) {
		String sql = "select * from item_cnt where item_no = ? and item_size = ? and item_color = ?";
		Object[] param = {
				invenDto.getItemNo(), invenDto.getItemSize(), invenDto.getItemColor()
		};
		return jdbcTemplate.query(sql, extractor, param);
	}
	
}
