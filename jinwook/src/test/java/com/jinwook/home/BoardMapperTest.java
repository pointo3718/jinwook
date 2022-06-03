package com.jinwook.home;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;
import org.springframework.util.CollectionUtils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.jinwook.home.mapper.BoardMapper;
import com.jinwook.home.mapper.OrdersMapper;
import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Comment;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Recipe;
import com.jinwook.home.service.domain.User;

@SpringBootTest
public class BoardMapperTest {

	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private OrdersMapper ordersMapper;
	
	
	@Test
	public void testOfAddBoard() {
		Board board = new Board();
		
		User user = new User();
		
		user.setUserId("test02");
		
		board.setUser(user);
		board.setBoardNo(1);
		board.setBoardTitle("1번 게시글");
		board.setBoardContent("1번 게시글 내용");
		board.setBoardHits(2);
		board.setBoardCode("2");
		board.setWriteDate(LocalDate.now());
		board.setBoardImg1(null);
		board.setBoardImg2(null);
		board.setBoardImg3(null);
		board.setBoardInqStatus(null);
		
		int result = boardMapper.addBoard(board);
		System.out.println(" 결과는 "+result+"입니다.");
	}
	
	@Test
	public void testOfUpdateBoard() {
		Board board = new Board();
		
		User user = new User();
		
		board.setBoardNo(1);
		board.setBoardTitle("2번 게시글");
		board.setBoardContent("2번 게시글 내용");
		board.setBoardCode("2");
		board.setWriteDate(LocalDate.now());
		board.setBoardImg1(null);
		board.setBoardImg2(null);
		board.setBoardImg3(null);
		board.setBoardInqStatus(null);
		
		int result = boardMapper.updateBoard(board);
		System.out.println(" 결과는 "+result+"입니다.");
	}
	
