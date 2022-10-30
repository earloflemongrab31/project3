package com.example.semiproject3.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.MainEditDto;

@Repository
public class MainEditDaoImpl implements MainEditDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void update(MainEditDto mainEditDto) {
		String sql = "update main_edit "
						+ "set main_editor=?, main_content=?, search_holder=? "
					+ "where main_no=1";
		Object[] param = {
				mainEditDto.getMainEditor(), 
				mainEditDto.getMainContent(), 
				mainEditDto.getSearchHolder()
				};
		jdbcTemplate.update(sql, param);
	}

	private ResultSetExtractor<MainEditDto> extractor = (rs) ->{
		if(rs.next()) {
			return MainEditDto.builder()
						.mainNo(rs.getInt("main_no"))
						.mainEditor(rs.getString("main_editor"))
						.mainContent(rs.getString("main_content"))
						.mainTime(rs.getDate("main_time"))
						.searchHolder(rs.getString("search_holder"))
					.build();
		}
		else {
			return null;
		}
	};
	
	@Override
	public MainEditDto select() {
		String sql = "select * from main_edit";
		return jdbcTemplate.query(sql, extractor);
	}

	@Override
	public void insert(String loginId) {
		String sql = "insert into main_edit(main_no, main_editor) values(1, ?)";
		jdbcTemplate.update(sql, loginId);
	}
	
	
}
