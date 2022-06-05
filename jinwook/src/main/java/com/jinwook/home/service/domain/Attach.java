package com.jinwook.home.service.domain;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Attach {

	/** 파일 번호 (PK) */
	private Integer attachNo;

	/** 게시글 번호 (FK) */
	private Integer boardNo;
	
	/** 주문 번호 (FK) */
	private Integer orderNo;

	/** 원본 파일명 */
	private String originalName;

	/** 저장 파일명 */
	private String saveName;

	/** 파일 크기 */
	private Integer size;
	
	/** 파일 삭제 여부 */
	private String deleteYn;

	/** 파일 등록일 */
	private LocalDateTime insertTime;

	/** 파일 삭제일 */
	private LocalDateTime deleteTime;

}
