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

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//등록
	@Override
	public void insert(NoticeDto Dto) {
		String sql = "insert into notice("
				+ "admin_id,"
				+ "notice_no,"
				+ "notice_title,"
				+ "notice_date,"
				+ "notice_content,"
				+ "notice_head) "
				+ "values(?,notice_seq.nextval, ?, sysdate, ?, ?)";
		
		Object[] param = {
				Dto.getAdminId(), Dto.getNoticeTitle(),
				Dto.getNoticeContent(), Dto.getNoticeHead()
		};
		jdbcTemplate.update(sql, param);
	}

	//번호 
	@Override
	public int sequence() {
		String sql = "select notice_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	//로우매퍼
	private RowMapper<NoticeDto> mapper = new RowMapper<NoticeDto>() {

		@Override
		public NoticeDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			NoticeDto Dto = new NoticeDto();
			Dto.setAdminId(rs.getString("admin_id"));
			Dto.setNoticeNo(rs.getInt("notice_no"));
			Dto.setNoticeTitle(rs.getString("notice_title"));
			Dto.setNoticeDate(rs.getDate("notice_date"));
			Dto.setNoticeUpdate(rs.getDate("notice_update"));
			Dto.setNoticeContent(rs.getString("notice_content"));
			Dto.setNoticeHead(rs.getString("notice_head"));
			return Dto;
		}
	};
	
	private ResultSetExtractor<NoticeDto> extractor = new ResultSetExtractor<NoticeDto>() {

		@Override
		public NoticeDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				NoticeDto Dto = new NoticeDto();
				Dto.setAdminId(rs.getString("admin_id"));
				Dto.setNoticeNo(rs.getInt("notice_no"));
				Dto.setNoticeTitle(rs.getString("notice_title"));
				Dto.setNoticeDate(rs.getDate("notice_date"));
				Dto.setNoticeUpdate(rs.getDate("notice_update"));
				Dto.setNoticeContent(rs.getString("notice_content"));
				Dto.setNoticeHead(rs.getString("notice_head"));
				return Dto;
			}
			else {
				return null;
			}
		}
	};
	
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
	public boolean update(NoticeDto Dto) {
		String sql = "update notice "
				+ "set "
				+ "notice_head=?,"
				+ "notice_title=?,"
				+ "notice_content=?,"
				+ "notice_update=sysdate"
				+ "where"
				+ "notice_no=?";
		Object[] param= {
				Dto.getNoticeHead(), Dto.getNoticeTitle(),
				Dto.getNoticeContent(), Dto.getNoticeNo()
		};
		return jdbcTemplate.update(sql, param)>0;
	}

	@Override
	public boolean delete(int noticeNo) {
		String sql = "delete notice where notice_no=?";
		Object[] param = {noticeNo};
		return jdbcTemplate.update(sql, param)>0;
	}

	
}
