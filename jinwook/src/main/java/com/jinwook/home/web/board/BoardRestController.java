package com.jinwook.home.web.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.jinwook.home.service.board.BoardService;
import com.jinwook.home.service.domain.Comment;

@RestController
@RequestMapping("/board/*")
public class BoardRestController {

	///Field
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	public BoardRestController() {
		System.out.println(this.getClass());
	}
	
	//레시피 삭제 버튼
	@GetMapping(value = "deleteRecipe/{rcpNo}")
	public JsonObject deleteRecipe(@PathVariable(value="rcpNo",required = false) Integer rcpNo) {
		
		System.out.println("/board/deleteRecipe: GET");
		System.out.println("rest rcpNo"+rcpNo);
		
		JsonObject jsonObj = new JsonObject();
		
		try {
			int result = boardService.deleteRecipe(rcpNo);
			System.out.println("result"+result);
			jsonObj.addProperty("result", result);

		} catch (DataAccessException e) {
			jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

		} catch (Exception e) {
			jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
		}
		System.out.println("jsonObj"+jsonObj);
		return jsonObj;
	}
	
	// 1:1문의 삭제 처리
	@GetMapping(value = "deleteBoardInquiry/{boardNo}")
	public JsonObject deleteBoardInquiry(@PathVariable(value = "boardNo", required = false) Integer boardNo) {
		System.out.println("/board/deleteBoardInquiry: GET");
		System.out.println("rest boardNo"+boardNo);
		
		JsonObject jsonObj = new JsonObject();
		
		try {
			int result = boardService.deleteBoardInquiry(boardNo);
			System.out.println("result"+result);
			jsonObj.addProperty("result", result);

		} catch (DataAccessException e) {
			jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

		} catch (Exception e) {
			jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
		}
		System.out.println("jsonObj"+jsonObj);
		return jsonObj;
	}
	
	// 공지사항 삭제 처리
	@GetMapping(value = "deleteBoardAnnouncement/{boardNo}")
	public JsonObject deleteBoardAnnouncement(@PathVariable(value = "boardNo", required = false) Integer boardNo) {
		System.out.println("/board/deleteBoardAnnouncement: GET");
		System.out.println("rest boardNo"+boardNo);

		JsonObject jsonObj = new JsonObject();
		
		try {
			int result = boardService.deleteBoardAnnouncement(boardNo);
			System.out.println("result"+result);
			jsonObj.addProperty("result", result);

		} catch (DataAccessException e) {
			jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

		} catch (Exception e) {
			jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
		}
		System.out.println("jsonObj"+jsonObj);
		return jsonObj;
	}
	
}