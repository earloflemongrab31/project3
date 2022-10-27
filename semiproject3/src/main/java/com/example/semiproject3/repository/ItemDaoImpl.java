package com.example.semiproject3.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.ItemDto;
import com.example.semiproject3.vo.BuyListVO;
import com.example.semiproject3.vo.InvenListSearchVO;
import com.example.semiproject3.vo.ItemListSearchVO;
import com.example.semiproject3.vo.ItemListVO;

@Repository
public class ItemDaoImpl implements ItemDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	//RowMapper
	private RowMapper<ItemDto> mapper = (rs, idx) -> {
		return ItemDto.builder()
							.itemNo(rs.getInt("item_no"))
							.itemCate(rs.getString("cate_code"))
							.itemName(rs.getString("item_name"))
							.itemMemo(rs.getString("item_memo"))
							.itemContent(rs.getString("item_content"))
							.itemPrice(rs.getInt("item_price"))
							.itemColor(rs.getString("item_color"))
							.itemSize(rs.getString("item_size"))
							.itemTotalCnt(rs.getInt("item_total_cnt"))
							.itemLikeCnt(rs.getInt("item_like_cnt"))
							.itemDate(rs.getDate("item_date"))
							.invenIn(rs.getInt("inven_in"))
							.invenOut(rs.getInt("inven_out"))
				.build();
	};
	
	//RowMapper(상품용)
	private RowMapper<ItemListVO> itemMapper = (rs, idx) -> {
		return ItemListVO.builder()
							.itemNo(rs.getInt("item_no"))
							.itemCate(rs.getString("cate_code"))
							.itemName(rs.getString("item_name"))
							.itemMemo(rs.getString("item_memo"))
							.itemContent(rs.getString("item_content"))
							.itemPrice(rs.getInt("item_price"))
							.itemColor(rs.getString("item_color"))
							.itemSize(rs.getString("item_size"))
							.itemTotalCnt(rs.getInt("item_total_cnt"))
							.itemLikeCnt(rs.getInt("item_like_cnt"))
							.itemDate(rs.getDate("item_date"))
							.imageNo(rs.getInt("image_no"))
							.imageMain(rs.getString("image_main"))
				.build();
	};
	
	//RowMapper buyList 전용
	private RowMapper<BuyListVO> buyListMapper = (rs, idx) -> {
		return BuyListVO.builder()
							.imageNo(rs.getInt("image_no"))
							.itemNo(rs.getInt("item_no"))
							.itemCate(rs.getString("cate_code"))
							.itemName(rs.getString("item_name"))
							.itemMemo(rs.getString("item_memo"))
							.itemContent(rs.getString("item_content"))
							.itemPrice(rs.getInt("item_price"))
							.itemColor(rs.getString("item_color"))
							.itemSize(rs.getString("item_size"))
							.itemTotalCnt(rs.getInt("item_total_cnt"))
							.itemLikeCnt(rs.getInt("item_like_cnt"))
							.itemDate(rs.getDate("item_date"))
							.imageMain(rs.getString("image_main"))
				.build();
	};
	
	//ResultSetExtractor
	private ResultSetExtractor<ItemDto> extractor = (rs) -> {
		if(rs.next()) {
			return ItemDto.builder()
								.itemNo(rs.getInt("item_no"))
								.itemCate(rs.getString("cate_code"))
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
	
	//ResultSetExtractor(상품용)
	private ResultSetExtractor<ItemListVO> itemExtractor = (rs) -> {
		if(rs.next()) {
			return ItemListVO.builder()
								.itemNo(rs.getInt("item_no"))
								.itemCate(rs.getString("cate_code"))
								.itemName(rs.getString("item_name"))
								.itemMemo(rs.getString("item_memo"))
								.itemContent(rs.getString("item_content"))
								.itemPrice(rs.getInt("item_price"))
								.itemColor(rs.getString("item_color"))
								.itemSize(rs.getString("item_size"))
								.itemTotalCnt(rs.getInt("item_total_cnt"))
								.itemLikeCnt(rs.getInt("item_like_cnt"))
								.itemDate(rs.getDate("item_date"))
								.imageNo(rs.getInt("image_no"))
								.imageMain(rs.getString("image_main"))
					.build();
		}
		else {
			return null;
		}
	};
	
	//ResultSetExtractor 구매 전용
	private ResultSetExtractor<BuyListVO> buyExtractor = (rs) -> {
		if(rs.next()) {
			return BuyListVO.builder()
								.imageNo(rs.getInt("image_no"))
								.itemNo(rs.getInt("item_no"))
								.itemCate(rs.getString("cate_code"))
								.itemName(rs.getString("item_name"))
								.itemMemo(rs.getString("item_memo"))
								.itemContent(rs.getString("item_content"))
								.itemPrice(rs.getInt("item_price"))
								.itemColor(rs.getString("item_color"))
								.itemSize(rs.getString("item_size"))
								.itemTotalCnt(rs.getInt("item_total_cnt"))
								.itemLikeCnt(rs.getInt("item_like_cnt"))
								.itemDate(rs.getDate("item_date"))
								.imageMain(rs.getString("image_main"))
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
						+ "item_price) "
						+ "values(?, ?, ?, ?, ?, ?)";
		Object[] param = {
				itemDto.getItemNo(), itemDto.getItemCate(), 
				itemDto.getItemName(), itemDto.getItemMemo(), 
				itemDto.getItemContent(), itemDto.getItemPrice(), 
		};
		jdbcTemplate.update(sql, param);
	}

	//상품 목록
	@Override
	public List<BuyListVO> selectList() {
		String sql = "select * from ("
						+ "select tmp.*, rownum rn from("
							+ "select * from ("
								+ "select * from buy_list_view where image_main=1"
							+ ") order by item_date desc"
						+ ") tmp"
					+ ") where rn between 1 and 9";
		return jdbcTemplate.query(sql, buyListMapper);
	}
	
	
	//상품 검색
	@Override
	public List<ItemDto> selectList(String type, String keyword) {
		String sql = "select * from item where instr(#1, ?) > 0 order by #1 desc";
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
				itemDto.getItemName(), itemDto.getItemCate(), 
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
	
	//상품 검색+목록(회원용)
	@Override
	public List<BuyListVO> selectBuyList(ItemListSearchVO vo) {
		if(vo.isSearch()) {//검색이라면
			return buySearch(vo);
		}
		else {
			return buyList(vo);
		}
	}
	
	//main = 1 만 띄우는 상품 list
	@Override
	public List<BuyListVO> buyList(ItemListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select * from buy_list_view where image_main = 1 order by item_no desc "
				+ ")TMP"
			+") where rn between ? and ?";
		Object[] param = {vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, buyListMapper, param);
	}
	
	@Override
	public List<BuyListVO> buySearch(ItemListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select * from buy_list_view where instr(#1,?) > 0 and image_main = 1 "
					+ "order by item_no desc"
				+ ")TMP"
			+ ") where rn between ? and ?";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {
				vo.getKeyword(), vo.startRow(), vo.endRow()
		};
		return jdbcTemplate.query(sql, buyListMapper, param);
	}
	
	@Override
	public int buyCount(ItemListSearchVO vo) {
		if(vo.isSearch()) {//검색이라면
			return buySearchCount(vo);
		}
		else { //목록이라면
			return buyListCount(vo);
		}
	}
	
	@Override
	public int buyListCount(ItemListSearchVO vo) {
		String sql = "select count(*) from buy_list_view";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	@Override
	public int buySearchCount(ItemListSearchVO vo) {
		String sql = "select count(*) from buy_list_view where instr(#1, ?) > 0 ";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {vo.getKeyword()};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}
	
	//상품 상세 이미지를 위한 리스트
	@Override
	public List<BuyListVO> selectBuyList(int itemNo) {
		String sql = "select * from buy_list_view where item_no = ?";
		Object[] param = {itemNo};
		return jdbcTemplate.query(sql, buyListMapper, param);
	}
	
	@Override
	public BuyListVO selectBuyOne(int itemNo) {
		String sql = "select * from buy_list_view where item_no = ? and image_main = 1";
		Object[] param = {itemNo};
		return jdbcTemplate.query(sql, buyExtractor, param);
	}
	
	@Override
	public List<ItemListVO> selectItemList(int itemNo) {
		String sql = "select * from item_list_view where item_no = ?";
		Object[] param = {itemNo};
		return jdbcTemplate.query(sql, itemMapper, param);
	}

	@Override
	public ItemListVO selectItemOne(ItemListVO itemListVO) {
		String sql = "select * from item_list_view where item_no = ? and item_color = ? and item_size = ?";
		Object[] param = {
				itemListVO.getItemNo(), itemListVO.getItemColor(), itemListVO.getItemSize()
		};
		return jdbcTemplate.query(sql, itemExtractor, param);
	}
	
	
	//통합목록(관리자)
	@Override
	public List<ItemDto> selectList(ItemListSearchVO vo) {
		if(vo.isSearch()) {//검색이라면
			return search(vo);
		}
		else {
			return list(vo);
		}
	}

	//목록
	@Override
	public List<ItemDto> list(ItemListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select * from item order by item_no desc"
				+ ")TMP"
				+") where rn between ? and ?";
		Object[] param = {vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, mapper, param);
	}

	//검색
	@Override
	public List<ItemDto> search(ItemListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select * from item where instr(#1,?) > 0"
					+ "order by item_no desc"
				+ ")TMP"
				+ ") where rn between ? and ?";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {
				vo.getKeyword(), vo.startRow(), vo.endRow()
		};
		return jdbcTemplate.query(sql, mapper, param);
	}

	//카운트
	@Override
	public int count(ItemListSearchVO vo) {
		if(vo.isSearch()) {//검색이라면
			return searchCount(vo);
		}
		else { //목록이라면
			return listCount(vo);
		}
	}

	//검색 카운트
	@Override
	public int searchCount(ItemListSearchVO vo) {
		String sql = "select count(*) from item where instr(#1, ?) > 0";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {vo.getKeyword()};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}

	//목록 카운트
	@Override
	public int listCount(ItemListSearchVO vo) {
		String sql = "select count(*) from item";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	@Override
	public List<ItemDto> selectList(InvenListSearchVO vo) {
		String sql = "select * from item order by item_no desc";
		return jdbcTemplate.query(sql, mapper);
	}

	@Override
	public List<ItemDto> list(InvenListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select * from item order by item_no desc"
				+ ")TMP"
			+") where rn between ? and ?";
		Object[] param = {vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, mapper, param);
	}

	@Override
	public List<ItemDto> search(InvenListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select * from item where instr(#1,?) > 0"
					+ "order by item_no desc"
				+ ")TMP"
			+ ") where rn between ? and ?";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {
				vo.getKeyword(), vo.startRow(), vo.endRow()
		};
		return jdbcTemplate.query(sql, mapper, param);
	}

	@Override
	public int count(InvenListSearchVO vo) {
		if(vo.isSearch()) {//검색이라면
			return searchCount(vo);
		}
		else { //목록이라면
			return listCount(vo);
		}
	}

	@Override
	public int searchCount(InvenListSearchVO vo) {
		String sql = "select count(*) from item where instr(#1, ?) > 0";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {vo.getKeyword()};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}

	@Override
	public int listCount(InvenListSearchVO vo) {
		String sql = "select count(*) from item";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	
	@Override
	public List<ItemListVO> selectItemList(ItemListSearchVO vo) {
		if(vo.isSearch()) {//검색이라면
			return Itemsearch(vo);
		}
		else {
			return Itemlist(vo);
		}
	}

	@Override
	public List<ItemListVO> Itemlist(ItemListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select * from item_list_view where image_main = 1 order by item_no desc "
				+ ")TMP"
			+") where rn between ? and ?";
		Object[] param = {vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, itemMapper, param);
	}

	@Override
	public List<ItemListVO> Itemsearch(ItemListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select * from item_list_view where instr(#1,?) > 0 and image_main = 1 "
					+ "order by item_no desc"
				+ ")TMP"
			+ ") where rn between ? and ?";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {
				vo.getKeyword(), vo.startRow(), vo.endRow()
		};
		return jdbcTemplate.query(sql, itemMapper, param);
	}

}
