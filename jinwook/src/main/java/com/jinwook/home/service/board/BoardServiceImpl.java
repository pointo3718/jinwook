package com.jinwook.home.service.board;

import java.io.File;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jinwook.home.common.FileUtils;
import com.jinwook.home.common.PaginationInfo;
import com.jinwook.home.mapper.BoardMapper;
import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Comment;
import com.jinwook.home.service.domain.FileVO;
import com.jinwook.home.service.domain.Jjim;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Recipe;
@Service
public class BoardServiceImpl implements BoardService {

   @Autowired
   private BoardMapper boardMapper;
   
   @Autowired
    private FileUtils fileUtils;
     
   //1:1문의 등록
   @Override
   public void addBoardInquiry(Board board, MultipartHttpServletRequest mpRequest) throws Exception {
	   boardMapper.addBoardInquiry(board);
	   
	   List<Map<String,Object>> list = fileUtils.parseInsertBoardFileInfo(board, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			boardMapper.insertBoardFile(list.get(i)); 
		}
   }
   
   //공지사항 등록v
   @Override
   public void addBoardAnnouncement(Board board, MultipartHttpServletRequest mpRequest) throws Exception {
	   boardMapper.addBoardAnnouncement(board);
	   
	   List<Map<String,Object>> list = fileUtils.parseInsertBoardFileInfo(board, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			boardMapper.insertBoardFile(list.get(i)); 
		}
   }
   
   @Override
   public void updateBoardInquiry(Board board, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
	   
	   boardMapper.updateBoardInquiry(board);
	   
	   List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(board, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for(int i = 0; i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				boardMapper.insertBoardFile(tempMap);
			}else {
				boardMapper.updateAttach(tempMap);
			}
		}
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
      
      PaginationInfo paginationInfo = new PaginationInfo(board);
      paginationInfo.setTotalRecordCount(boardTotalCount);

      board.setPaginationInfo(paginationInfo);

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
      
      PaginationInfo paginationInfo = new PaginationInfo(board);
      paginationInfo.setTotalRecordCount(boardTotalCount);

      board.setPaginationInfo(paginationInfo);
      
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
   public void addRecipe(Recipe rcp, MultipartHttpServletRequest mpRequest) throws Exception {
      boardMapper.addRecipe(rcp);
      
      List<Map<String,Object>> list = fileUtils.parseInsertRecipeFileInfo(rcp, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			boardMapper.insertRecipeFile(list.get(i)); 
		}
   }

   //레시피 수정
   @Override
   public void updateRecipe(Recipe rcp) {
       boardMapper.updateRecipe(rcp);
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

      PaginationInfo paginationInfo = new PaginationInfo(rcp);
      paginationInfo.setTotalRecordCount(recipeTotalCount);

      rcp.setPaginationInfo(paginationInfo);
      
      if (recipeTotalCount > 0) {
         recipeList = boardMapper.getRecipeList(rcp);
      }

      return recipeList;
   }

//   //댓글 등록
//   @Override
//   public boolean addComment(Comment comment) {
//      int queryResult = 0;
//
//      if (comment.getCommentNo() == null) {
//         queryResult = boardMapper.addComment(comment);
//      } else {
//         queryResult = boardMapper.updateComment(comment);
//      }
//
//      return (queryResult == 1) ? true : false;
//   }
//
//   @Override
//   public int deleteComment(Integer commentNo) {
//      return boardMapper.deleteComment(commentNo);
//   }
//
//   @Override
//   public List<Comment> getCommentList(Comment comment) {
//      List<Comment> commentList = Collections.emptyList();
//
//      int commentTotalCount = boardMapper.getCommentTotalCount(comment);
//   if (commentTotalCount > 0) {
//         commentList = boardMapper.getCommentList(comment);
//      }
//      return commentList;
//   }
   
   @Override
   public boolean addStoreJjim(Jjim jjim) {
	   int queryResult = 0;

	      if (jjim.getJjimNo() == null) {
	         queryResult =  boardMapper.addStoreJjim(jjim);
	      } else {
	         queryResult = boardMapper.updateStoreJjim(jjim.getStoreNo());
	      }

	      return (queryResult == 1) ? true : false;
   }

   @Override
   public boolean addRecipeJjim(Jjim jjim) {
	   int queryResult = 0;

	      if (jjim.getJjimNo() == null) {
	         queryResult = boardMapper.addRecipeJjim(jjim);
	      } else {
	         queryResult = boardMapper.updateRecipeJjim(jjim.getRcpNo());
	      }

	      return (queryResult == 1) ? true : false;
   }

   @Override
   public int deleteStoreJjim(Jjim jjim) {
      boardMapper.deleteStoreJjim(jjim);
      return boardMapper.updateStoreJjim(jjim.getStoreNo());      
   }

   @Override
   public int deleteRecipeJjim(Jjim jjim) {
      boardMapper.deleteRecipeJjim(jjim);
      return boardMapper.updateRecipeJjim(jjim.getRcpNo());      
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
   public int updateRecipeReco(int rcpNo) {
      return boardMapper.updateRecipeReco(rcpNo);
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
   public int addRecipeReco(int rcpNo, String userId) {
	   Map<String, Object> map = new HashMap<String, Object>();
	      map.put("userId", userId);
	      map.put("rcpNo", rcpNo);
   return boardMapper.addRecipeReco(map);
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
   public int updateRecipeRecoCheck(int rcpNo, String userId) {
	   Map<String, Object> map = new HashMap<String, Object>();
	      map.put("userId", userId);
	      map.put("rcpNo", rcpNo);
      return boardMapper.updateRecipeRecoCheck(map);
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
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("userId", userId);
      map.put("rcpNo", rcpNo);
	   return boardMapper.recipeRecoCheck(map);
      
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
	
//	//게시판 사진 업로드
//	@Override
//	public int fileBoardInsert(FileVO file) throws Exception {
//		return boardMapper.fileBoardInsert(file);
//	}
//	
//	//레시피 사진 업로드
//	@Override
//	public int fileRecipeInsert(FileVO file) throws Exception {
//		return boardMapper.fileRecipeInsert(file);
//	}

	//댓글 조회
	@Override
	public List<Comment> getComment(int boardNo) throws Exception {
		return boardMapper.getComment(boardNo);
	}

	@Override
	public void addComment(Comment comment) throws Exception {
		boardMapper.addComment(comment);
	}

	//답변 상태 변화
	@Override
	public boolean updateBoardInqStatus(Board board) {
		return boardMapper.updateBoardInqStatus(board);
	}

	//파일 첨부 조회
	@Override
	public List<Map<String, Object>> selectAttachList(int boardNo) throws Exception {
		return boardMapper.selectAttachList(boardNo);
	}

	//파일 다운로드
	@Override
	public Map<String, Object> selectAttachInfo(Map<String, Object> map) throws Exception {
		return boardMapper.selectAttachInfo(map);
	}

	@Override
	public int updateBoardInqStatus(Integer boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}




}