	@Test
	public void testOfGetBoard() {
		Board board = boardMapper.getBoard(1);		
		try {
			// String boardJson = new ObjectMapper().writeValueAsString(board);
			String boardJson = new ObjectMapper().registerModule(new JavaTimeModule()).writeValueAsString(board);

			System.out.println("=========================");
			System.out.println(boardJson);
			System.out.println("=========================");

		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testOfGetBoardList() {
		int boardTotalCount = boardMapper.getBoardTotalCount();
		if (boardTotalCount > 0) {
			List<Board> boardList = boardMapper.getBoardList();
			
			// 리스트가 비어있는지 체크
			if (CollectionUtils.isEmpty(boardList) == false) { 		
				for (Board board : boardList) {
					System.out.println("=========================");
					System.out.println(board.getUser().getUserId());
					System.out.println(board.getBoardNo());
					System.out.println(board.getBoardTitle());
					System.out.println(board.getWriteDate());
					System.out.println("=========================");
				}
			}
		}
	}
	
	@Test
	public void testOfDeleteBoard() {
		Board board = new Board();
		
		User user = new User();
		
		user.setUserId("test02");
		
		board.setUser(user);
		board.setBoardNo(2);
		board.setBoardTitle("2번 게시글");
		board.setBoardContent("2번 게시글 내용");
		board.setBoardHits(2);
		board.setBoardCode("2");
		board.setWriteDate(LocalDate.now());
		board.setBoardImg1(null);
		board.setBoardImg2(null);
		board.setBoardImg3(null);
		board.setBoardInqStatus(null);
		
		int result = boardMapper.deleteBoard(2);
		System.out.println(" 결과는 "+result+"입니다.");
	}
	
	@Test
	public void testOfAddRecipe() {
		Recipe rcp = new Recipe();
		
		User user = new User();
		
		user.setUserId("test01");
		
		rcp.setUser(user);
		rcp.setRcpNo(1);
		rcp.setRcpTitle("1번 게시글");
		rcp.setRcpContent("1번 게시글 내용");
		rcp.setRcpDate(LocalDate.now());
		rcp.setRcpThumb("썸넬1");
		rcp.setRcpInfo("소개1");
		rcp.setRcpIngredient("호박,수박,참외");
		rcp.setRcpHits(1);
		rcp.setCommentCount(1);
	
		int result = boardMapper.addRecipe(rcp);
		System.out.println(" 결과는 "+result+"입니다.");
	}
	
	@Test
	public void testOfUpdateRecipe() {
		Recipe rcp = new Recipe();
		User user = new User();
		
		rcp.setRcpNo(1);
		rcp.setRcpTitle("2번 게시글");
		rcp.setRcpContent("2번 게시글 내용");
		rcp.setRcpDate(LocalDate.now());
		rcp.setRcpIngredient("호박,수박,참외");
		rcp.setRcpThumb("썸넬2");
		rcp.setRcpInfo("소개2");
		
		int result = boardMapper.updateRecipe(rcp);
		System.out.println(" 결과는 "+result+"입니다.");
	}
	
	@Test
	public void testOfGetRecipe() {
		Recipe rcp = boardMapper.getRecipe(1);		
		try {
			// String boardJson = new ObjectMapper().writeValueAsString(board);
			String boardJson = new ObjectMapper().registerModule(new JavaTimeModule()).writeValueAsString(rcp);
			
			System.out.println("=========================");
			System.out.println(boardJson);
			System.out.println("=========================");
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testOfGetRecipeList() {
		int boardTotalCount = boardMapper.getRecipeTotalCount();
		if (boardTotalCount > 0) {
			List<Recipe> rcpList = boardMapper.getRecipeList();
			
			// 리스트가 비어있는지 체크
			if (CollectionUtils.isEmpty(rcpList) == false) { 		
				for (Recipe rcp : rcpList) {
					System.out.println("=========================");
					System.out.println(rcp.getUser().getUserId());
					System.out.println(rcp.getRcpNo());
					System.out.println(rcp.getRcpTitle());
					System.out.println(rcp.getRcpDate());
					System.out.println("=========================");
				}
			}
		}
	}
	
	@Test
	public void testOfDeleteRecipe() {
		Recipe rcp = new Recipe();
		
		User user = new User();
		
		user.setUserId("test01");
		
		rcp.setUser(user);
		rcp.setRcpNo(1);
		rcp.setRcpTitle("1번 게시글");
		rcp.setRcpContent("1번 게시글 내용");
		rcp.setRcpDate(LocalDate.now());
		rcp.setRcpThumb("썸넬1");
		rcp.setRcpInfo("소개1");
		rcp.setRcpIngredient("호박,수박,참외");
		rcp.setRcpHits(1);
		rcp.setCommentCount(1);
		
		int result = boardMapper.deleteRecipe(1);
		System.out.println(" 결과는 "+result+"입니다.");
	}
	
	//주문목록에서 상점후기 등록
	@Test
	public void testOfAddReview() {
		Orders orders = new Orders();
		
		User user = new User();
		
		orders.setOrderNo(10035);
		user.setUserId("test09");
		orders.setUser(user);
		orders.setReviewTitle("1번 리뷰");
		orders.setReviewContent("1번 리뷰 내용");
		orders.setReviewDate(LocalDate.now());
		orders.setReviewStar(4);
		orders.setReviewImg1("imge1");
		orders.setReviewImg2("img2");
		orders.setReviewImg3("img3");
		
		int result = boardMapper.addReview(orders);
		System.out.println(" 결과는 "+result+"입니다.");
	}
	
	@Test
	public void testOfDeleteReview() {
		Orders orders = new Orders();
		
		User user = new User();
		
		orders.setOrderNo(10036);
		user.setUserId("test09");
		orders.setUser(user);
		
		int result = boardMapper.deleteReview(10036);
		System.out.println(" 결과는 "+result+"입니다.");
	}
	
	@Test
	public void testOfGetReviewList() {
		int boardTotalCount = boardMapper.getReviewTotalCount();
		if (boardTotalCount > 0) {
			List<Orders> reviewList = boardMapper.getReviewList();
			
			// 리스트가 비어있는지 체크
			if (CollectionUtils.isEmpty(reviewList) == false) { 		
				for (Orders orders : reviewList) {
					System.out.println("=========================");
					System.out.println(orders.getUser().getUserId());
					System.out.println(orders.getReviewTitle());
					System.out.println(orders.getReviewContent());
					System.out.println(orders.getReviewDate());
					System.out.println(orders.getReviewStar());
					System.out.println(orders.getReviewImg1());
					System.out.println(orders.getReviewImg2());
					System.out.println(orders.getReviewImg3());
					System.out.println("=========================");
				}
			}
		}
	}
	
	@Test
	public void testOfAddComment() {
		Board board = new Board();
		Comment comment = new Comment();
		User user = new User();
		Recipe rcp = new Recipe();
		
		comment.setCommentNo(2);
		user.setUserId("test02");
		comment.setUser(user);
		rcp.setRcpNo(2);
		board.setBoardNo(2);
		comment.setCommentContent("2번 댓글내용");
		comment.setCommentDate(LocalDate.now());
		comment.setRecommendCount(2);
		
		int result = boardMapper.addComment(comment);
		System.out.println(" 결과는 "+result+"입니다.");
	}
	
	@Test
	public void testOfDeleteComment() {
		Comment comment = new Comment();
		
		comment.setCommentNo(1);
		
		int result = boardMapper.deleteComment(1);
		System.out.println(" 결과는 "+result+"입니다.");
		
	}
	
	@Test
	public void testOfUpdateComment() {
		Comment comment = new Comment();
		
		comment.setCommentNo(2);
		comment.setCommentContent("댓글내용3");
		comment.setCommentDate(LocalDate.now());
		
		int result = boardMapper.updateComment(comment);
		System.out.println(" 결과는 "+result+"입니다.");
	}
	
}//test
