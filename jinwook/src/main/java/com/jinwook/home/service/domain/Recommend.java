package com.jinwook.home.service.domain;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Recommend {

	private Integer recommendNo;
	private Integer commentNo;
	private Integer rcpNo;
	private String userId;
	private User user;
	private Integer recocheck;
	private LocalDate recoDate;
	private Integer recommendCount;
	
	public Recommend() {
	}
}
