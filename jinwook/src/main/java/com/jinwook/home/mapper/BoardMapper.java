package com.jinwook.home.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Recipe;

@Mapper
public interface BoardMapper {
	//게시글 등록
	public int addBoard(Board board);

	//게시글 수정
	public int updateBoard(Board board);

	//게시글 삭제
	public int deleteBoard(int boardNo);
	
	//게시글 상세 조회
	public Board getBoard(int boardNo);

	//게시글 목록 조회???
	public List<Board> getBoardList(Board board);

	// 레시피 등록
	public int addRecipe(Recipe rcp);

	// 레시피 수정
	public int updateRecipe(Recipe rcp);

	// 레시피 삭제
	public int deleteRecipe(int rcpNo);

	// 레시피 상세 조회
	public Recipe getRecipe(int rcpNo);

	// 레시피 목록 조회???
	public List<Recipe> getRecipeList(int rcpNo);
	
	//댓글, 답변 등록
	public void addComment(Board board);
	
	//댓글 수정
	public void updateComment(Board board);
	
	// 게시글 페이징 처리
	public int selectBoardTotalCount(Board board);
}
