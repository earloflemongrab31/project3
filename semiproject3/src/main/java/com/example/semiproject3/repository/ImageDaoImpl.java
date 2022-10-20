package com.example.semiproject3.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.example.semiproject3.entity.ImageDto;

@Repository
public class ImageDaoImpl implements ImageDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//RowMapper
	private RowMapper<ImageDto> mapper = (rs, idx) -> {
		return ImageDto.builder()
							.imageNo(rs.getInt("image_no"))
							.imageName(rs.getString("image_name"))
							.imageType(rs.getString("image_type"))
							.imageSize(rs.getLong("image_size"))
							.imageTime(rs.getDate("image_time"))
						.build();
	};
	
	//ResultSetExtractor
	private ResultSetExtractor<ImageDto> extractor = (rs)->{
		if(rs.next()) {
			return ImageDto.builder()
					.imageNo(rs.getInt("image_no"))
					.imageName(rs.getString("image_name"))
					.imageType(rs.getString("image_type"))
					.imageSize(rs.getLong("image_size"))
					.imageTime(rs.getDate("image_time"))
				.build();
		}
		else {
			return null;
		}
	};
	
	//번호 생성
	@Override
	public int sequence() {
		String sql = "select image_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	//이미지 등록
	@Override
	public void insert(ImageDto imageDto) {
		String sql = "insert into image("
				+ "image_no, image_name, image_type, image_size"
				+ ") values(?, ?, ?, ?)";
		Object[] param = {
				imageDto.getImageNo(), imageDto.getImageName(), 
				imageDto.getImageType(), imageDto.getImageSize()};
		jdbcTemplate.update(sql, param);
	}
	
	//이미지 목록
	@Override
	public List<ImageDto> selectList() {
		String sql = "select * from image";
		return jdbcTemplate.query(sql, mapper);
	}
	
	//이미지 정보
	@Override
	public ImageDto selectOne(int imageNo) {
		String sql = "select * from image where image_no = ?";
		Object[] param = {imageNo};
		return jdbcTemplate.query(sql, extractor, param);
	}
	
	//이미지 삭제
	@Override
	public boolean delete(int imageNo) {
		String sql = "delete image where image_no = ?";
		Object[] param = {imageNo};
		return jdbcTemplate.update(sql, param) > 0;
	}

}
