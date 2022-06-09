package com.jinwook.home.service.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Jjim {

	private Integer jjimNo;
	private Integer rcpNo;
	private Integer storeNo;
	private User user;
	private String userId;
	private Integer jjim_cnt;
	
//	private int boardNo;
//	private String jjimStatus;
	
	public Jjim() {
	}
	
}
