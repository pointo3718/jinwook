package com.jinwook.home.service.domain;

import java.sql.Date;
import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Recipe extends CommonDTO {
	
	private int rcpNo;
	private String userId;
	private User user;
//	private int rcpSeqNo;
	private Attach attach;
	private String rcpTitle;
	private String rcpContent;
	private Date rcpDate;
	private String rcpThumb;//레시피 썸네일 사진
	private String rcpInfo;
	private String rcpIngredient;
	private Integer rcpHits;
	private Integer rcpJjimCnt;
	private Integer commentCount;
	private Integer recommendCount;
	
	private Comment comment;

	public Recipe() {
	}

	
	
	
}