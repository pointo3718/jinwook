package com.jinwook.home.service.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Recipe {
	
	private String userId;
	private int rcpNo;
	private String rcpWriter;
	private String rcpTitle;
	private String rcpContent;
	private int rcpHits;
	
	public Recipe() {
	}
	
}
