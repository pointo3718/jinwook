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
	private String board_image1;
	private String board_image2;
	private String board_image3;
	private String board_inq_status;
	
	public Board() {
	}

}
