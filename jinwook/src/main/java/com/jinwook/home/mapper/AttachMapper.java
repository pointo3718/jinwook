package com.jinwook.home.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.service.domain.Attach;

@Mapper
public interface AttachMapper {
	
	//파일 등록
	public int addAttach(List<Attach> attachList);

	//파일 상세 조회 - 다운로드 처리에 필요
	public Attach getAttach(Integer attachNo);

	//파일 삭제
	public int deleteAttach(Integer boardNo);

	//파일 목록 조회
	public List<Attach> getAttachList(Integer boardNo);

	//특정 게시글에 포함된 파일 개수를 조회하는 SELECT 쿼리
	public int getAttachTotalCount(Integer boardNo);
}
