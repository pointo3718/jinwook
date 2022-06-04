package com.jinwook.home.web.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.service.board.BoardService;
import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Comment;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	public BoardController(){
		System.out.println(this.getClass());
	}
	
	//게시글 등록 화면(1:1문의 등록 화면, 공지사항 등록 화면)
	@GetMapping(value = "addBoardView")
	public String addBoardView(@RequestParam(value = "boardNo", required = false) Integer boardNo, Model model) {
		System.out.println("/board/addBoardView: GET");
		
		if (boardNo == null) {
			model.addAttribute("board", new Board());
		} else {
			Board board = boardService.getBoard(boardNo);
			if (board == null) {
				return "redirect:/board/list";
				//getBoard 실행결과가 null이면 게시글 리스트 페이지로 리다이렉트
			}
			model.addAttribute("board", board);
		}
		return "board/addBoardView"; //보여줄 화면: .jsp
		//Test
//		String title = "제목";
//		String content = "내용";
//		String writer = "홍길동";
//		
//		model.addAttribute("t", title);
//		model.addAttribute("c", content);
//		model.addAttribute("w", writer);
	}
	
	//게시글 등록 처리(1:1문의 등록 처리, 공지사항 등록 처리)
	@PostMapping(value = "addBoard")
	public String addBoard(final Board board) {
		System.out.println("/board/addBoard: POST");
		try {
			boolean isAdded = boardService.addBoard(board);
			if (isAdded == false) {
				// TODO => 게시글 등록에 실패하였다는 메시지를 전달
			}
		} catch (DataAccessException e) {
			// TODO => 데이터베이스 처리 과정에 문제가 발생하였다는 메시지를 전달

		} catch (Exception e) {
			// TODO => 시스템에 문제가 발생하였다는 메시지를 전달
		}
		return "redirect:/board/list";
	}
	
	//게시글 목록 조회
	@GetMapping(value = "boardList")
	public String boardList(@ModelAttribute("board") Board board, Model model) {
		List<Board> boardList = boardService.getBoardList(board);
		model.addAttribute("boardList", boardList);
		
		return "board/boardList";
	}
	
}//class
