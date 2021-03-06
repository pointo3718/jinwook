package com.jinwook.home.service.domain;

import java.util.Date;

import org.springframework.http.ResponseEntity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class User extends CommonDTO {
	
	private String userId;
	private String userName;
	private String password;
	private String email;
	private String birth;
	private String nickName;
	private String phone;
	private String rpId;
	private String businessNo;
	private String role;
	private String grade;
	private int jpBalance;
	private String jpPassword;
	private Date regDate;
	private Date blacklistRegDate;
	private Date blacklistEndDate;
	private boolean noticeStatus;
	private boolean blacklistStatus;
	private boolean userByeStatus;
	private String gender;
	private String blackPeriod;
	private String complainCode;
	private Store store;
	private int authNumber;
	private ResponseEntity<Object> res;
	private boolean storeYn;
	private int cnt;
}
