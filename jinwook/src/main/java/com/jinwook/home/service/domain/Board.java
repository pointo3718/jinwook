package com.jinwook.home.service.domain;

import java.time.LocalDate;

import com.jinwook.home.common.PaginationInfo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Board {

	private Integer boardNo;
	//private String userId;
	private User user;
	private String boardTitle;
	private String boardContent;
	private int boardHits;
	private String boardCode;
	private LocalDate writeDate;
	private String boardImg1;
	private String boardImg2;
	private String boardImg3;
	private String boardInqStatus;
	
	public Board() {
	}
	
}
