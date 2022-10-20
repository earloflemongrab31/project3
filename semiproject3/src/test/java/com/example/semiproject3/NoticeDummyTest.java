package com.example.semiproject3;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.semiproject3.entity.NoticeDto;
import com.example.semiproject3.repository.NoticeDao;

@SpringBootTest
public class NoticeDummyTest {

	@Autowired
	private NoticeDao noticeDao;
	
	@BeforeEach
	public void before() {
		noticeDao.clear();
	}
	
	@Test
	public void dummy() {
		for(int i = 1; i <= 7905; i++) {
			
			noticeDao.insert(NoticeDto.builder()
						.adminId("test2")
						.noticeTitle("테스트"+i)
						.noticeContent("테스트"+i)
						.noticeHead(null)
					.build());
		}
	}
	
}
