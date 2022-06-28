package com.jinwook.home.service.domain;

import java.sql.Date;
import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;

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
	
	private int commentNo;//댓글 번호v
	private User user;
	private String userId;
	private Board board;//게시판 번호
	private int boardNo;
	private Recipe recipe;
	private Orders orders;
	private int rcpNo;//레시피 번호
	private int orderNo;//주문 번호
	private String commentContent;//댓글 내용
	private String commentWriter;//댓글 작성자
	private int recommendCount;
	private Date commentDate;//댓글 작성날짜
	
	
}
