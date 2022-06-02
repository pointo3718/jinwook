package com.jinwook.home.service.board;

import java.util.List;

import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Recipe;

public interface BoardDao {

		// 게시판 등록(1:1문의, 공지사항, 상점후기)
		public int addBoard(Board board) throws Exception;
		
		// 게시판 수정(1:1문의, 공지사항)
		public int updateBoard(Board board) throws Exception;
		
		// 게시판 삭제(1:1문의, 공지사항)
		public int deleteBoard(int boardNo) throws Exception;
		
		//게시판 상세 조회
		public Recipe getBoard(int boardNo) throws Exception;
				
		//게시판 목록 조회 //인자로 무엇이 들어가야하나?
		public List<Board> getBoardList(int boardNo) throws Exception;
	
		//레시피 등록
		public int addRecipe(Recipe rcp) throws Exception;

		//레시피 수정
		public int updateRecipe(Recipe rcp) throws Exception;

		//레시피 삭제
		public int deleteRecipe(int rcpNo) throws Exception;
		
		//레시피 상세 조회
		public Recipe getRecipe(int rcpNo) throws Exception;
		
		//레시피 목록 조회 //인자로 무엇이 들어가야하나?
		public List<Recipe> getRecipeList(int rcpNo) throws Exception;
		
		//댓글, 답변 등록
		public void addComment(Board board) throws Exception;
		
		//댓글 수정
		public void updateComment(Board board) throws Exception;
}
