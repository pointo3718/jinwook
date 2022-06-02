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
	
	//상점 후기 등록
	public void addReview(Recipe rcp);
	
	//상점 후기 목록 조회
	public List<Board> getListReview(int boardNo);
	
	//상점, 레시피, 댓글 랭킹 목록 조회
	public List<Board> getRankList(int boardNo);
	
	//1:1문의 등록
	public void addInquiry(Board board);
	
	//1:1문의 수정
	public void updateInquiry(Board board);
	
	//1:1문의 삭제
	public int deleteInquiry(int boardNo);
	
	//1:1문의 목록 조회
	public List<Board> getInquiryList(int boardNo);
	
	//1:1문의 상세 조회
	public Board getInquiry(int rcpNo);
	
	//공지사항 등록
	public void addAnouncement(Board board);
	
	//공지사항 수정
	public void updateAnouncement(Board board);
	
	//공지사항 삭제
	public int deleteAnouncement(int boardNo);
	
	//공지사항 목록 조회
	public List<Board> getAnnouncementList(int boardNo);
	
	//공지사항 상세 조회
	public Board getAnnouncement(int rcpNo);
	
	//댓글, 답변 등록
	public void addComment(Board board);
	
	//댓글 수정
	public void updateComment(Board board);
	
}
