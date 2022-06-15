package com.jinwook.home.service.board;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;

import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Comment;
import com.jinwook.home.service.domain.FileVO;
import com.jinwook.home.service.domain.Jjim;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Recipe;
import com.jinwook.home.service.domain.User;

public interface BoardService {
	
	//레시피 조회수 증가v
	public int updateBoardRecipeHits(Integer rcpNo);
	//1:1문의 조회수 증가v
	public int updateBoardInquiryHits(Integer boardNo);
	//공지사항 조회수 증가v
	public int updateBoardAnnouncementHits(Integer boardNo);
	
	//다중 사진 첨부v
	public int fileInsert(FileVO file) throws Exception;

	//1:1문의 등록v
	public void addBoardInquiry(Board board) throws Exception;
	//공지사항 등록v
	public void addBoardAnnouncement(Board board);
	//1:1문의 수정v
	public void updateBoardInquiry(Board board) throws Exception;
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
	public void updateRecipe(Recipe rcp);
	//레시피 삭제v
	public int deleteRecipe(Integer rcpNo);
	//레시피 상세 조회v
	public Recipe getRecipe(Integer rcpNo);
	//레시피 목록 조회v
	public List<Recipe> getRecipeList(Recipe rcp);
	
	//댓글 등록v이면서 수정v, 삭제v, 목록조회v
//	public boolean addComment(Comment comment);
//	public int deleteComment(Integer commentNo);
//	public List<Comment> getCommentList(Comment comment);
	
	//댓글 조회
	public List<Comment> getComment(int boardNo) throws Exception;
	//댓글 등록
	public void addComment(Comment comment) throws Exception;
	//답변 상태 변화
	public boolean updateBoardInqStatus(Board board);
	
	// 찜
	public boolean addStoreJjim(Jjim jjim);
	public boolean addRecipeJjim(Jjim jjim);

	public int deleteStoreJjim(Jjim jjim);
	public int deleteRecipeJjim(Jjim jjim);

	public void updateStoreJjim(int storeNo);
	public void updateRecipeJjim(int rcpNo);

	public int getRecipeJjim(Jjim jjim);
	public int getStoreJjim(Jjim jjim);
	
	// 레시피 추천
	public int updateRecipeReco(int rcpNo);
	// 댓글 추천
	public void updateCommentReco(int commentNo);
	// 레시피 추천 취소
	public void updateRecipeRecoCancel(int rcpNo);
	// 댓글 추천 취소
	public void updateCommentRecoCancel(int commentNo);
	// 레시피 추천 테이블에 add
	public int addRecipeReco(int rcpNo, String userId);
	// 댓글 추천 테이블에 add
	public void addCommentReco(int commentNo, String userId);
	// 레시피 추천 테이블에서 delete
	public void deleteRecipeReco(int rcpNo, String userId);
	// 댓글 추천 테이블에서 delete
	public void deleteCommentReco(int commentNo, String userId);
	// 레시피 추천 시 recocheck를 1로 만들어서 중복방지
	public int updateRecipeRecoCheck(int rcpNo, String userId);
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
