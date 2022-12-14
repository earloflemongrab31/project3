package com.example.semiproject3.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.ReportDto;
import com.example.semiproject3.entity.ReviewDto;
import com.example.semiproject3.vo.ReviewListSearchVO;

@Repository
public class ReportDaoImpl implements ReportDao{
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	//입력
	@Override
	public void insert(ReportDto reportDto) {
		String sql="insert into report values(report_seq.nextval,?,?,?,?,sysdate,?)";
		Object[] param= {
				reportDto.getCustomerId(),
				reportDto.getReviewContent(),
				reportDto.getReportRadio(),
				reportDto.getReportContent(),
				reportDto.getWho()
		};
		jdbcTemplate.update(sql,param);
		
	}

	//RowMapper
	private RowMapper <ReportDto> mapper = (rs, idx) -> {
		return ReportDto.builder()
				.reportNo(rs.getInt("report_no"))
				.customerId(rs.getString("customer_id"))
				.reviewContent(rs.getString("review_content"))
				.reportRadio(rs.getString("report_radio"))
				.reportDate(rs.getDate("report_date"))
				.reportContent(rs.getString("report_content"))
				.who(rs.getString("who"))
				.build();
	};
	
	//목록
	@Override
	public List<ReportDto> selectList() {
		String sql = "select * from report order by report_no desc";
		return jdbcTemplate.query(sql, mapper);
	}

	//검색 키워드 목록
	@Override
	public List<ReportDto> selectList(String type, String keyword) {
		String sql = "select * from report where instr(#1, ?) > 0 order by #1 desc";
		sql = sql.replace("#1", type);
		Object[] param = {keyword};
		return jdbcTemplate.query(sql, mapper, param);
	}

	//페이징 처리
	@Override
	public List<ReportDto> selectList(ReviewListSearchVO vo) {
		if(vo.isSearch()) {
			return search(vo);
		}
		else {
			return list(vo);
		}
	}

	@Override
	public List<ReportDto> list(ReviewListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from("
					+ "select * from report order by report_no desc"
				+ ")TMP"
			+ ") where rn between ? and ?";
		Object[] param = {vo.startRow(), vo.endRow()};
		return jdbcTemplate.query(sql, mapper, param);
	}

	@Override
	public List<ReportDto> search(ReviewListSearchVO vo) {
		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select * from report where instr(#1,?) > 0 "
					+ "order by report_no desc"
				+ ")TMP"
			+ ") where rn between ? and ?";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {
				vo.getKeyword(), vo.startRow(), vo.endRow()
	};
	return jdbcTemplate.query(sql, mapper, param);
}
	@Override
	public int count(ReviewListSearchVO vo) {
			if(vo.isSearch()) {
				return searchCount(vo);
			}
			else {
				return listCount(vo);
			}
	}

	@Override
	public int searchCount(ReviewListSearchVO vo) {
		String sql = "select count(*) from report where instr(#1, ?) > 0";
		sql = sql.replace("#1", vo.getType());
		Object[] param = {vo.getKeyword()};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}

	@Override
	public int listCount(ReviewListSearchVO vo) {
		String sql = "select count(*) from report";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
}
