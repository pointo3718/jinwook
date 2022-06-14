package com.jinwook.home.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Comment;
import com.jinwook.home.service.domain.FileVO;
import com.jinwook.home.service.domain.Jjim;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Recipe;

@Mapper
public interface BoardMapper {

	//레시피 조회수 증가
	public int updateBoardRecipeHits(Integer rcpNo);
	//1:1문의 조회수 증가
	public int updateBoardInquiryHits(Integer boardNo);
	//공지사항 조회수 증가
	public int updateBoardAnnouncementHits(Integer boardNo);
	//사진 업로드
	public int fileInsert(FileVO file) throws Exception;
	//1:1문의 등록
	public int addBoardInquiry(Board board);
	//공지사항 등록
	public int addBoardAnnouncement(Board board);
	//1:1문의 수정
	public void updateBoardInquiry(Board board) throws Exception;
	//공지사항 수정
	public int updateBoardAnnouncement(Board board);
	//1:1문의 삭제
	public int deleteBoardInquiry(Integer boardNo);
	//공지사항 삭제
	public int deleteBoardAnnouncement(Integer boardNo);
	
	//조인 필요: board, comment 1:1문의 상세 조회 시 답변상태 false/true로 표시.
	public Board getBoardInquiry(Integer boardNo);
	//1:1문의 답변대기중 -> 답변완료(true)
	public int updateBoardInqStatus(int boardNo);	
	//조인 필요: board, comment 공지사항 상세 조회
	public Board getBoardAnnouncement(Integer boardNo);
	//1:1문의 목록 조회
	public List<Board> getBoardInquiryList(Board board);
	//공지사항 목록 조회
	public List<Board> getBoardAnnouncementList(Board board);
	//전체 랭킹 리스트 조인 필요: store, comment, recipe
	public List<Board> getRankList(Board board);
	
	//상점 후기 등록: Orders
	public int addReview(Orders orders);
	public int deleteReview(int ordersNo);
	public Orders getReview(int ordersNo);
	public List<Orders> getReviewList(Board board);
	
	//레시피
	public int addRecipe(Recipe rcp);
	public void updateRecipe(Recipe rcp);
	public int deleteRecipe(Integer rcpNo);
	//조인 필요: recipe, comment, recommend
	public Recipe getRecipe(Integer rcpNo);
	public List<Recipe> getRecipeList(Recipe rcp);
	
	//댓글 등록
	public int addComment(Comment comment);
	//댓글 수정
	public int updateComment(Comment comment);
	//댓글 삭제
	public int deleteComment(Integer commentNo);
	//특정 게시글에 포함된 댓글 목록을 조회하는 SELECT 쿼리를 호출
	public List<Comment> getCommentList(Comment comment);
	
	// 찜 등록 rest test v
	public int addStoreJjim(Jjim jjim);
	public int addRecipeJjim(Jjim jjim);
	//
	public int deleteStoreJjim(Jjim jjim);
	public int deleteRecipeJjim(Jjim jjim);
	//
	public int updateStoreJjim(int storeNo);
	public int updateRecipeJjim(int rcpNo);
	//레시피 찜 목록 확인
	public int getRecipeJjim(Jjim jjim);
	public int getStoreJjim(Jjim jjim);
	
	//레시피 추천
	public int updateRecipeReco(int rcpNo);
	//댓글 추천
	public void updateCommentReco(int commentNo);
	//레시피 추천 취소
	public void updateRecipeRecoCancel(int rcpNo);
	//댓글 추천 취소
	public void updateCommentRecoCancel(int commentNo);
	//레시피 추천 테이블에 add
	public int addRecipeReco(Map<String, Object> map);
	//댓글 추천 테이블에 add
	public void addCommentReco(int commentNo, String userId);
	//레시피 추천 테이블에서 delete
	public void deleteRecipeReco(int rcpNo, String userId);
	//댓글 추천 테이블에서 delete
	public void deleteCommentReco(int commentNo, String userId);
	//레시피 추천 시 recocheck를 1로 만들어서 중복방지
	public int updateRecipeRecoCheck(Map<String, Object> map);
	//댓글 추천 시 recocheck를 1로 만들어서 중복방지
	public void updateCommentRecoCheck(int commentNo, String userId);
	// 레시피 추천취소 시 다시 0
	public void updateRecipeRecoCheckCancel(int rcpNo, String userId);
	// 댓글 추천취소 시 다시 0
	public void updateCommentRecoCheckCancel(int commentNo, String userId);
	//레시피 추천 중복방지 select문
	public int recipeRecoCheck(Map<String, Object> map);
	//댓글 추천 중복방지 select문
	public int commentRecoCheck(int commentNo, String userId);

	// 목록 개수
	public int getBoardInquiryTotalCount(Board board);
	public int getBoardAnnouncementTotalCount(Board board);
	public int getRecipeTotalCount(Recipe rcp);
	public int getReviewTotalCount(Board board);
	public int getRankTotalCount(Board board);
	//특정 게시글에 포함된 댓글 개수를 조회하는 select 쿼리를 호출
	public int getCommentTotalCount(Comment comment);
	
}
