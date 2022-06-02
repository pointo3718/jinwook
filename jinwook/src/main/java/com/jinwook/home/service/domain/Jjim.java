package com.jinwook.home.service.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Jjim {

	private int jjimNo;
	private String userId;
	private int rcpNo;
	private int boardNo;
	private int storeNo;
	private String jjimStatus;
	
	public Jjim() {
	}
	
}
