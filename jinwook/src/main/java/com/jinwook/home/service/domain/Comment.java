package com.jinwook.home.service.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Comment {

	private int boardNo;
	private int commentNo;
	private String userId;
	private String commentWriter;
	private String commentContent;
	private int recommendCount;
	private Date commentDate;
	
	public Comment() {
	}
	
}
