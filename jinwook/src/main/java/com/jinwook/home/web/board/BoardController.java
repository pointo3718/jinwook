package com.jinwook.home.web.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.service.board.BoardService;
import com.jinwook.home.service.domain.Board;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping(value = "/board/list.do")
	public String openBoardList(@ModelAttribute("board") Board board, Model model) {
		
		List<Board> boardList = boardService.getBoardList(board);
		model.addAttribute("boardList", boardList);

		return "board/list";
	}
}//class
