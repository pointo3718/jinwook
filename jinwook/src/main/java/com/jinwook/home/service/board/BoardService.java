package com.jinwook.home.service.board;

import java.util.List;
import java.util.Map;

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
	
	public List<Board> getBoardList();
	
	public List<Board> getRankList();
	
	public int addReview(Orders orders);
	
	public int deleteReview(int ordersNo);
	
	public List<Orders> getReviewList();
	
	public int addRecipe(Recipe rcp);
	
	public int updateRecipe(Recipe rcp);
	
	public int deleteRecipe(int rcpNo);
	
	public Recipe getRecipe(int rcpNo);
	
	public List<Recipe> getRecipeList();
	
	public int addComment(Comment comment);
	
	public int updateComment(Comment comment);
	
	public int deleteComment(int commentNo);
	
	public Jjim addJjim(int rcpNo, int storeNo);
	
	//public int addJjim(int jjimNo);
	
	//public int deleteJjim(int jjimNo);
	
	public int addRecommend(int recommendNo);
	
	public int deleteRecommend(int recommendNo);
	
}
