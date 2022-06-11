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
//	private User user;
//	private String userId;
//	private int rcpNo;
//	private int boardNo;
//	private String commentContent;//댓글 내용
//	private LocalDate commentDate;//등록날짜
//	private int recommendCount; //추천수
	
	private Integer commentNo;
	private User user;
	private String userId;
	private Board board;
	private Integer boardNo;
	private Recipe recipe;
	private Integer rcpNo;
	private String commentContent;
	private String commentWriter;
	private LocalDate commentDate;
	private Integer recommendCount;
	
	
}
