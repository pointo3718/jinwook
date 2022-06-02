package com.jinwook.home.service.board;

import java.util.List;

import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Recipe;

public interface BoardService {
	//레시피 등록
	public void addRecipe(Recipe rcp);

	//레시피 수정
	public void updateRecipe(Recipe rcp);

	//레시피 삭제
	public int deleteRecipe(int rcpNo);
	
	//레시피 상세 조회
	public Recipe getRecipe(int rcpNo);
	
	//레시피 목록 조회
	public List<Recipe> getRecipeList(int rcpNo);
	
	//게시판 등록
	public void addBoard(Board board);
	
	//게시판 수정
	public void updateBoard(Board  board);
	
	//게시판 삭제
	public int deleteBoard(int boardNo);
	
	//게시판 상세 조회
	public Board getBoard(int boardNo);
	
	//게시판 목록 조회
	public List<Board> getBoardList(int boardNo);
	
	//상점, 레시피, 댓글 랭킹 목록 조회
	public List<Board> getRankList(int boardNo);
	
	//댓글, 답변 등록
	public void addComment(Board board);
	
	//댓글 수정
	public void updateComment(Board board);
	
	//찜 등록
	public void addJjim(Board board);
	
	//찜 수정
	public void deleteJjim(Board board);
	
	//추천 등록
	public void addRecommemnd(Board board);
	
	//추천 수정
	public void deleteRecommemnd(Board board);
	
	//상점 후기 등록?????
	public void addReview(Recipe rcp);
	
	//상점 후기 목록 조회?????
	public List<Board> getListReview(int boardNo);
	
}
