package com.jinwook.home.service.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Jjim {

	private Integer jjimNo;
	private User user;
	private Integer rcpNo;
	private Integer storeNo;
	private String userId;
//	private int boardNo;
//	private String jjimStatus;
	
	public Jjim() {
	}
	
}
