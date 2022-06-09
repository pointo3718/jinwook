package com.jinwook.home.service.domain;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Recipe extends CommonDTO {
	
	private Integer rcpNo;
	private String userId;
	private User user;
//	private int rcpSeqNo;
	private String rcpTitle;
	private String rcpContent;
	private LocalDate rcpDate;
	private String rcpThumb;
	private String rcpInfo;
	private String rcpIngredient;
	private Integer rcpHits;
	private Integer rcpJjimCnt;
	private Integer commentCount;
	private Integer recommendCount;

	public Recipe() {
	}

	
	
	
}