package com.jinwook.home.service.domain;

import java.time.LocalDate;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Board extends CommonDTO {

	private int boardNo;
	private User user;
	private String userId;
	private String boardTitle;
	private String boardContent;
	private int boardHits;
	private String boardCode;
	private LocalDate writeDate;
	private String boardImg1;
	private String boardImg2;
	private String boardImg3;
	private boolean boardInqStatus;
	private Comment comment;
	
	/** 파일 변경 여부 */
	private String changeYn;

	/** 파일 인덱스 리스트 */
	private List<Integer> attachNos;
	
	public Board() {
	}
	
}
