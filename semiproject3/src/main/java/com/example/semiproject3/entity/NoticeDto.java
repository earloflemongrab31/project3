package com.example.semiproject3.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class NoticeDto {
	
	private String adminId;
	private int noticeNo;
	private String noticeTitle;
	private Date noticeDate;
	private Date noticeUpdate;
	private int noticeRead;
	private String noticeContent;
	private String noticeHead;
	
}
