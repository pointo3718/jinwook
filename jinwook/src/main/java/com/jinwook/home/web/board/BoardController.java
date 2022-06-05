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
	@GetMapping(value = "getBoardList")
	public String getBoardList(@ModelAttribute("board") Board board, Model model) {
		List<Board> getBoardList = boardService.getBoardList(board);
		model.addAttribute("getBoardList", getBoardList);
		
		return "board/getBoardList";
	}
	
	//게시글 상세 조회
	@GetMapping(value = "getBoard")
	public String getBoard(@RequestParam(value = "boardNo", required = false) Integer boardNo, Model model) {
		System.out.println("/board/getBoard: GET");
		
//		if (boardNo == null) {
//			// TODO => 올바르지 않은 접근이라는 메시지를 전달하고, 게시글 리스트로 리다이렉트
//			return "redirect:/board/getBoardList";
//		}

		Board board = boardService.getBoard(boardNo);
//		if (board == null || "Y".equals(board.getDeleteYn())) {
//			// TODO => 없는 게시글이거나, 이미 삭제된 게시글이라는 메시지를 전달하고, 게시글 리스트로 리다이렉트
//			return "redirect:/board/list.do";
//		}
		model.addAttribute("board", board);

		return "board/getBoard";
	}
	
	//게시글 삭제 처리
	@PostMapping(value = "deleteBoard")
	public String deleteBoard(@RequestParam(value = "boardNo", required = false) Integer boardNo) {
		if (boardNo == null) {
			// TODO => 올바르지 않은 접근이라는 메시지를 전달하고, 게시글 리스트로 리다이렉트
			return "redirect:/board/getBoardList";
		}

		try {
			int isDeleted = boardService.deleteBoard(boardNo);
			if (isDeleted == 0) {
				// TODO => 게시글 삭제에 실패하였다는 메시지를 전달
			}
		} catch (DataAccessException e) {
			// TODO => 데이터베이스 처리 과정에 문제가 발생하였다는 메시지를 전달

		} catch (Exception e) {
			// TODO => 시스템에 문제가 발생하였다는 메시지를 전달
		}

		return "redirect:/board/getBoardList";
	}
	
}//class
