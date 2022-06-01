package com.jinwook.home.service.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Recipe {
	
	private int rcpNo;
	private String userId;
	private Date rcpDate;
	private String nickName;
	private String rcpTitle;
	private String rcpContent;
	private String rcpThumb;
	private String rcpInfo;
	private String rcpIngredient;
	private int rcpHits;
	private String rcpWriter;
	private int commentCount;
	
	public Recipe() {
	}
	
}
