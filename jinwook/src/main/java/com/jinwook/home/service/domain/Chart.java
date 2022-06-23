package com.jinwook.home.service.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Chart {

	private String ym;
	private int count;
	private int userCount;
	private int ceoCount;
	private int adminCount;
	private int sumPrice;
	private int blacklistCount;
	private int byeUserCount;
	
	
}
