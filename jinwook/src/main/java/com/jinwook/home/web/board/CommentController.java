package com.jinwook.home.web.board;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.jinwook.home.adapter.GsonLocalDateTimeAdapter;
import com.jinwook.home.service.board.BoardService;
import com.jinwook.home.service.domain.Comment;

@RestController
public class CommentController {

	@Autowired
	private BoardService boardService;

	//댓글 등록 및 수정 - 테스트 실패
	@RequestMapping(value = { "/comments", "/comments/{commentNo}" }, method = {RequestMethod.POST, RequestMethod.PATCH })
	public JsonObject addComment(@PathVariable(value = "commentNo", required = false) Integer commentNo, @RequestBody final Comment comment) {

		JsonObject jsonObj = new JsonObject();

		try {
			if (commentNo != null) {
				comment.setCommentNo(commentNo);
			}

			boolean isAdded= boardService.addComment(comment);
			jsonObj.addProperty("result", isAdded);

		} catch (DataAccessException e) {
			jsonObj.addProperty("message", "데이터베이스 처리 과정에 문제가 발생하였습니다.");

		} catch (Exception e) {
			jsonObj.addProperty("message", "시스템에 문제가 발생하였습니다.");
		}

		return jsonObj;
	}
	
	//댓글 리스트 불러오기 - 테스트 성공
	@GetMapping(value = "/comments/{boardNo}")
	public JsonObject getCommentList(@PathVariable("boardNo") Integer boardNo, 
			@ModelAttribute("comment") Comment comment) {

		JsonObject jsonObj = new JsonObject();

		List<Comment> commentList = boardService.getCommentList(comment);
		if (CollectionUtils.isEmpty(commentList) == false) {
			Gson gson = new GsonBuilder().registerTypeAdapter(LocalDateTime.class, new GsonLocalDateTimeAdapter()).create();
			JsonArray jsonArr = gson.toJsonTree(commentList).getAsJsonArray();
			jsonObj.add("commentList", jsonArr);
		}

		return jsonObj;
	}
	
	//댓글 삭제
	@PostMapping(value = "/comments/{commentNo}")
	public void deleteComment(@PathVariable("commentNo") final Integer commentNo) {
			boardService.deleteComment(commentNo);
	}

}