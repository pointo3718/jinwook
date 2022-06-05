package com.jinwook.home.service.board;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.common.FileUtils;
import com.jinwook.home.mapper.AttachMapper;
import com.jinwook.home.mapper.BoardMapper;
import com.jinwook.home.service.domain.Attach;
import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Comment;
import com.jinwook.home.service.domain.Jjim;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Recipe;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private AttachMapper attachMapper;

	@Autowired
	private FileUtils fileUtils;
	
	@Override
	public boolean addBoard(Board board) {
		int queryResult = 0;

		if (board.getBoardNo() == null) {
			queryResult = boardMapper.addBoard(board);
		} else {
			queryResult = boardMapper.updateBoard(board);
		}

		return (queryResult == 1) ? true : false;
	}
	
	@Override
	public boolean addBoard(Board board, MultipartFile[] files) {
		int queryResult = 1;

		if (addBoard(board) == false) {
			return false;
		}

		List<Attach> fileList = fileUtils.uploadFiles(files, board.getBoardNo());
		if (CollectionUtils.isEmpty(fileList) == false) {
			queryResult = attachMapper.addAttach(fileList);
			if (queryResult < 1) {
				queryResult = 0;
			}
		}

		return (queryResult > 0);
	}

	@Override
	public int updateBoard(Board board) {
		return boardMapper.updateBoard(board);
	}

	@Override
	public int deleteBoard(Integer boardNo) {
		return boardMapper.deleteBoard(boardNo);
	}

	@Override
	public Board getBoard(Integer boardNo) {
		return boardMapper.getBoard(boardNo);
	}

	@Override
	public List<Board> getBoardList(Board board) {
		List<Board> boardList = Collections.emptyList();

		int boardTotalCount = boardMapper.getBoardTotalCount(board);

		if (boardTotalCount > 0) {
			boardList = boardMapper.getBoardList(board);
		}

		return boardList;
	}

	//보류: 댓글, 추천, 레시피 정보 어떻게 다 담지?
	@Override
	public List<Board> getRankList(Board board) {
		return boardMapper.getRankList(board);
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
	public List<Orders> getReviewList(Board board) {
		List<Orders> reviewList = Collections.emptyList();

		int reviewTotalCount = boardMapper.getReviewTotalCount(board);

		if (reviewTotalCount > 0) {
			reviewList = boardMapper.getReviewList(board);
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
	public List<Recipe> getRecipeList(Board board) {
		List<Recipe> recipeList = Collections.emptyList();

		int recipeTotalCount = boardMapper.getRecipeTotalCount(board);

		if (recipeTotalCount > 0) {
			recipeList = boardMapper.getRecipeList(board);
		}

		return recipeList;
	}

	@Override
	public boolean addComment(Comment comment) {
		int queryResult = 0;

		if (comment.getCommentNo() == null) {
			queryResult = boardMapper.addComment(comment);
		} else {
			queryResult = boardMapper.updateComment(comment);
		}

		return (queryResult == 1) ? true : false;
	}

	@Override
	public int deleteComment(Integer commentNo) {
		return boardMapper.deleteComment(commentNo);
	}

	@Override
	public List<Comment> getCommentList(Comment comment) {
		List<Comment> commentList = Collections.emptyList();

		int commentTotalCount = boardMapper.getCommentTotalCount(comment);
	if (commentTotalCount > 0) {
			commentList = boardMapper.getCommentList(comment);
		}
		return commentList;
	}
	
	@Override
	public int addRecommend(int recommendNo) {
		return boardMapper.addRecommend(recommendNo);
	}

	@Override
	public int deleteRecommend(int recommendNo) {
		return boardMapper.deleteRecommend(recommendNo);
	}

	@Override
	public void addStoreJjim(Jjim jjim) {
		boardMapper.addStoreJjim(jjim);
		boardMapper.updateStoreJjim(jjim.getStoreNo());
	}

	@Override
	public void addRecipeJjim(Jjim jjim) {
		boardMapper.addRecipeJjim(jjim);
		boardMapper.updateRecipeJjim(jjim.getRcpNo());
	}

	@Override
	public void deleteStoreJjim(Jjim jjim) {
		boardMapper.deleteStoreJjim(jjim);
		boardMapper.updateStoreJjim(jjim.getStoreNo());		
	}

	@Override
	public void deleteRecipeJjim(Jjim jjim) {
		boardMapper.deleteRecipeJjim(jjim);
		boardMapper.updateRecipeJjim(jjim.getRcpNo());		
	}

	@Override
	public void updateStoreJjim(int storeNo) {
	}

	@Override
	public void updateRecipeJjim(int rcpNo) {
	}

	@Override
	public int getRecipeJjim(Jjim jjim) {
		return boardMapper.getRecipeJjim(jjim);
	}

	@Override
	public int getStoreJjim(Jjim jjim) {
		return boardMapper.getStoreJjim(jjim);
	}


}
