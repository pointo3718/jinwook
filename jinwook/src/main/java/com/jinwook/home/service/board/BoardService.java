package com.jinwook.home.service.board;

import java.util.List;
import java.util.Map;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Comment;
import com.jinwook.home.service.domain.Jjim;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Recipe;
import com.jinwook.home.service.domain.User;

public interface BoardService {
	
	public int addBoard(Board board);
	
	public int updateBoard(Board board);
	
	public int deleteBoard(int boardNo);
	
	public Board getBoard(int boardNo);
	
	public List<Board> getBoardList(Board board);
	
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

	public void deleteComment(Comment comment);
	
	public List<Comment> getCommentList(int boardNo);
	
	// 찜
	public void addStoreJjim(Jjim jjim);

	public void addRecipeJjim(Jjim jjim);

	public void deleteStoreJjim(Jjim jjim);

	public void deleteRecipeJjim(Jjim jjim);

	public void updateStoreJjim(int storeNo);

	public void updateRecipeJjim(int rcpNo);

	public int getRecipeJjim(Jjim jjim);

	public int getStoreJjim(Jjim jjim);
	
	public int addRecommend(int recommendNo);
	
	public int deleteRecommend(int recommendNo);
	
}
