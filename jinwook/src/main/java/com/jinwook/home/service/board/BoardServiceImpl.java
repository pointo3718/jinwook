package com.jinwook.home.service.board;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.jinwook.home.mapper.BoardMapper;
import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Comment;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Recipe;

public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public int addBoard(Board board) {
		return boardMapper.addBoard(board);
	}

	@Override
	public int updateBoard(Board board) {
		return boardMapper.updateBoard(board);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return boardMapper.deleteBoard(boardNo);
	}

	@Override
	public Board getBoard(int boardNo) {
		return boardMapper.getBoard(boardNo);
	}

	@Override
	public List<Board> getBoardList() {
		List<Board> boardList = Collections.emptyList();

		int boardTotalCount = boardMapper.getBoardTotalCount();

		if (boardTotalCount > 0) {
			boardList = boardMapper.getBoardList();
		}

		return boardList;
	}

	//보류: 댓글, 추천, 레시피 정보 어떻게 다 담지?
	@Override
	public List<Board> getRankList() {
		return boardMapper.getRankList();
	}

	@Override
	public int addReview(Orders orders) {
		return boardMapper.addReview(orders);
	}

	@Override
	public int deleteReview(int ordersNo) {
		return boardMapper.deleteReview(ordersNo);
	}

	@Override
	public List<Orders> getReviewList() {
		List<Orders> reviewList = Collections.emptyList();

		int reviewTotalCount = boardMapper.getReviewTotalCount();

		if (reviewTotalCount > 0) {
			reviewList = boardMapper.getReviewList();
		}

		return reviewList;
	}

	@Override
	public int addRecipe(Recipe rcp) {
		return boardMapper.addRecipe(rcp);
	}

	@Override
	public int updateRecipe(Recipe rcp) {
		return boardMapper.updateRecipe(rcp);
	}

	@Override
	public int deleteRecipe(int rcpNo) {
		return boardMapper.deleteRecipe(rcpNo);
	}

	@Override
	public Recipe getRecipe(int rcpNo) {
		return boardMapper.getRecipe(rcpNo);
	}

	@Override
	public List<Recipe> getRecipeList() {
		List<Recipe> recipeList = Collections.emptyList();

		int recipeTotalCount = boardMapper.getRecipeTotalCount();

		if (recipeTotalCount > 0) {
			recipeList = boardMapper.getRecipeList();
		}

		return recipeList;
	}

	@Override
	public int addComment(Comment comment) {
		return boardMapper.addComment(comment);
	}

	@Override
	public int updateComment(Comment comment) {
		return boardMapper.updateComment(comment);
	}

	@Override
	public int deleteComment(int commentNo) {
		return boardMapper.deleteComment(commentNo);
	}

	@Override
	public int addJjim(int jjimNo) {
		return boardMapper.addJjim(jjimNo);
	}

	@Override
	public int deleteJjim(int jjimNo) {
		return boardMapper.deleteJjim(jjimNo);
	}

	@Override
	public int addRecommend(int recommendNo) {
		return boardMapper.addRecommend(recommendNo);
	}

	@Override
	public int deleteRecommend(int recommendNo) {
		return boardMapper.deleteRecommend(recommendNo);
	}


}
