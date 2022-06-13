package com.jinwook.home.service.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FileVO {
	 	private int fileNo;
	    private int boardNo;
	    private String fileName;     //저장할 파일
	    private String fileOriName;  //실제 파일
	    private String fileUrl;
}
