package com.jinwook.home.service.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Recommend {

	private int recommendNo;
	private Comment commentNo;
	private int rcpNo;
	private User userId;
	
	public Recommend() {
	}
}
