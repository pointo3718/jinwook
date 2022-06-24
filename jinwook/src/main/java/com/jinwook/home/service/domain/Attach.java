package com.jinwook.home.service.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Attach {
	private int attachNo;
	private int boardNo;
	private int rcpNo;
	private int orderNo;
	private int storeNo;
	
	private String orgFileName;
	private String storedFileName;
	private int fileSize;
	private Date regDate;
	private String delGb;
}
