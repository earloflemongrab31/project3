package com.example.semiproject3.repository;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.ItemDto;

@Repository
public class ItemDaoImpl implements ItemDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//RowMapper
	private RowMapper<ItemDto> mapper = (rs, idx) -> {
		return ItemDto.builder()
							.itemNo(rs.getInt("item_no"))
							.cateCode(rs.getString("cate_code"))
							.itemName(rs.getString("item_name"))
							.itemMemo(rs.getString("item_memo"))
							.itemContent(rs.getString("item_content"))
							.itemPrice(rs.getInt("item_price"))
							.itemColor(rs.getString("item_color"))
							.itemSize(rs.getString("item_size"))
							.itemTotalCnt(rs.getInt("item_total_cnt"))
							.itemLikeCnt(rs.getInt("item_like_cnt"))
							.itemDate(rs.getDate("item_date"))
				.build();
	};
	
	//ResultSetExtractor
	private ResultSetExtractor<ItemDto> extractor = (rs) -> {
		if(rs.next()) {
			return ItemDto.builder()
								.itemNo(rs.getInt("item_no"))
								.cateCode(rs.getString("cate_code"))
								.itemName(rs.getString("item_name"))
								.itemMemo(rs.getString("item_memo"))
								.itemContent(rs.getString("item_content"))
								.itemPrice(rs.getInt("item_price"))
								.itemColor(rs.getString("item_color"))
								.itemSize(rs.getString("item_size"))
								.itemTotalCnt(rs.getInt("item_total_cnt"))
								.itemLikeCnt(rs.getInt("item_like_cnt"))
								.itemDate(rs.getDate("item_date"))
					.build();
		}
		else {
			return null;
		}
	};
	
	//번호 생성
	@Override
	public int sequence() {
		String sql = "select item_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	//상품 등록
	@Override
	public void insert(ItemDto itemDto) {
		String sql = "insert into item("
						+ "item_no, "
						+ "cate_code, "
						+ "item_name, "
						+ "item_memo, "
						+ "item_content, "
						+ "item_price, "
						+ "item_color, "
						+ "item_size) "
						+ "values(?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] param = {
				itemDto.getItemNo(), itemDto.getCateCode(), 
				itemDto.getItemName(), itemDto.getItemMemo(), 
				itemDto.getItemContent(), itemDto.getItemPrice(), 
				itemDto.getItemColor(), itemDto.getItemSize()};
		jdbcTemplate.update(sql, param);
	}

	//상품 목록
	@Override
	public List<ItemDto> selectList() {
		String sql = "select * from item order by item_no desc";
		return jdbcTemplate.query(sql, mapper);
	}
	
	//상품 검색
	@Override
	public List<ItemDto> selectList(String type, String keyword) {
		String sql = "select * from item "
				+ "where instr(#1, ?) > 0 order by item_no desc";
		sql = sql.replace("#1", type);
		Object[] param = {keyword};
		return jdbcTemplate.query(sql, mapper, param);
	}
	
	//상품 정보
	@Override
	public ItemDto selectOne(int itemNo) {
		String sql = "select * from item where item_no = ?";
		Object[] param = {itemNo};
		return jdbcTemplate.query(sql, extractor, param);
	}

	//상품 수정
	@Override
	public boolean update(ItemDto itemDto) {
		String sql = "update item set "
						+ "item_name = ?, "
						+ "cate_code = ?, "
						+ "item_memo = ?, "
						+ "item_content = ?, "
						+ "item_price = ?, "
						+ "item_color = ?, "
						+ "item_size = ? "
						+ "where item_no = ?";
		Object[] param = {
				itemDto.getItemName(), itemDto.getCateCode(), 
				itemDto.getItemMemo(), itemDto.getItemContent(),
				itemDto.getItemPrice(), itemDto.getItemColor(), 
				itemDto.getItemSize(), itemDto.getItemNo()};
		return jdbcTemplate.update(sql, param) > 0;
	}

	//상품 삭제
	@Override
	public boolean delete(int itemNo) {
		String sql = "delete item where item_no = ?";
		Object[] param = {itemNo};
		return jdbcTemplate.update(sql, param) > 0;
	}

	//좋아요 구현
	@Override
	public boolean like(int itemNo) {
		String sql = "update item set item_like_cnt = item_like_cnt + 1 where item_no = ?";
		Object[] param = {itemNo};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	//아이템과 이미지 연결
	@Override
	public void connectImage(int itemNo, int imageNo) {
		String sql = "insert into item_image(item_no, image_no) values(?,?)";
		Object[] param = {itemNo, imageNo};
		jdbcTemplate.update(sql, param);
	}
		
}
