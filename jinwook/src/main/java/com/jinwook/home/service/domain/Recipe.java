package com.jinwook.home.service.domain;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Recipe {
	
	private int rcpNo;
//	private String userId;
	private User user;
//	private int rcpSeqNo;
	private String rcpTitle;
	private String rcpContent;
	private LocalDate rcpDate;
	private String rcpThumb;
	private String rcpInfo;
	private String rcpIngredient;
	private int rcpHits;
	private int commentCount;
	private int recommendCount;
	
	public Recipe() {
	}
	
}
