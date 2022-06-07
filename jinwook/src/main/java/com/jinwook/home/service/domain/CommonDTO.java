package com.jinwook.home.service.domain;

import java.time.LocalDateTime;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.common.PaginationInfo;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class CommonDTO extends Criteria {

	/** 페이징 정보 */
	private PaginationInfo paginationInfo;

}