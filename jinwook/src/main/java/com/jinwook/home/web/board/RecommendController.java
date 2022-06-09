package com.jinwook.home.web.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;
import com.jinwook.home.service.board.BoardService;
import com.jinwook.home.service.domain.User;
import com.jinwook.home.service.user.UserService;

@RestController
@RequestMapping("/board/*")
public class RecommendController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private UserService userService;
	
	//레시피 추천수 /board/updateRecipeReco
	//추천하는 id는 로그인한 사용자의 id이어야 함. session
	//service 만들 때 어떻게 userId를 설정하지? 
//	@RequestMapping(value = { "updateRecipeReco" }, method = { RequestMethod.POST })
//	public JsonObject updateRecipeReco(@RequestParam("rcpNo") Integer rcpNo,
//			@RequestParam(value = "userId", required = false) String userId, Model model) throws Exception {
//		System.out.println("/board/updateRecipeReco: POST");
//		JsonObject jsonObj = new JsonObject();
//
//		User user = userService.getUser(userId);
//		model.addAttribute("user", user);
//		int recoCheck = boardService.recipeRecoCheck(rcpNo, userId);
//		if (recoCheck == 0) {
//			// 추천수 처음 누름
//			boardService.addRecipeReco(rcpNo, userId); // recommend테이블에 삽입
//			boardService.updateRecipeReco(rcpNo); // recipe테이블 + 1
//			boardService.updateRecipeRecoCheck(rcpNo, userId); // recommend 테이블 구분자 1
//		} else if (recoCheck == 1) {
//			boardService.updateRecipeRecoCheck(rcpNo, userId); // recommend 테이블 구분자 0
//			boardService.updateRecipeRecoCheckCancel(rcpNo, userId); // recipe테이블 - 1
//			boardService.deleteRecipeReco(rcpNo, userId); // recommend 테이블 삭제
//		}
//		return recoCheck;
//	}
}
