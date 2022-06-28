package com.jinwook.home.service.domain;

import java.io.File;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//객체 빼고 다 써줌.
public class Board extends CommonDTO {

	private int boardNo;
	private Attach attach;//첨부 파일 조회를 위한 attach 객체
	private User user;
	private String userId;
	private String boardTitle;
	private String boardContent;
	private int boardHits;
	private String boardCode;
	private Date writeDate;
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
