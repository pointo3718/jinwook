package com.jinwook.home.web.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.jinwook.home.service.board.BoardService;
import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Comment;

@RestController
public class CommentController {

	@Autowired
	private BoardService boardService;

	@GetMapping(value = "/comments/{boardNo}")
	public JsonObject getCommentList(@PathVariable("boardNo") int boardNo, 
			@ModelAttribute("comment") Comment comment) {

		JsonObject jsonObj = new JsonObject();

		List<Comment> commentList = boardService.getCommentList(boardNo);
		if (CollectionUtils.isEmpty(commentList) == false) {
			JsonArray jsonArr = new Gson().toJsonTree(commentList).getAsJsonArray();
			jsonObj.add("commentList", jsonArr);
		}

		return jsonObj;
	}

}