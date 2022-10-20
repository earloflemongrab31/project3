package com.example.semiproject3.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor

public class NoticeListVO {
	private int noticeNo;
	private String noticeTitle;
	private Date noticeDate, noticeUpdate;
	private int noticeRead;
	private String noticeContent, noticeHead;
}
