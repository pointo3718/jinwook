package com.jinwook.home.service.board;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;

import com.jinwook.home.service.domain.Attach;
import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Comment;
import com.jinwook.home.service.domain.Jjim;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Recipe;

public interface BoardService {
	
	//레시피 조회수 증가v
	public int updateBoardRecipeHits(Integer rcpNo);
	//1:1문의 조회수 증가v
	public int updateBoardInquiryHits(Integer boardNo);
	//공지사항 조회수 증가v
	public int updateBoardAnnouncementHits(Integer boardNo);
	//1:1문의 등록v
	public boolean addBoardInquiry(Board board);
	//1:1문의 등록 + 사진 첨부v
	public boolean addBoardInquiry(Board board, MultipartFile[] files);
	//1:1문의 등록v
	public boolean addBoardAnnouncement(Board board);
	//1:1문의 등록 + 사진 첨부v
	public boolean addBoardAnnouncement(Board board, MultipartFile[] files);
	//1:1문의 수정v
	public int updateBoardInquiry(Board board);
	//공지사항 수정v
	public int updateBoardAnnouncement(Board board);
	//1:1문의 삭제v
	public int deleteBoardInquiry(Integer boardNo);
	//공지사항 삭제v
	public int deleteBoardAnnouncement(Integer boardNo);
	//1:1문의 상세 조회v
	public Board getBoardInquiry(Integer boardNo);
	//공지사항 상세 조회v
	public Board getBoardAnnouncement(Integer boardNo);
	//1:1문의 목록 조회v
	public List<Board> getBoardInquiryList(Board board);
	//공지사항 목록 조회v
	public List<Board> getBoardAnnouncementList(Board board);
	
	//파일 상세 조회?
	public Attach getAttachDetail(Integer attachNo);
	//파일 리스트를 조회?
	public List<Attach> getAttachFileList(Integer boardNo);
	//랭킹 리스트 조회?
	public List<Board> getRankList(Board board);

	//상점후기 등록v, 삭제v, 목록v
	public int addReview(Orders orders);
	public int deleteReview(int ordersNo);
	public Orders getReview(int ordersNo);
	//상점후기가 상점 상세에 달려 있는 형태이므로 목록이 따로 존재하진 않음.
	public List<Orders> getReviewList(Board board);
	
	//레시피 등록v
	public int addRecipe(Recipe rcp);
	//레시피 수정v
	public int updateRecipe(Recipe rcp);
	//레시피 삭제v
	public int deleteRecipe(Integer rcpNo);
	//레시피 상세 조회v
	public Recipe getRecipe(Integer rcpNo);
	//레시피 목록 조회v
	public List<Recipe> getRecipeList(Recipe rcp);
	
	//댓글 등록이면서 수정, 삭제, 목록조회
	public boolean addComment(Comment comment);
	public int deleteComment(Integer commentNo);
	public List<Comment> getCommentList(Comment comment);
	
	// 찜
	public void addStoreJjim(Jjim jjim);

	public void addRecipeJjim(Jjim jjim);

	public void deleteStoreJjim(Jjim jjim);

	public void deleteRecipeJjim(Jjim jjim);

	public void updateStoreJjim(int storeNo);

	public void updateRecipeJjim(int rcpNo);

	public int getRecipeJjim(Jjim jjim);

	public int getStoreJjim(Jjim jjim);
	
	// 레시피 추천
	public void updateRecipeReco(int rcpNo);
	// 댓글 추천
	public void updateCommentReco(int commentNo);
	// 레시피 추천 취소
	public void updateRecipeRecoCancel(int rcpNo);
	// 댓글 추천 취소
	public void updateCommentRecoCancel(int commentNo);
	// 레시피 추천 테이블에 add
	public void addRecipeReco(int rcpNo, String userId);
	// 댓글 추천 테이블에 add
	public void addCommentReco(int commentNo, String userId);
	// 레시피 추천 테이블에서 delete
	public void deleteRecipeReco(int rcpNo, String userId);
	// 댓글 추천 테이블에서 delete
	public void deleteCommentReco(int commentNo, String userId);
	// 레시피 추천 시 recocheck를 1로 만들어서 중복방지
	public void updateRecipeRecoCheck(int rcpNo, String userId);
	// 댓글 추천 시 recocheck를 1로 만들어서 중복방지
	public void updateCommentRecoCheck(int commentNo, String userId);
	// 레시피 추천취소 시 다시 0
	public void updateRecipeRecoCheckCancel(int rcpNo, String userId);
	// 댓글 추천취소 시 다시 0
	public void updateCommentRecoCheckCancel(int commentNo, String userId);
	// 레시피 추천 중복방지 select문
	public int recipeRecoCheck(int rcpNo, String userId);
	// 댓글 추천 중복방지 select문
	public int commentRecoCheck(int commentNo, String userId);

}
