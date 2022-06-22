package com.jinwook.home.web.board;

import java.sql.Time;
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
import com.jinwook.home.service.domain.Store;

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
	
	
	
		//댓글 수정 처리
	  @PostMapping(value = "updateRecipeComment/{commentNo}/{commentContent}")
      public JsonObject updateRecipeComment(@PathVariable(value = "commentNo", required = false) int commentNo,
                           @PathVariable(value = "commentContent", required = false) String commentContent) {
         
         JsonObject jsonObj = new JsonObject();
         
         Comment comment = new Comment();

         try {
            if (comment != null) {
               System.out.println("댓글 객체에 값 넣어줌");
               comment.setCommentNo(commentNo);
               comment.setCommentContent(commentContent);
               
            }
            
            int result = boardService.updateRecipeComment(comment);
            jsonObj.addProperty("result", result);

         } catch (DataAccessException e) {
            jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

         } catch (Exception e) {
            jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
         }
         
           System.out.println("상점 수정 컨트롤러 통과");
           
         return jsonObj;
         
      }
	
	// 댓글 삭제 처리
	@GetMapping(value = "deleteRecipeComment/{commentNo}")
	public JsonObject deleteRecipeComment(@PathVariable(value = "commentNo", required = false) int commentNo) {
		System.out.println("/board/deleteRecipeComment: GET");
		System.out.println("rest commentNo" + commentNo);

		JsonObject jsonObj = new JsonObject();

		try {
			int result = boardService.deleteRecipeComment(commentNo);
			System.out.println("result" + result);
			jsonObj.addProperty("result", result);

		} catch (DataAccessException e) {
			jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

		} catch (Exception e) {
			jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
		}
		System.out.println("jsonObj" + jsonObj);
		return jsonObj;
	}
	
}