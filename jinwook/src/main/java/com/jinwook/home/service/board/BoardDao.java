package com.jinwook.home.service.board;

import java.util.List;

import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Recipe;

public interface BoardDao {

		//레시피 등록
		public void addRecipe(Recipe rcp) throws Exception;

		//레시피 수정
		public void updateRecipe(Recipe rcp) throws Exception;

		//레시피 삭제
		public void deleteRecipe(int rcpNo) throws Exception;
		
		//레시피 상세 조회
		public Recipe getRecipe(int rcpNo) throws Exception;
		
		//레시피 목록 조회 //인자로 무엇이 들어가야하나?
		public List<Recipe> getRecipeList(int rcpNo) throws Exception;
		
		//상점 후기 등록
		public void addReview(Board board) throws Exception;
		
		//상점 후기 목록 조회
		public List<Board> getReviewList(int boardNo) throws Exception;
		
		//상점, 레시피, 댓글 랭킹 목록 조회 //인자로 무엇이 들어가야하나?
		public List<Board> getRankList(int boardNo) throws Exception;
		
		//1:1문의 등록
		public void addInquiry(Board board) throws Exception;
		
		//1:1문의 수정
		public void updateInquiry(Board board) throws Exception;
		
		//1:1문의 삭제
		public void deleteInquiry(int boardNo) throws Exception;
		
		//1:1문의 목록 조회 //인자로 무엇이 들어가야하나?
		public List<Board> getInquiryList(int boardNo) throws Exception;
		
		//1:1문의 상세 조회
		public Board getInquiry(int rcpNo) throws Exception;
		
		//공지사항 등록
		public void addAnouncement(Board board) throws Exception;
		
		//공지사항 수정
		public void updateAnouncement(Board board) throws Exception;
		
		//공지사항 삭제
		public void deleteAnouncement(int boardNo) throws Exception;
		
		//공지사항 목록 조회 //인자로 무엇이 들어가야하나?
		public List<Board> getAnnouncementList(int boardNo) throws Exception;
		
		//공지사항 상세 조회
		public Board getAnnouncement(Board board) throws Exception;
		
		//댓글, 답변 등록
		public void addComment(Board board) throws Exception;
		
		//댓글 수정
		public void updateComment(Board board) throws Exception;
}
