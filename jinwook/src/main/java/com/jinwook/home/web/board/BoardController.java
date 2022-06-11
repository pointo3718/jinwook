package com.jinwook.home.web.board;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Paths;
import java.time.format.DateTimeFormatter;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.service.board.BoardService;
import com.jinwook.home.service.domain.Attach;
import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Comment;
import com.jinwook.home.service.domain.Jjim;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Recipe;
import com.jinwook.home.service.domain.User;
import com.jinwook.home.service.orders.OrdersService;
import com.jinwook.home.service.user.UserService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrdersService ordersService;
	
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
	
	//1:1문의 등록/수정 + 사진 첨부 처리
	//페이징 처리 후 로직 추가 필요.
	@PostMapping(value = "addBoardInquiry")
	public String addBoardInquiry(final Board board, MultipartHttpServletRequest mpRequest, Model model) throws Exception {
		System.out.println("/board/addBoardInquiry: POST");
		Map<String, Object> pagingParams = getPagingParams(board);
		boolean isAdded = boardService.addBoardInquiry(board);
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
		
		//공지사항 등록/수정 + 사진 첨부 처리
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
		model.addAttribute("getBoardInquiryList", getBoardInquiryList);//jsp foreach items
		System.out.println(getBoardInquiryList);
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
		boardService.updateBoardInquiryHits(boardNo);

		Board board = boardService.getBoardInquiry(boardNo);
		model.addAttribute("board", board);
		
		List<Attach> fileList = boardService.getAttachFileList(boardNo); // 추가된 로직
		model.addAttribute("fileList", fileList); // 추가된 로직

		return "board/getBoardInquiry";
	}
	
	//공지사항 상세 조회 - 파일첨부
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

			int isDeleted = boardService.deleteBoardInquiry(boardNo);

		return "redirect:/board/getBoardInquiryList";
	}
	
	//공지사항 삭제 처리
	@PostMapping(value = "deleteBoardAnnouncement")
	public String deleteBoardAnnouncement(@RequestParam(value = "boardNo", required = false) Integer boardNo) {
		if (boardNo == null) {
			// TODO => 올바르지 않은 접근이라는 메시지를 전달하고, 게시글 리스트로 리다이렉트
			return "redirect:/board/getBoardAnnouncementList";
		}
		int isDeleted = boardService.deleteBoardAnnouncement(boardNo);
		
		return "redirect:/board/getBoardAnnouncementList";
	}
	
	//다운로드
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
		
		//레시피 등록 처리
		//페이징 처리 후 로직 추가 필요.
		@PostMapping(value = "addRecipe")
		public String addRecipe(final Recipe recipe, final MultipartFile[] files, Model model) throws Exception {
			System.out.println("/board/addRecipe: POST");
				boardService.addRecipe(recipe);
			return "redirect:/board/getRecipeList";
		}
		
		//레시피 수정 처리
		@PostMapping(value = "updateRecipe")
		public String updateRecipe(@ModelAttribute("recipe") Recipe recipe, final MultipartFile[] files, Model model) {
			System.out.println("/board/updateRecipe: POST");
			boardService.updateRecipe(recipe);
			return "redirect:/board/getRecipeList";
		}
		
		//레시피 삭제 처리
		@PostMapping(value = "deleteRecipe")
		public String deleteRecipe(@RequestParam(value = "rcpNo", required = false) Integer rcpNo) {
			System.out.println("/board/deleteRecipe: POST");
			boardService.deleteRecipe(rcpNo);
			return "redirect:/board/getRecipeList";
		}
		
		//레시피 목록 조회
		@GetMapping(value = "getRecipeList")
		public String getRecipeList(@ModelAttribute("rcp") Recipe rcp, Model model) {
			List<Recipe> getRecipeList = boardService.getRecipeList(rcp);
			model.addAttribute("getRecipeList", getRecipeList);
			return "board/getRecipeList";
		}
		
		//레시피 상세 조회 + 조회수 증가
		//@RequestParam userId는 레시피 작성자 id
		@GetMapping(value = "getRecipe")
		public String getRecipe(@RequestParam(value = "rcpNo", required = false) Integer rcpNo, 
											@RequestParam(value = "userId", required = false) String userId,
											Model model,HttpSession session) throws Exception {
			System.out.println("/board/getRecipe : GET");
			// 조회수 카운트
			boardService.updateBoardRecipeHits(rcpNo);

			Recipe recipe = boardService.getRecipe(rcpNo);
			//레시피 작성자 id
			User user1 = userService.getUser(userId);
			//추천을 누르는 로그인한 유저 id
			User user2 = userService.getUser(((User) session.getAttribute("user")).getUserId());
			
			//model.addAttribute("recoUserId",recoUserId);
			model.addAttribute("user1",user1);
			model.addAttribute("user2",user2);
			model.addAttribute("recipe",recipe);
			
			return "board/getRecipe";
		}
		
		//레시피 추천수 /board/updateRecipeReco	
		@ResponseBody
		@PostMapping(value = "updateRecipeReco")
		public int updateRecipeReco(@RequestParam(value = "rcpNo", required = false) Integer rcpNo , 
													Model model,HttpSession session) throws Exception {
			System.out.println("/board/updateRecipeReco: POST");
			String userId = ((User) session.getAttribute("user")).getUserId();
			//추천을 누르는 로그인한 유저 id
			//((User) session.getAttribute("user")).getUserId();
			System.out.println(rcpNo);
			int recoCheck = boardService.recipeRecoCheck(rcpNo,userId);//성공
			System.out.println(recoCheck);//0
			if(recoCheck == 0) {
				//추천수 처음 누름
				boardService.addRecipeReco(rcpNo, userId); //recommend테이블에 삽입 //성공
				System.out.println(boardService.addRecipeReco(rcpNo, userId));
				boardService.updateRecipeReco(rcpNo); //recipe테이블 + 1 //성공
				System.out.println(rcpNo);
				boardService.updateRecipeRecoCheck(rcpNo, userId); //recommend 테이블 구분자 1 //??
			} else if(recoCheck == 1) {
				boardService.updateRecipeRecoCheck(rcpNo, userId); //recommend 테이블 구분자 0 //
				boardService.updateRecipeRecoCheckCancel(rcpNo, userId); //recipe테이블 - 1 //
				boardService.deleteRecipeReco(rcpNo, userId); //recommend 테이블 삭제 //
			}
			return recoCheck;
		}
		
		//댓글 추천수 /board/updateCommentReco	
		//레시피 추천은 레시피 번호 하나를 ?rcpNo=1로 할 수 있었는데 댓글은 게시판에 달린건데 어떻게 추천하지? boardNo, commentNo 둘다 필요한가?
		@ResponseBody
		@PostMapping(value = "updateCommentReco")
		public int updateCommentReco(@RequestParam(value = "commentNo", required = false) Integer commentNo , 
													Model model,HttpSession session) throws Exception {
			System.out.println("/board/updateCommentReco: POST");
			String userId = ((User) session.getAttribute("user")).getUserId();
			System.out.println(commentNo);
			int recoCheck = boardService.commentRecoCheck(commentNo,userId);//성공v
			System.out.println(recoCheck);//0
			if(recoCheck == 0) {
				//추천수 처음 누름
				boardService.addCommentReco(commentNo, userId); //recommend테이블에 삽입 //성공v
				System.out.println(boardService.addCommentReco(commentNo, userId));
				boardService.updateCommentReco(commentNo); //recipe테이블 + 1 //성공v
				System.out.println(commentNo);
				boardService.updateCommentRecoCheck(commentNo, userId); //recommend 테이블 구분자 1 //v
			} else if(recoCheck == 1) {
				boardService.commentRecoCheck(commentNo, userId); //recommend 테이블 구분자 0 //v
				boardService.updateCommentRecoCheckCancel(commentNo, userId); //recipe테이블 - 1 //v
				boardService.deleteCommentReco(commentNo, userId); //recommend 테이블 삭제 //v
			}
			return recoCheck;
		}
		
		//상점 후기 등록 화면
		@GetMapping(value = "addReviewView") 
		public String addReviewView() {
			System.out.println("/board/addReviewView : GET");
			return "redirect:/board/addReviewView";
		}
		
		//상점 후기 등록 처리
		@PostMapping(value = "addReview")
		public String addReview(@ModelAttribute("orders") Orders orders) {
			System.out.println("/board/addReview : POST");
			boardService.addReview(orders);
			return "redirect:/board/addReviewView";
		}
		
		//상점 후기 내용 조회
		@GetMapping(value = "getReview")
		public String getReview(@RequestParam(value = "orderNo", required = false) int orderNo , 
											@RequestParam(value = "userId", required = false) String userId, Model model) throws Exception {
			System.out.println("/board/getReview : GET");
			
			User user = userService.getUser(userId);
			model.addAttribute("user", user);
			Orders orders = boardService.getReview(orderNo);
			model.addAttribute("orders", orders);
			return "board/getReview";
		}
		
		//상점 후기 삭제 처리
		@PostMapping(value = "deleteReview")
		public String deleteReview(@RequestParam(value = "orderNo", required = false) int orderNo) {
			System.out.println("/board/deleteReview : POST");
			boardService.deleteReview(orderNo);
			return "redirect:/board/addReviewView";
		}
		
		//페이징 파람스
		public Map<String, Object> getPagingParams(Criteria criteria) {

			Map<String, Object> params = new LinkedHashMap<>();
			params.put("currentPageNo", criteria.getCurrentPageNo());
			params.put("recordsPerPage", criteria.getRecordsPerPage());
			params.put("pageSize", criteria.getPageSize());
			params.put("searchType", criteria.getSearchType());
			params.put("searchKeyword", criteria.getSearchKeyword());

			return params;
		}
		
		
}//class
