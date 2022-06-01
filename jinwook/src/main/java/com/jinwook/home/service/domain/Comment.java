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
	private int rcpNo;
	private String userId;
	private String commentContent;
	private Date commentDate;
	private String commentWriter;
	private int recommendCount;
	
	public Comment() {
	}
	
}
