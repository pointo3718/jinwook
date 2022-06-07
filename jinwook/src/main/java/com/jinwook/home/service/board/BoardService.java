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
	
	public boolean addBoard(Board board);
	
	public boolean addBoard(Board board, MultipartFile[] files);
	
	public int updateBoard(Board board);
	
	public int deleteBoard(Integer boardNo);
	
	public Board getBoard(Integer boardNo);
	
	public List<Board> getBoardList(Board board);
	
	public Attach getAttachDetail(Integer attachNo);
	
	//파일 리스트를 조회
	public List<Attach> getAttachFileList(Integer boardNo);
	
	public List<Board> getRankList(Board board);
	
	public int addReview(Orders orders);
	
	public int deleteReview(int ordersNo);
	
	public List<Orders> getReviewList(Board board);
	
	public int addRecipe(Recipe rcp);
	
	public int updateRecipe(Recipe rcp);
	
	public int deleteRecipe(int rcpNo);
	
	public Recipe getRecipe(int rcpNo);
	
	public List<Recipe> getRecipeList(Board board);
	
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
