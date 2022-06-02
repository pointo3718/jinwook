package com.jinwook.home.service.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Comment {

	private int commentNo;
//	private String userId;
	private User userId;
	private int rcpNo;
	private int boardNo;
	private String commentContent;
	private Date commentDate;
	private int recommendCount;
	
	public Comment() {
	}
	
}
