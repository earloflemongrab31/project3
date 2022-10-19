package com.example.semiproject3.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
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
				+ "notice_update,"
				+ "notice_read,"
				+ "notice_content,"
				+ "notice_head) "
				+ "values(?, ?, ?, sysdate, ?, ?, ?, ?)";
		
		Object[] param = {
				Dto.getAdminId(), Dto.getNoticeNo(), Dto.getNoticeTitle(),
				Dto.getNoticeDate(), Dto.getNoticeUpdate(), Dto.getNoticeRead(),
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
			Dto.setNotice
			return null;
		}
	};
	
	
	@Override
	public List<NoticeDto> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<NoticeDto> selectList(String type, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NoticeDto selectOne(int noticeNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(NoticeDto Dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int noticeNo) {
		// TODO Auto-generated method stub
		return false;
	}

	
}
