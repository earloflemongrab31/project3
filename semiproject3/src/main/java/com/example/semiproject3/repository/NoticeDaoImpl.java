package com.example.semiproject3.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.NoticeDto;
import com.example.semiproject3.vo.NoticeListSearchVO;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//로우매퍼
	private RowMapper<NoticeDto> mapper = new RowMapper<NoticeDto>() {

		@Override
		public NoticeDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			NoticeDto noticeDto = new NoticeDto();
			noticeDto.setAdminId(rs.getString("admin_id"));
			noticeDto.setNoticeNo(rs.getInt("notice_no"));
			noticeDto.setNoticeTitle(rs.getString("notice_title"));
			noticeDto.setNoticeDate(rs.getDate("notice_date"));
			noticeDto.setNoticeUpdate(rs.getDate("notice_update"));
			noticeDto.setNoticeContent(rs.getString("notice_content"));
			noticeDto.setNoticeHead(rs.getString("notice_head"));
			return noticeDto;
		}
	};
		
		
	//리절트셋
	private ResultSetExtractor<NoticeDto> extractor = new ResultSetExtractor<NoticeDto>() {

		@Override
		public NoticeDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				NoticeDto noticeDto = new NoticeDto();
				noticeDto.setAdminId(rs.getString("admin_id"));
				noticeDto.setNoticeNo(rs.getInt("notice_no"));
				noticeDto.setNoticeTitle(rs.getString("notice_title"));
				noticeDto.setNoticeDate(rs.getDate("notice_date"));
				noticeDto.setNoticeUpdate(rs.getDate("notice_update"));
				noticeDto.setNoticeContent(rs.getString("notice_content"));
				noticeDto.setNoticeHead(rs.getString("notice_head"));
				return noticeDto;
			}
			else {
				return null;
			}
		}
	};

	//등록
	@Override
	public void insert(NoticeDto noticeDto) {
		String sql = "insert into notice("
				+ "admin_id,"
				+ "notice_no,"
				+ "notice_title,"
				+ "notice_date,"
				+ "notice_content,"
				+ "notice_head) "
				+ "values(?,notice_seq.nextval, ?, sysdate, ?, ?)";

		Object[] param = {
				noticeDto.getAdminId(), noticeDto.getNoticeTitle(),
				noticeDto.getNoticeContent(), noticeDto.getNoticeHead()
		};
		jdbcTemplate.update(sql, param);
	}
	
	@Override
	public int insert2(NoticeDto noticeDto) {
		//번호를 미리 생성한 뒤 등록하는 기능
		String sql = "select notice_seq.nextval from dual";
		int noticeNo = jdbcTemplate.queryForObject(sql, int.class);
		
		sql = "insert into notice("
				+ "admin_id,"
				+ "notice_no,"
				+ "notice_title,"
				+ "notice_content,"
				+ "notice_head) "
				+ "values(?,?,?,?,?)";
		Object[] param = {
				noticeDto.getAdminId(), 
				noticeNo,
				noticeDto.getNoticeTitle(),
				noticeDto.getNoticeContent(),
				noticeDto.getNoticeHead()};
		jdbcTemplate.update(sql,param);
		return noticeNo;
	}
		

	//번호 
	@Override
	public int sequence() {
		String sql = "select notice_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	
	
	//목록
	@Override
	public List<NoticeDto> selectList() {
		String sql = "select * from notice order by notice_no desc";
		return jdbcTemplate.query(sql, mapper);
	}

	@Override
	public List<NoticeDto> selectList(String type, String keyword) {
		String sql = "select * from notice where instr(#1, ?) > 0 order by notice_no desc";
		sql = sql.replace("#1", type);
		Object[] param = {keyword};
		return jdbcTemplate.query(sql, mapper, param);
	}

	@Override
	public NoticeDto selectOne(int noticeNo) {
		String sql = "select * from notice where notice_no=?";
		Object[] param = {noticeNo};
		return jdbcTemplate.query(sql, extractor, param);
	}

	
	@Override
	public boolean update(NoticeDto noticeDto) {
		String sql = "update notice set notice_title=?, notice_content=?, notice_head=?, notice_update=sysdate where notice_no=?";
		Object[]param = {noticeDto.getNoticeTitle(), noticeDto.getNoticeContent(), noticeDto.getNoticeHead(), noticeDto.getNoticeNo()};
		return jdbcTemplate.update(sql,param)>0;
		}

	@Override
	public boolean delete(int noticeNo) {
		String sql = "delete notice where notice_no=?";
		Object[] param = {noticeNo};
		return jdbcTemplate.update(sql, param)>0;
	}

	//조회수 중복 방지 처리
	@Override
	public NoticeDto read(int noticeNo) {
		this.updateReadcount(noticeNo);
		return this.selectOne(noticeNo);
	}

	//조회수 중복 방지 처리
	@Override
	public boolean updateReadcount(int noticeNo) {
		String sql = "update notice "
				+ "set notice_read = notice_read + 1 "
				+ "where notice_no = ?";
		Object[] param = {noticeNo};
		return jdbcTemplate.update(sql, param) > 0;
	}

	//카운트
	@Override
	public int count(NoticeListSearchVO vo) {
		if(vo.isSearch()) { //검색이라면
			return searchCount(vo);
		}
		else { //목록이라면
			return listCount(vo);
		}
	}

	//리스트카운트
	@Override
	public int listCount(NoticeListSearchVO vo) {
		String sql = "select count(*) from notice";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	//서치카운트
	@Override
	public int searchCount(NoticeListSearchVO vo) {
		String sql = "select count(*) from notice where instr(#1, ?) > 0";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {vo.getKeyword()};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}

	@Override
	public List<NoticeDto> selectList(NoticeListSearchVO vo) {
		if(vo.isSearch()) {//검색이라면
			return search(vo);
		}
		else {
			return list(vo);
		}
	}

	@Override
	public List<NoticeDto> list(NoticeListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select * from notice order by notice_no desc"
				+ ")TMP "
			+") where rn between ? and ?";
		Object[] param = {vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, mapper, param);
	}

	@Override
	public List<NoticeDto> search(NoticeListSearchVO vo) {
		String sql = "select * from ("
				+ "select * from notice "
				+ "where instr(#1, ?) > 0 "
				+ "order by notice_no desc"
			+ ")TMP"
		+ ") where rn between ? and ?";		
		sql = sql.replace("#1", vo.getType());
		Object[] param = {
				vo.getKeyword(), vo.startRow(), vo.endRow()
		};
		return jdbcTemplate.query(sql, mapper, param);
	}

	
	//더미 테스트용 클리어
	@Override
	public void clear() {
		String sql = "delete notice";
		jdbcTemplate.update(sql);
	}

}


