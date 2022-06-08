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
   
     @Autowired private AttachMapper attachMapper;
     
     @Autowired private FileUtils fileUtils;
    
	//1:1문의 등록v
	@Override
	public boolean addBoardInquiry(Board board) {
		int queryResult = 0;

      if (board.getBoardNo() == null) {
         queryResult = boardMapper.addBoardInquiry(board);
      } else {
         queryResult = boardMapper.updateBoardInquiry(board);

         // 파일이 추가, 삭제, 변경된 경우
         if ("Y".equals(board.getChangeYn())) {
            attachMapper.deleteAttach(board.getBoardNo());

            // fileIdxs에 포함된 idx를 가지는 파일의 삭제여부를 'N'으로 업데이트
            if (CollectionUtils.isEmpty(board.getAttachNos()) == false) {
               attachMapper.undeleteAttach(board.getAttachNos());
            }
         }
      }

      return (queryResult > 0);
   }
   
   //1:1문의 사진 첨부v
   @Override
   public boolean addBoardInquiry(Board board, MultipartFile[] files) {
      int queryResult = 1;

      if (addBoardInquiry(board) == false) {
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
   //공지사항 등록v
   @Override
   public boolean addBoardAnnouncement(Board board) {
      int queryResult = 0;
      
      if (board.getBoardNo() == null) {
         queryResult = boardMapper.addBoardAnnouncement(board);
      } else {
         queryResult = boardMapper.updateBoardAnnouncement(board);
         
         // 파일이 추가, 삭제, 변경된 경우
         if ("Y".equals(board.getChangeYn())) {
            attachMapper.deleteAttach(board.getBoardNo());
            
            // fileIdxs에 포함된 idx를 가지는 파일의 삭제여부를 'N'으로 업데이트
            if (CollectionUtils.isEmpty(board.getAttachNos()) == false) {
               attachMapper.undeleteAttach(board.getAttachNos());
            }
         }
      }
      
      return (queryResult > 0);
   }
   
   //공지사항 사진 첨부v
   @Override
   public boolean addBoardAnnouncement(Board board, MultipartFile[] files) {
      int queryResult = 1;
      
      if (addBoardInquiry(board) == false) {
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

   //1:1문의 수정v
   @Override
   public int updateBoardInquiry(Board board) {
      return boardMapper.updateBoardInquiry(board);
   }
   
   //공지사항 수정v
   @Override
   public int updateBoardAnnouncement(Board board) {
      return boardMapper.updateBoardAnnouncement(board);
   }

   //1:1문의 삭제v
   @Override
   public int deleteBoardInquiry(Integer boardNo) {
      return boardMapper.deleteBoardInquiry(boardNo);
   }
   
   //공지사항 삭제v
   @Override
   public int deleteBoardAnnouncement(Integer boardNo) {
      return boardMapper.deleteBoardAnnouncement(boardNo);
   }

   //1:1문의 상세 조회v
   @Override
   public Board getBoardInquiry(Integer boardNo) {
      return boardMapper.getBoardInquiry(boardNo);
   }
   
   //공지사항 상세 조회v
   @Override
   public Board getBoardAnnouncement(Integer boardNo) {
      return boardMapper.getBoardAnnouncement(boardNo);
   }

   //1:1문의 목록 조회v
   @Override
   public List<Board> getBoardInquiryList(Board board) {
      List<Board> boardList = Collections.emptyList();

      int boardTotalCount = boardMapper.getBoardInquiryTotalCount(board);

      if (boardTotalCount > 0) {
         boardList = boardMapper.getBoardInquiryList(board);
      }

      return boardList;
   }
   
   //공지사항 목록 조회v
   @Override
   public List<Board> getBoardAnnouncementList(Board board) {
      List<Board> boardList = Collections.emptyList();
      
      int boardTotalCount = boardMapper.getBoardAnnouncementTotalCount(board);
      
      if (boardTotalCount > 0) {
         boardList = boardMapper.getBoardAnnouncementList(board);
      }
      
      return boardList;
   }

   //보류: 댓글, 추천, 레시피 정보 어떻게 다 담지?
   @Override
   public List<Board> getRankList(Board board) {
      return boardMapper.getRankList(board);
   }

   //상점후기 등록
   @Override
   public int addReview(Orders orders) {
      return boardMapper.addReview(orders);
   }

   //상점후기 삭제
   @Override
   public int deleteReview(int ordersNo) {
      return boardMapper.deleteReview(ordersNo);
   }

   //상점후기 상세 조회
   @Override
   public Orders getReview(int ordersNo) {
   	return boardMapper.getReview(ordersNo);
   }
   
   //상점후기 목록 조회
   @Override
   public List<Orders> getReviewList(Board board) {
      List<Orders> reviewList = Collections.emptyList();

      int reviewTotalCount = boardMapper.getReviewTotalCount(board);

      if (reviewTotalCount > 0) {
         reviewList = boardMapper.getReviewList(board);
      }

      return reviewList;
   }

   //레시피 등록
   @Override
   public int addRecipe(Recipe rcp) {
      return boardMapper.addRecipe(rcp);
   }

   //레시피 수정
   @Override
   public int updateRecipe(Recipe rcp) {
      return boardMapper.updateRecipe(rcp);
   }

   //레시피 삭제
   @Override
   public int deleteRecipe(Integer rcpNo) {
      return boardMapper.deleteRecipe(rcpNo);
   }

   //레시피 상세 조회
   @Override
   public Recipe getRecipe(Integer rcpNo) {
      return boardMapper.getRecipe(rcpNo);
   }

   //레시피 목록 조회
   @Override
   public List<Recipe> getRecipeList(Recipe rcp) {
      List<Recipe> recipeList = Collections.emptyList();

      int recipeTotalCount = boardMapper.getRecipeTotalCount(rcp);

      if (recipeTotalCount > 0) {
         recipeList = boardMapper.getRecipeList(rcp);
      }

      return recipeList;
   }

   //댓글 등록
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

   @Override
   public List<Attach> getAttachFileList(Integer boardNo) {
      
      int fileTotalCount = attachMapper.getAttachTotalCount(boardNo);
      if (fileTotalCount < 1) {
         return Collections.emptyList();
      }
      return attachMapper.getAttachList(boardNo);
   }

   @Override
   public Attach getAttachDetail(Integer attachNo) {
      return attachMapper.getAttach(attachNo);
   }

   @Override
   public void updateRecipeReco(int rcpNo) {
      boardMapper.updateRecipeReco(rcpNo);
   }

   @Override
   public void updateCommentReco(int commentNo) {
      boardMapper.updateCommentReco(commentNo);
   }

   @Override
   public void updateRecipeRecoCancel(int rcpNo) {
      boardMapper.updateRecipeRecoCancel(rcpNo);
   }

   @Override
   public void updateCommentRecoCancel(int commentNo) {
      boardMapper.updateCommentRecoCancel(commentNo);
   }

   @Override
   public void addRecipeReco(int rcpNo, String userId) {
      boardMapper.addRecipeReco(rcpNo, userId);
   }

   @Override
   public void addCommentReco(int commentNo, String userId) {
      boardMapper.addCommentReco(commentNo, userId);
   }

   @Override
   public void deleteRecipeReco(int rcpNo, String userId) {
      boardMapper.deleteRecipeReco(rcpNo, userId);
   }

   @Override
   public void deleteCommentReco(int commentNo, String userId) {
      boardMapper.deleteCommentReco(commentNo, userId);
   }

   @Override
   public void updateRecipeRecoCheck(int rcpNo, String userId) {
      boardMapper.updateRecipeRecoCheck(rcpNo, userId);
   }

   @Override
   public void updateCommentRecoCheck(int commentNo, String userId) {
      boardMapper.updateCommentRecoCheck(commentNo, userId);
   }

   @Override
   public void updateRecipeRecoCheckCancel(int rcpNo, String userId) {
      boardMapper.updateRecipeRecoCheckCancel(rcpNo, userId);
   }

   @Override
   public void updateCommentRecoCheckCancel(int commentNo, String userId) {
      boardMapper.updateCommentRecoCheckCancel(commentNo, userId);
   }

   @Override
   public int recipeRecoCheck(int rcpNo, String userId) {
      return boardMapper.recipeRecoCheck(rcpNo, userId);
   }

   @Override
   public int commentRecoCheck(int commentNo, String userId) {
      return boardMapper.commentRecoCheck(commentNo, userId);
   }

   @Override
   public int updateBoardInquiryHits(Integer boardNo) {
      return boardMapper.updateBoardInquiryHits(boardNo);
   }

   @Override
   public int updateBoardAnnouncementHits(Integer boardNo) {
      return boardMapper.updateBoardAnnouncementHits(boardNo);
   }

	@Override
	public int updateBoardRecipeHits(Integer rcpNo) {
		return boardMapper.updateBoardRecipeHits(rcpNo);
	}



}