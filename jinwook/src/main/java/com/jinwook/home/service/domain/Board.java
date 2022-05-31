package com.jinwook.home.service.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Board {

	private String userId;
	private int boardNo;
	private String boardWriter;
	private String boardTitle;
	private String boardContent;
	private int boardHits;
	private String boardCode;
	private Date writeDate;
	private String image;
	private String status;
	private int reviewStar;
	
	public Board() {
	}

}
