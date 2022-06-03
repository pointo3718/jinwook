package com.jinwook.home.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Comment;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Recipe;

@Mapper
public interface BoardMapper {

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
	
	// 찜
	public void addJjim(int storeNo, int rcpNo, int boardNo, String userId, String jjimStatus);

	//public int addJjim(int jjimNo);
	
	//public int deleteJjim(int jjimNo);
	
	public int addRecommend(int recoomendNo);
	
	public int deleteRecommend(int recoomendNo);

	public int getBoardTotalCount();

	public int getRecipeTotalCount();
	
	public int getReviewTotalCount();
	
	public int getRankTotalCount();
	
}
