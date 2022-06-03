package com.jinwook.home.service.domain;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Comment {

//	private int commentNo;//댓글번호
//	private String userId;
//	private User user;
//	private int rcpNo;
//	private int boardNo;
//	private String commentContent;//댓글 내용
//	private LocalDate commentDate;//등록날짜
//	private int recommendCount; //추천수
	
	private int commentNo;
	private User user;
	private int boardNo;
	private int rcpNo;
	private String commentContent;
	private String commentWriter;
	private LocalDate commentDate;
	
	
}
