package com.jinwook.home;

import java.time.LocalDate;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.jinwook.home.mapper.BoardMapper;
import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Product;
import com.jinwook.home.service.domain.Recipe;
import com.jinwook.home.service.domain.User;

@SpringBootTest
public class BoardMapperTest {

	@Autowired
	private BoardMapper boardMapper;
	
	@Test
	public void testOfAddBoard() {
		Board board = new Board();
		
		User user = new User();
		
		user.setUserId("test02");
		
		board.setUser(user);
		board.setBoardNo(2);
		board.setBoardTitle("1�� �Խñ�");
		board.setBoardContent("1�� �Խñ� ����");
		board.setBoardHits(2);
		board.setBoardCode("2");
		board.setWriteDate(LocalDate.now());
		board.setBoardImg1(null);
		board.setBoardImg2(null);
		board.setBoardImg3(null);
		board.setBoardInqStatus(null);
		
		int result = boardMapper.addBoard(board);
		System.out.println(" ����� "+result+"�Դϴ�.");
	}
	
	@Test
	public void testOfUpdateBoard() {
		Board board = new Board();
		
		User user = new User();
		
		board.setBoardNo(2);
		board.setBoardTitle("2�� �Խñ�");
		board.setBoardContent("2�� �Խñ� ����");
		board.setBoardCode("2");
		board.setWriteDate(LocalDate.now());
		board.setBoardImg1(null);
		board.setBoardImg2(null);
		board.setBoardImg3(null);
		board.setBoardInqStatus(null);
		
		int result = boardMapper.updateBoard(board);
		System.out.println(" ����� "+result+"�Դϴ�.");
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
		
	}
	
	@Test
	public void testOfDeleteBoard() {
		Board board = new Board();
		
		User user = new User();
		
		user.setUserId("test02");
		
		board.setUser(user);
		board.setBoardNo(2);
		board.setBoardTitle("2�� �Խñ�");
		board.setBoardContent("2�� �Խñ� ����");
		board.setBoardHits(2);
		board.setBoardCode("2");
		board.setWriteDate(LocalDate.now());
		board.setBoardImg1(null);
		board.setBoardImg2(null);
		board.setBoardImg3(null);
		board.setBoardInqStatus(null);
		
		int result = boardMapper.deleteBoard(2);
		System.out.println(" ����� "+result+"�Դϴ�.");
	}
	
	@Test
	public void testOfAddRecipe() {
		Recipe recipe = new Recipe();
		
		User user = new User();
		
		user.setUserId("test01");
		
		recipe.setUser(user);
		recipe.setRcpNo(1);
		recipe.setRcpSeqNo(1);
		recipe.setRcpTitle("1�� �Խñ�");
		recipe.setRcpContent("1�� �Խñ� ����");
		recipe.setRcpDate(LocalDate.now());
		recipe.setRcpThumb("���1");
		recipe.setRcpInfo("�Ұ�1");
		recipe.setRcpIngredient("ȣ��,����,����");
		recipe.setRcpHits(1);
		recipe.setCommentCount(1);
	
		
		int result = boardMapper.addRecipe(recipe);
		System.out.println(" ����� "+result+"�Դϴ�.");
	}
	
	@Test
	public void testOfUpdateRecipe() {
		Board board = new Board();
		
		User user = new User();
		
		board.setBoardNo(2);
		board.setBoardTitle("2�� �Խñ�");
		board.setBoardContent("2�� �Խñ� ����");
		board.setBoardCode("2");
		board.setWriteDate(LocalDate.now());
		board.setBoardImg1(null);
		board.setBoardImg2(null);
		board.setBoardImg3(null);
		board.setBoardInqStatus(null);
		
		int result = boardMapper.updateBoard(board);
		System.out.println(" ����� "+result+"�Դϴ�.");
	}
	
	@Test
	public void testOfGetRecipe() {
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
	public void testOfGetRecipeList() {
		
	}
	
	@Test
	public void testOfDeleteRecipe() {
		Board board = new Board();
		
		User user = new User();
		
		user.setUserId("test02");
		
		board.setUser(user);
		board.setBoardNo(2);
		board.setBoardTitle("2�� �Խñ�");
		board.setBoardContent("2�� �Խñ� ����");
		board.setBoardHits(2);
		board.setBoardCode("2");
		board.setWriteDate(LocalDate.now());
		board.setBoardImg1(null);
		board.setBoardImg2(null);
		board.setBoardImg3(null);
		board.setBoardInqStatus(null);
		
		int result = boardMapper.deleteBoard(2);
		System.out.println(" ����� "+result+"�Դϴ�.");
	}
	
	
}//test
