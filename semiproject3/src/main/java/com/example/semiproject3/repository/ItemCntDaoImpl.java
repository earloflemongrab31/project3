package com.example.semiproject3.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.InvenDto;
import com.example.semiproject3.entity.ItemCntDto;

@Repository
public class ItemCntDaoImpl implements ItemCntDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void insert(InvenDto invenDto) {
		String sql = "insert into item_cnt("
						+ "item_no, "
						+ "item_size, "
						+ "item_color"
					+ ") values("
						+ "?,?,?)";
		Object[] param = {invenDto.getItemNo(), invenDto.getItemSize(), invenDto.getItemColor()};
		jdbcTemplate.update(sql, param);
	}

	@Override
	public void plus(int quantity, int itemNo) {
		String sql= "update item_cnt set item_total_cnt=item_total_cnt + ? where item_no=?";
		Object[] param= {
				quantity,
				itemNo
		};
		jdbcTemplate.update(sql,param);
	}
	@Override
	public void minus(int quantity, int itemNo) {
		String sql= "update item_cnt set item_total_cnt=item_total_cnt - ? where item_no=?";
		Object[] param= {
				quantity,
				itemNo
		};
		jdbcTemplate.update(sql,param);
	}

	
	private ResultSetExtractor<ItemCntDto> extractor = (rs)->{
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
	public ItemCntDto selectOne(InvenDto invenDto) {
		String sql = "select * from item_cnt where item_no=? and item_size=? and item_color=?";
		Object[] param = {invenDto.getItemNo(), invenDto.getItemSize(), invenDto.getItemColor()};
		return jdbcTemplate.query(sql, extractor, param);
	}
	
	
}
