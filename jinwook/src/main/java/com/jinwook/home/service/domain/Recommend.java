package com.jinwook.home.service.domain;

import java.time.LocalDate;

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
	private String userId;
	private int recocheck;
	private LocalDate recoDate;
	private int recommendCount;
	
	public Recommend() {
	}
}
