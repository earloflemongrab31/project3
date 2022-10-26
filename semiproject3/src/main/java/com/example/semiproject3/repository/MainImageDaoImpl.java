package com.example.semiproject3.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.MainImageDto;

@Repository
public class MainImageDaoImpl implements MainImageDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void insert(int imageNo, String imagePath) {
		String sql = "insert into main_image(main_no, image_no, image_path) values(1, ?, ?)";
		Object[] param = {imageNo, imagePath};
		jdbcTemplate.update(sql, param);
	}

	private RowMapper<MainImageDto> mapper = (rs,idx)->{
		return	MainImageDto.builder()
					.mainNo(rs.getInt("main_no"))
					.imageNo(rs.getInt("image_no"))
					.imagePath(rs.getString("image_path"))
				.build();
	};
	
//	private ResultSetExtractor<MainImageDto> extractor = (rs)->{
//		if(rs.next()) {
//			return	MainImageDto.builder()
//					.mainNo(rs.getInt("main_no"))
//					.imageNo(rs.getInt("image_no"))
//					.imagePath(rs.getString("image_path"))
//				.build();
//		}
//		else {
//			return null;
//		}
//	};
	
	@Override
	public List<MainImageDto> selectAll() {
		String sql = "select * from main_image";
		return jdbcTemplate.query(sql, mapper);
	}

}
