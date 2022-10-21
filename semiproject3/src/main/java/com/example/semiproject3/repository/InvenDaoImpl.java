package com.example.semiproject3.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.ImageDto;
import com.example.semiproject3.entity.InvenDto;

@Repository
public class InvenDaoImpl implements InvenDao{
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	
	//RowMapper
	private RowMapper<InvenDto> mapper = (rs, idx) -> {
		return InvenDto.builder()
							.invenNo(rs.getInt("inven_no"))
							.itemNo(rs.getInt("item_no"))
							.itemCate(rs.getInt("item_cate"))
							.itemSize(rs.getString("item_size"))
							.itemColor(rs.getString("item_color"))
							.invenInout(rs.getString("inven_inout"))
							.invenDate(rs.getDate("inven_date"))
							.invenName(rs.getString("inven_name"))
							.invenPhone(rs.getString("inven_phone"))
							.invenStatus(rs.getString("inven_status"))
							.invenQuantity(rs.getInt("inven_quantity"))
						.build();
	};
	
	
	@Override
	public void insert(InvenDto invenDto) {
		String sql="insert into inven values(inven_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] param= {
				invenDto.getItemNo(),
				invenDto.getItemCate(),
				invenDto.getItemName(),
				invenDto.getItemSize(),
				invenDto.getItemColor(),
				invenDto.getInvenInout(),
				invenDto.getInvenDate(),
				invenDto.getInvenName(),
				invenDto.getInvenPhone(),
				invenDto.getInvenStatus(),
				invenDto.getInvenQuantity()
		};
				jdbcTemplate.update(sql, param);
	}
	@Override
	public List<InvenDto> selectList() {
		String sql="select * from inven";
		return jdbcTemplate.query(sql, mapper);
	}
	
	@Override
	public void plus(int itemNo) {
	
		String sql="update item set item_total_cnt=(select inven_quantity from inven where item_no=? and inven_status='입고완료' ) where item_no=11";
		
	}
}
