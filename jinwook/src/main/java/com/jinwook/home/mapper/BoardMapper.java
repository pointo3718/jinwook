package com.jinwook.home.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Comment;
import com.jinwook.home.service.domain.Jjim;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Recipe;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;

@Mapper
public interface BoardMapper {

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
	
	//댓글 등록
	public int addComment(Comment comment);
	//댓글 수정
	public int updateComment(Comment comment);
	//댓글 삭제
	public void deleteComment(Comment comment);
	//특정 게시글에 포함된 댓글 목록을 조회하는 SELECT 쿼리를 호출
	//public List<Comment> getCommentList(Comment comment);
	//특정 게시글에 포함된 댓글 개수를 조회하는 select 쿼리를 호출
	public int getCommentTotalCount(int boardNo);
	
	// 찜
	public int addStoreJjim(Jjim jjim);

	public int addRecipeJjim(Jjim jjim);

	public int deleteStoreJjim(Jjim jjim);

	public int deleteRecipeJjim(Jjim jjim);
	
	public int updateStoreJjim(int storeNo);
	
	public int updateRecipeJjim(int rcpNo);
	
	public int getRecipeJjim(Jjim jjim);

	public int getStoreJjim(Jjim jjim);
	
	//추천
	public int addRecommend(int recommendNo);
	
	public int deleteRecommend(int recommendNo);

	public int getBoardTotalCount(Board board);

	public int getRecipeTotalCount(Board board);
	
	public int getReviewTotalCount(Board board);
	
	public int getRankTotalCount(Board board);
	
}
