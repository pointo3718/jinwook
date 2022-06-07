package com.jinwook.home.web.board;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Paths;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.service.board.BoardService;
import com.jinwook.home.service.domain.Attach;
import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Comment;
import com.jinwook.home.service.domain.Recipe;
import com.jinwook.home.service.domain.User;
import com.jinwook.home.service.user.UserService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@Autowired
	private UserService userService;
	
	public BoardController(){
		System.out.println(this.getClass());
	}
	
	//1:1문의 등록 화면
	@GetMapping(value = "addBoardInquiryView")
	public String addBoardInquiryView(@RequestParam(value = "boardNo", required = false) Integer boardNo, 
														@RequestParam(value = "userId", required = false) String userId,
			Model model) throws Exception {
		System.out.println("/board/addBoardInquiryView: GET");
		
		if (boardNo == null) {
			model.addAttribute("board", new Board());
		} else {
			Board board = boardService.getBoardInquiry(boardNo);
			User user = userService.getUser(userId);
			if (board == null) {
				return "redirect:/board/list";
				//getBoard 실행결과가 null이면 게시글 리스트 페이지로 리다이렉트
			}
			model.addAttribute("user", user);
			model.addAttribute("board", board);
			System.out.println(user);
			System.out.println(board);
			
			List<Attach> fileList = boardService.getAttachFileList(boardNo);
			model.addAttribute("fileList", fileList);
		}
		return "board/addBoardInquiryView"; //보여줄 화면: .jsp
	}
	
	//1:1문의 등록 + 사진 첨부 처리
	//페이징 처리 후 로직 추가 필요.
	@PostMapping(value = "addBoardInquiry")
	public String addBoardInquiry(final Board board, final MultipartFile[] files, Model model) throws Exception {
		System.out.println("/board/addBoardInquiry: POST");
		
		try {
			boolean isAdded = boardService.addBoardInquiry(board);
			if (isAdded == false) {
				// TODO => 게시글 등록에 실패하였다는 메시지를 전달
			}
		} catch (DataAccessException e) {
			// TODO => 데이터베이스 처리 과정에 문제가 발생하였다는 메시지를 전달

		} catch (Exception e) {
			// TODO => 시스템에 문제가 발생하였다는 메시지를 전달
		}
		return "redirect:/board/getBoardInquiryList";
	}
	
	//공지사항 등록 화면
		@GetMapping(value = "addBoardAnnouncementView")
		public String addBoardAnnouncementView(@RequestParam(value = "boardNo", required = false) Integer boardNo, 
																	@RequestParam(value = "userId", required = false) String userId, Model model) throws Exception {
			System.out.println("/board/addBoardAnnouncementView: GET");
			
			if (boardNo == null) {
				model.addAttribute("board", new Board());
			} else {
				Board board = boardService.getBoardAnnouncement(boardNo);
				User user = userService.getUser(userId);
				if (board == null) {
					return "redirect:/board/list";
					//getBoard 실행결과가 null이면 게시글 리스트 페이지로 리다이렉트
				}
				model.addAttribute("user", user);
				model.addAttribute("board", board);
				System.out.println(user);
				System.out.println(board);
				
				List<Attach> fileList = boardService.getAttachFileList(boardNo);
				model.addAttribute("fileList", fileList);
			}
			return "board/addBoardAnnouncementView"; //보여줄 화면: .jsp
		}
		
		//공지사항 등록 + 사진 첨부 처리
		//페이징 처리 후 로직 추가 필요.
		@PostMapping(value = "addBoardAnnouncement")
		public String addBoardAnnouncement(final Board board, final MultipartFile[] files, Model model) {
			System.out.println("/board/addBoardAnnouncement: POST");
			
			try {
				boolean isAdded = boardService.addBoardAnnouncement(board);
				if (isAdded == false) {
					// TODO => 게시글 등록에 실패하였다는 메시지를 전달
				}
			} catch (DataAccessException e) {
				// TODO => 데이터베이스 처리 과정에 문제가 발생하였다는 메시지를 전달

			} catch (Exception e) {
				// TODO => 시스템에 문제가 발생하였다는 메시지를 전달
			}
			return "redirect:/board/getBoardAnnouncementList";
		}
	
	//1:1문의 목록 조회
	@GetMapping(value = "getBoardInquiryList")
	public String getBoardInquiryList(@ModelAttribute("board") Board board, Model model) {
		List<Board> getBoardInquiryList = boardService.getBoardInquiryList(board);
		model.addAttribute("getBoardInquiryList", getBoardInquiryList);
		return "board/getBoardInquiryList";
	}
	
	//공지사항 목록 조회
	@GetMapping(value = "getBoardAnnouncementList")
	public String getBoardAnnouncementList(@ModelAttribute("board") Board board, Model model) {
		List<Board> getBoardAnnouncementList = boardService.getBoardAnnouncementList(board);
		model.addAttribute("getBoardAnnouncementList", getBoardAnnouncementList);
		
		return "board/getBoardAnnouncementList";
	}
	
	//1:1문의 상세 조회
	@GetMapping(value = "getBoardInquiry")
	public String getBoardInquiry(@ModelAttribute("params") Board params, 
														@RequestParam(value = "boardNo", required = false) Integer boardNo, Model model) {
		System.out.println("/board/getBoardInquiry: GET");
		// 조회수 카운트
		if (boardNo == null) {
			boardService.updateBoardInquiryHits(boardNo);
			// TODO => 올바르지 않은 접근이라는 메시지를 전달하고, 게시글 리스트로 리다이렉트
			return "redirect:/board/getBoardInquiryList";
		}

		Board board = boardService.getBoardInquiry(boardNo);
//		if (board == null || "Y".equals(board.getDeleteYn())) {
//			// TODO => 없는 게시글이거나, 이미 삭제된 게시글이라는 메시지를 전달하고, 게시글 리스트로 리다이렉트
//			return "redirect:/board/list.do";
//		}
		model.addAttribute("board", board);
		
		List<Attach> fileList = boardService.getAttachFileList(boardNo); // 추가된 로직
		model.addAttribute("fileList", fileList); // 추가된 로직

		return "board/getBoardInquiry";
	}
	
	//공지사항 상세 조회
	@GetMapping(value = "getBoardAnnouncement")
	public String getBoardAnnouncement(@ModelAttribute("params") Board params, 
			@RequestParam(value = "boardNo", required = false) Integer boardNo, Model model) {
		System.out.println("/board/getBoardAnnouncement: GET");
		// 조회수 카운트
		boardService.updateBoardAnnouncementHits(boardNo);
		
		if (boardNo == null) {
			// TODO => 올바르지 않은 접근이라는 메시지를 전달하고, 게시글 리스트로 리다이렉트
			return "redirect:/board/getBoardAnnouncementList";
		}
		
		Board board = boardService.getBoardAnnouncement(boardNo);
//		if (board == null || "Y".equals(board.getDeleteYn())) {
//			// TODO => 없는 게시글이거나, 이미 삭제된 게시글이라는 메시지를 전달하고, 게시글 리스트로 리다이렉트
//			return "redirect:/board/list.do";
//		}
		model.addAttribute("board", board);
		
		List<Attach> fileList = boardService.getAttachFileList(boardNo); // 추가된 로직
		model.addAttribute("fileList", fileList); // 추가된 로직
		
		return "board/getBoardAnnouncement";
	}
	
	//1:1문의 삭제 처리
	@PostMapping(value = "deleteBoardInquiry")
	public String deleteBoardInquiry(@RequestParam(value = "boardNo", required = false) Integer boardNo) {
		if (boardNo == null) {
			// TODO => 올바르지 않은 접근이라는 메시지를 전달하고, 게시글 리스트로 리다이렉트
			return "redirect:/board/getBoardInquiryList";
		}

		try {
			int isDeleted = boardService.deleteBoardInquiry(boardNo);
			if (isDeleted == 0) {
				// TODO => 게시글 삭제에 실패하였다는 메시지를 전달
			}
		} catch (DataAccessException e) {
			// TODO => 데이터베이스 처리 과정에 문제가 발생하였다는 메시지를 전달

		} catch (Exception e) {
			// TODO => 시스템에 문제가 발생하였다는 메시지를 전달
		}

		return "redirect:/board/getBoardInquiryList";
	}
	
	//공지사항 삭제 처리
	@PostMapping(value = "deleteBoardAnnouncement")
	public String deleteBoardAnnouncement(@RequestParam(value = "boardNo", required = false) Integer boardNo) {
		if (boardNo == null) {
			// TODO => 올바르지 않은 접근이라는 메시지를 전달하고, 게시글 리스트로 리다이렉트
			return "redirect:/board/getBoardAnnouncementList";
		}
		
		try {
			int isDeleted = boardService.deleteBoardAnnouncement(boardNo);
			if (isDeleted == 0) {
				// TODO => 게시글 삭제에 실패하였다는 메시지를 전달
			}
		} catch (DataAccessException e) {
			// TODO => 데이터베이스 처리 과정에 문제가 발생하였다는 메시지를 전달
			
		} catch (Exception e) {
			// TODO => 시스템에 문제가 발생하였다는 메시지를 전달
		}
		
		return "redirect:/board/getBoardAnnouncementList";
	}
	
	@GetMapping("/board/download.do")
	public void downloadAttachFile(@RequestParam(value = "idx", required = false) final Integer idx, Model model, HttpServletResponse response) {

		if (idx == null) throw new RuntimeException("올바르지 않은 접근입니다.");

		Attach fileInfo = boardService.getAttachDetail(idx);
		if (fileInfo == null || "Y".equals(fileInfo.getDeleteYn())) {
			throw new RuntimeException("파일 정보를 찾을 수 없습니다.");
		}

		String uploadDate = fileInfo.getInsertTime().format(DateTimeFormatter.ofPattern("yyMMdd"));
		String uploadPath = Paths.get("C:", "develop", "upload", uploadDate).toString();

		String filename = fileInfo.getOriginalName();
		File file = new File(uploadPath, fileInfo.getSaveName());

		try {
			byte[] data = FileUtils.readFileToByteArray(file);
			response.setContentType("application/octet-stream");
			response.setContentLength(data.length);
			response.setHeader("Content-Transfer-Encoding", "binary");
			response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(filename, "UTF-8") + "\";");

			response.getOutputStream().write(data);
			response.getOutputStream().flush();
			response.getOutputStream().close();

		} catch (IOException e) {
			throw new RuntimeException("파일 다운로드에 실패하였습니다.");

		} catch (Exception e) {
			throw new RuntimeException("시스템에 문제가 발생하였습니다.");
		}
	}
	
	
	
	@ResponseBody
	@PostMapping(value = "updateRecipeReco")
	public int updateRecipeReco(int rcpNo, String userId) throws Exception {
		System.out.println("/board/updateRecipeReco: POST");
		
		int recoCheck = boardService.recipeRecoCheck(rcpNo, userId);
		if(recoCheck == 0) {
			//추천수 처음 누름
			boardService.addRecipeReco(rcpNo, userId); //recommend테이블에 삽입
			boardService.updateRecipeReco(rcpNo); //recipe테이블 + 1
			boardService.updateRecipeRecoCheck(rcpNo, userId); //recommend 테이블 구분자 1
		} else if(recoCheck == 1) {
			boardService.updateRecipeRecoCheck(rcpNo, userId); //recommend 테이블 구분자 0
			boardService.updateRecipeRecoCheckCancel(rcpNo, userId); //recipe테이블 - 1
			boardService.deleteRecipeReco(rcpNo, userId); //recommend 테이블 삭제
		}
		return recoCheck;
	}
	
	//레시피 등록 화면
		@GetMapping(value = "addRecipeView")
		public String addRecipeView(@RequestParam(value = "rcpNo", required = false) Integer rcpNo, 
													@RequestParam(value = "userId", required = false) String userId,
				Model model) throws Exception {
			System.out.println("/board/addRecipeView: GET");
			
			if (rcpNo == null) {
				model.addAttribute("recipe", new Recipe());
			} else {
				Recipe recipe = boardService.getRecipe(rcpNo);
				User user = userService.getUser(userId);
				if (recipe == null) {
					return "redirect:/board/getRecipeList";
					//getRecipe 실행결과가 null이면 게시글 리스트 페이지로 리다이렉트
				}
				model.addAttribute("user", user);
				model.addAttribute("recipe", recipe);
				System.out.println(user);
				System.out.println(recipe);
				
				List<Attach> fileList = boardService.getAttachFileList(rcpNo);
				model.addAttribute("fileList", fileList);
			}
			return "board/addRecipeView"; //보여줄 화면: .jsp
		}
	
}//class
