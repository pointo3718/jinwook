package com.jinwook.home.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Comment;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Recipe;
import com.jinwook.home.service.domain.User;

@Mapper
public interface BoardMapper {

	public int addBoard(Board board);
	
	public int updateBoard(Board board);
	
	public int deleteBoard(int boardNo);
	
	public Board getBoard(int boardNo);
	
	public List<Board> getBoardList(Criteria criteria);
	
	public List<Board> getRankList(Criteria criteria);
	
	public int addReview(Orders orders);
	
	public int deleteReview(int ordersNo);
	
	public List<Orders> getReviewList(Criteria criteria);
	
	public int addRecipe(Recipe rcp);
	
	public int updateRecipe(Recipe rcp);
	
	public int deleteRecipe(int rcpNo);
	
	public Recipe getRecipe(int rcpNo);
	
	public List<Recipe> getRecipeList(Criteria criteria);
	
	public int addComment(Comment comment);
	
	public int updateComment(Comment comment);
	
	public int deleteComment(int commentNo);
	
	// 찜
	public int addStoreJjim(int storeNo, User user);

	public int addRecipeJjim(int rcpNo, User user);

	public int deleteStoreJjim(int storeNo, User user);

	public int deleteRecipeJjim(int rcpNo, User user);
	
	public int updateStoreJjim(int rcpNo, User user);
	
	public void updateRecipeJjim();
	
	//public int addJjim(int jjimNo);
	
	//public int deleteJjim(int jjimNo);
	
	public int addRecommend(int recoomendNo);
	
	public int deleteRecommend(int recoomendNo);

	public int getBoardTotalCount(Criteria criteria);

	public int getRecipeTotalCount(Criteria criteria);
	
	public int getReviewTotalCount(Criteria criteria);
	
	public int getRankTotalCount(Criteria criteria);
	
}
