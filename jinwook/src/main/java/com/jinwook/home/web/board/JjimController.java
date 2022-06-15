package com.jinwook.home.web.board;
//
//import java.time.LocalDateTime;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.dao.DataAccessException;
//import org.springframework.util.CollectionUtils;
//import org.springframework.web.bind.annotation.DeleteMapping;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.google.gson.Gson;
//import com.google.gson.GsonBuilder;
//import com.google.gson.JsonArray;
//import com.google.gson.JsonObject;
//import com.jinwook.home.adapter.GsonLocalDateTimeAdapter;
//import com.jinwook.home.service.board.BoardService;
//import com.jinwook.home.service.domain.Comment;
//import com.jinwook.home.service.domain.Jjim;
//import com.jinwook.home.service.domain.Recipe;
//
//@RestController
//@RequestMapping("/board/*")
//public class JjimController {
//	
//	@Autowired
//	private BoardService boardService;
//	
//	public JjimController(){
//		System.out.println(this.getClass());
//	}
//	
//	//레시피 찜 등록v, 수정x 처리
//	@RequestMapping(value = { "/addRecipeJjim", "/addRecipeJjim/{jjimNo}" }, method = {RequestMethod.POST, RequestMethod.PATCH })
//	public JsonObject addRecipeJjim(@PathVariable(value = "jjimNo", required = false) Integer jjimNo, @RequestBody final Jjim jjim) throws Exception{
//		
//		JsonObject jsonObj = new JsonObject();
//		
//		try {
//			if (jjimNo != null) {
//				jjim.setJjimNo(jjimNo);
//			}
//			
//			boolean isAdded = boardService.addRecipeJjim(jjim);
//			jsonObj.addProperty("result", isAdded);
//			
//		} catch (DataAccessException e) {
//			jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");
//
//		} catch (Exception e) {
//			jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
//		}
//		return jsonObj;
//		
//	}//addRecipeJjim
//	
//	// 찜 리스트 불러오기
//	@GetMapping(value = "/comments/{boardNo}")
//	public JsonObject getCommentList(@PathVariable("boardNo") Integer boardNo,
//			@ModelAttribute("comment") Comment comment) {
//
//		JsonObject jsonObj = new JsonObject();
//
//		List<Comment> commentList = boardService.getCommentList(comment);
//		if (CollectionUtils.isEmpty(commentList) == false) {
//			Gson gson = new GsonBuilder().registerTypeAdapter(LocalDateTime.class, new GsonLocalDateTimeAdapter())
//					.create();
//			JsonArray jsonArr = gson.toJsonTree(commentList).getAsJsonArray();
//			jsonObj.add("commentList", jsonArr);
//		}
//
//		return jsonObj;
//	}
//	
////	// 찜 삭제
////	@DeleteMapping(value = "/deleteJjim/{jjimNo}")
////	public JsonObject deleteJjim(@PathVariable("jjimNo") final Integer jjimNo) {
////
////		JsonObject jsonObj = new JsonObject();
////
////		int isDeleted = boardService.deleteRecipeJjim(jjimNo);
////		jsonObj.addProperty("result", isDeleted);
////
////		return jsonObj;
////	}
//	
//	//상점 찜 등록v, 수정x 처리
//	@RequestMapping(value = { "/addStoreJjim", "/addStoreJjim/{jjimNo}" }, method = {RequestMethod.POST, RequestMethod.PATCH })
//	public JsonObject addStoreJjim(@PathVariable(value = "jjimNo", required = false) Integer jjimNo, @RequestBody final Jjim jjim) throws Exception{
//		
//		JsonObject jsonObj = new JsonObject();
//		
//		try {
//			if (jjimNo != null) {
//				jjim.setJjimNo(jjimNo);
//			}
//			
//			boolean isAdded = boardService.addStoreJjim(jjim);
//			jsonObj.addProperty("result", isAdded);
//			
//		} catch (DataAccessException e) {
//			jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");
//			
//		} catch (Exception e) {
//			jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
//		}
//		return jsonObj;
//		
//	}//addStoreJjim
//
//}//class
