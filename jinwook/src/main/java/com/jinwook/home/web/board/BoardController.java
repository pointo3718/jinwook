package com.jinwook.home.web.board;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Paths;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.sonatype.aether.spi.io.FileProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jinwook.home.common.Criteria;
import com.jinwook.home.service.board.BoardService;
import com.jinwook.home.service.domain.Attach;
import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Comment;
import com.jinwook.home.service.domain.Jjim;
import com.jinwook.home.service.domain.Orders;
import com.jinwook.home.service.domain.Recipe;
import com.jinwook.home.service.domain.Store;
import com.jinwook.home.service.domain.User;
import com.jinwook.home.service.orders.OrdersService;
import com.jinwook.home.service.user.UserService;
import com.mysql.cj.log.Log;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	@Qualifier("boardServiceImpl")
	private BoardService boardService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	@Qualifier("ordersServiceImpl")
	private OrdersService ordersService;
	
	public BoardController(){
		System.out.println(this.getClass());
	}
	
	
	//1:1문의 등록 화면
	@GetMapping(value = "addBoardInquiryView")
	public String addBoardInquiryView(@RequestParam(value = "boardNo", required = false) Integer boardNo, 
														@RequestParam(value = "userId", required = false) String userId,
														HttpSession session, Model model) throws Exception {
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
			String sessionUserId = ((User) session.getAttribute("user")).getUserId();
		    user.setUserId(sessionUserId);
		    
			model.addAttribute("user", user);
			model.addAttribute("board", board);
			System.out.println(user);
			System.out.println(board);
		}
		return "board/addBoardInquiryView"; //보여줄 화면: .jsp
	}
	
	//1:1문의등록 + 사진첨부
	@RequestMapping(value = "addBoardInquiry", method = RequestMethod.POST) 
	public String addBoardInquiry(Board board, MultipartHttpServletRequest mpRequest, HttpSession session) throws Exception {
		System.out.println("/board/addBoardInquiry: POST");
		User user = new User();
		String userId = ((User) session.getAttribute("user")).getUserId();
		user.setUserId(userId);
		board.setUser(user);
		
		List<MultipartFile> fileList = mpRequest.getFiles("file");
        String src = mpRequest.getParameter("src");

        String path = "C:\\Users\\impri\\git\\jinwook\\jinwook\\src\\main\\webapp\\resources\\static\\";

        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            System.out.println("fileSize : " + fileSize);

            String safeFile = path + originFileName;
            try {
                mf.transferTo(new File(safeFile));
                boardService.addBoardInquiry(board, mpRequest);
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
		
		return "redirect:/board/getBoardInquiryList";
	}
	
	// 1:1문의 수정 화면v
	@GetMapping(value = "updateBoardInquiryView")
	public String updateBoardInquiryView(@RequestParam(value = "boardNo", required = false) Integer boardNo,
			@RequestParam(value = "userId", required = false) String userId, HttpSession session, Model model)
					throws Exception {
		System.out.println("/board/updateBoardInquiryView: GET");
		
		Board board = boardService.getBoardInquiry(boardNo);
		
		model.addAttribute("board", boardService.getBoardInquiry(boardNo));
//		List<Map<String, Object>> fileList = boardService.selectBoardAttachList(board.getBoardNo());
//		model.addAttribute("file", fileList);
			
		return "board/updateBoardInquiryView"; // 보여줄 화면: .jsp
	}
	
	//1:1문의 수정
	@PostMapping(value = "updateBoardInquiry")
	public String updateBoardInquiry(Board board, Model model) throws Exception {
		System.out.println("/board/updateBoardInquiry: POST");
		
		boardService.updateBoardInquiry(board);
		
		return "redirect:/board/getBoardInquiryList";
	}
	
	//공지사항 등록 화면
		@GetMapping(value = "addBoardAnnouncementView")
		public String addBoardAnnouncementView(@RequestParam(value = "boardNo", required = false) Integer boardNo, 
																	@RequestParam(value = "userId", required = false) String userId, Model model) throws Exception {
			
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
				
			}
			return "board/addBoardAnnouncementView"; //보여줄 화면: .jsp
		}
		
		//공지사항 등록 + 사진 첨부 처리
		@PostMapping(value = "addBoardAnnouncement")
		public String addBoardAnnouncement(Board board, HttpSession session, HttpServletRequest request, 
				MultipartHttpServletRequest mpRequest, Model model) throws Exception {
			System.out.println("/board/addBoardAnnouncement: POST");

			Map<String, Object> pagingParams = getPagingParams(board);
			
			String userId = ((User) session.getAttribute("user")).getUserId();
			User user = new User();
			user.setUserId(userId);
			board.setUser(user);
			
			boardService.addBoardAnnouncement(board, mpRequest);
			
			return "redirect:/board/getBoardAnnouncementList";
		}
		
		// 공지사항 수정 화면v
		@GetMapping(value = "updateBoardAnnouncementView")
		public String updateBoardAnnouncementView(@RequestParam(value = "boardNo", required = false) Integer boardNo,
				@RequestParam(value = "userId", required = false) String userId, HttpSession session, Model model)
				throws Exception {
			System.out.println("/board/updateBoardAnnouncementView: GET");
			
			if (boardNo == null) {
				model.addAttribute("board", new Board());
			} else {
				Board board = boardService.getBoardAnnouncement(boardNo);
//				User user = userService.getUser(userId);
				if (board == null) {
					return "redirect:/board/getBoardAnnouncementList";
					//getBoard 실행결과가 null이면 게시글 리스트 페이지로 리다이렉트
				}
//				String sessionUserId = ((User) session.getAttribute("user")).getUserId();
//				user.setUserId(sessionUserId);
		    
//				model.addAttribute("user", user);
				model.addAttribute("board", board);

			}
			return "board/updateBoardAnnouncementView"; // 보여줄 화면: .jsp
		}
		
		// 공지사항 수정 처리v
		@PostMapping(value = "updateBoardAnnouncement")
		public String updateBoardAnnouncement(@ModelAttribute("board") Board board,
				@RequestParam(value = "boardNo", required = false) Integer boardNo, Model model) {
			System.out.println("/board/updateBoardAnnouncement: POST");
			boardService.updateBoardAnnouncement(board);
			return "redirect:/board/getBoardAnnouncementList";
		}
		
	//1:1문의 목록 조회
	@GetMapping(value = "getBoardInquiryList")
	public String getBoardInquiryList(@ModelAttribute("board") Board board, Model model) throws Exception {
	
//		String userId = ((User) session.getAttribute("user")).getUserId();
//		User user = new User();
//		user.setUserId(userId);
//		board.setUser(user);
		
		List<Board> getBoardInquiryList = boardService.getBoardInquiryList(board);
		model.addAttribute("getBoardInquiryList", getBoardInquiryList);//jsp foreach items
		
		System.out.println("------------------------------------------------"+getBoardInquiryList);
		return "board/getBoardInquiryList";
	}
	
	//공지사항 목록 조회
	@GetMapping(value = "getBoardAnnouncementList")
	public String getBoardAnnouncementList(@ModelAttribute("board") Board board, Model model) throws Exception {
		List<Board> getBoardAnnouncementList = boardService.getBoardAnnouncementList(board);
		model.addAttribute("getBoardAnnouncementList", getBoardAnnouncementList);
		
		return "board/getBoardAnnouncementList";
	}
	
	//1:1문의 상세 조회
	@GetMapping(value = "getBoardInquiry")
	public String getBoardInquiry(@ModelAttribute("board") Board board, @RequestParam(value = "boardNo", required = false) int boardNo, 
			@RequestParam(value = "userId", required = false) String userId,Model model) throws Exception {
		System.out.println("/board/getBoardInquiry: GET");
		
		// 조회수 카운트
		boardService.updateBoardInquiryHits(boardNo);
		//상세 조회
		model.addAttribute("board", boardService.getBoardInquiry(board.getBoardNo()));
		//공지사항 작성자 id
		User user1 = userService.getUser(userId);
		model.addAttribute("user1",user1);
		
		
			Attach attach=new Attach();
			attach = boardService.selectBoardAttachList(board.getBoardNo());
			board.setAttach(attach);
			model.addAttribute("attach",attach);
			
			System.out.println("--------------"+attach);
			System.out.println("------------"+board);
		
//		List<Map<String, Object>> fileList = boardService.selectBoardAttachList(board.getBoardNo());
//		System.out.println(fileList);
//		model.addAttribute("file", fileList);//첨부 파일 리스트 조회할 수 있도록 데이터 전송
		
		List<Comment> commentList = boardService.getInquiryComment(board.getBoardNo());
		model.addAttribute("commentList", commentList);
		
		return "board/getBoardInquiry";
	}
	
	// 1:1 문의 답변(댓글) 작성
	@RequestMapping(value = "addInquiryComment", method = RequestMethod.POST)
	public String addInquiryComment(Comment comment, RedirectAttributes rttr) throws Exception {
		System.out.println("댓글작성: POST");

		boardService.addComment(comment);
		System.out.println("1:1문의 작성 되고 있나? --------------------------------");
		//댓글 작성 후 답변완료로 변경
		Board board = new Board();
		boardService.updateBoardInqStatus(comment.getBoardNo());
		rttr.addAttribute("boardNo", comment.getBoardNo());
		
		return "redirect:/board/getBoardInquiry?boardNo="+comment.getBoardNo();
	}
	
	//공지사항 상세 조회 - 파일첨부
	@GetMapping(value = "getBoardAnnouncement")
	public String getBoardAnnouncement(@ModelAttribute("board") Board board, @RequestParam(value = "boardNo", required = false) int boardNo, 
			@RequestParam(value = "userId", required = false) String userId, Model model, HttpSession session) throws Exception {
		System.out.println("/board/getBoardAnnouncement: GET");
		
		//공지사항 작성자 id
		User user1 = userService.getUser(userId);
		model.addAttribute("user1",user1);
		// 조회수 카운트
		boardService.updateBoardAnnouncementHits(boardNo);
		//상세 조회
		model.addAttribute("board", boardService.getBoardAnnouncement(board.getBoardNo()));
		
			Attach attach = new Attach();
			attach = boardService.selectBoardAttachList(board.getBoardNo());
			board.setAttach(attach);
			model.addAttribute("attach", attach);
		
		System.out.println("--------------"+attach);
		System.out.println("------------"+board);
		
		
		return "board/getBoardAnnouncement";
	}
	
//	//1:1문의 삭제 처리
//	@PostMapping(value = "deleteBoardInquiry")
//	public String deleteBoardInquiry(@RequestParam(value = "boardNo", required = false) Integer boardNo) {
//		if (boardNo == null) {
//			// TODO => 올바르지 않은 접근이라는 메시지를 전달하고, 게시글 리스트로 리다이렉트
//			return "redirect:/board/getBoardInquiryList";
//		}
//
//			int isDeleted = boardService.deleteBoardInquiry(boardNo);
//
//		return "redirect:/board/getBoardInquiryList";
//	}
	
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
	
	
	// 레시피 등록 화면v
	@GetMapping(value = "addRecipeView")
	public String addRecipeView(@RequestParam(value = "rcpNo", required = false) Integer rcpNo,
			@RequestParam(value = "userId", required = false) String userId, Model model) throws Exception {
		System.out.println("/board/addRecipeView: GET");

		if (rcpNo == null) {
			model.addAttribute("recipe", new Recipe());
		} else {
			Recipe recipe = boardService.getRecipe(rcpNo);
			User user = userService.getUser(userId);
			if (recipe == null) {
				return "redirect:/board/getRecipeList";
				// getRecipe 실행결과가 null이면 게시글 리스트 페이지로 리다이렉트
			}
			model.addAttribute("user", user);
			model.addAttribute("recipe", recipe);
			System.out.println(user);
			System.out.println(recipe);
		}
		return "board/addRecipeView"; // 보여줄 화면: .jsp
	}
	
	
		//레시피 등록 처리v
		//페이징 처리 후 로직 추가 필요.
		@PostMapping(value = "addRecipe")//MultipartFile files = <input type name="files">
		public String addRecipe(Recipe recipe,  MultipartHttpServletRequest mpRequest, HttpSession session) throws Exception {
			System.out.println("/board/addRecipe: POST");
			
			String userId = ((User) session.getAttribute("user")).getUserId();
			User user = new User();
			user.setUserId(userId);
			recipe.setUser(user);
			
			List<MultipartFile> fileList = mpRequest.getFiles("file");
	        String src = mpRequest.getParameter("src");

	        String path = "C:\\Users\\impri\\git\\jinwook\\jinwook\\src\\main\\webapp\\resources\\static\\";

	        for (MultipartFile mf : fileList) {
	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	            long fileSize = mf.getSize(); // 파일 사이즈

	            System.out.println("originFileName : " + originFileName);
	            System.out.println("fileSize : " + fileSize);

	            String safeFile = path + originFileName;
	            System.out.println(safeFile);
	            try {
	                mf.transferTo(new File(safeFile));
	                boardService.addRecipe(recipe, mpRequest);//레시피 등록
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }
			return "redirect:/board/getRecipeList";
		}
		
		// 레시피 수정 화면v
		@GetMapping(value = "updateRecipeView")
		public String updateRecipeView(@RequestParam(value = "rcpNo", required = false) Integer rcpNo,
				@RequestParam(value = "userId", required = false) String userId, HttpSession session, Model model)
				throws Exception {
			System.out.println("/board/updateRecipeView: GET");
			
			Recipe recipe = boardService.getRecipe(rcpNo);
			model.addAttribute("recipe", boardService.getRecipe(rcpNo));
//		    List<Map<String, Object>> fileList = boardService.selectRecipeAttachList(recipe.getRcpNo());
//		    model.addAttribute("file", fileList);
		    
			return "board/updateRecipeView"; // 보여줄 화면: .jsp
		}
		
		//레시피 수정 처리v
		@PostMapping(value = "updateRecipe")
		public String updateRecipe(@ModelAttribute("recipe") Recipe recipe, 
				@RequestParam(value = "rcpNo", required = false) Integer rcpNo, Model model) {
			System.out.println("/board/updateRecipe: POST");
			boardService.updateRecipe(recipe);
			return "redirect:/board/getRecipeList?rcpNo="+recipe.getRcpNo();
		}
		
		//레시피 삭제 처리v
//		@PostMapping(value = "deleteRecipe")
//		public String deleteRecipe(@RequestParam(value = "rcpNo", required = false) Integer rcpNo) {
//			System.out.println("/board/deleteRecipe: POST");
//			boardService.deleteRecipe(rcpNo);
//			return "redirect:/board/getRecipeList";
//		}
		
		//레시피 목록 조회
		@GetMapping(value = "getRecipeList")
		public String getRecipeList(@ModelAttribute("recipe") Recipe recipe, Model model) throws Exception {
			List<Recipe> getRecipeList = boardService.getRecipeList(recipe);
			
			System.out.println(getRecipeList.size());
			
			for (Recipe recipe2 : getRecipeList) {
				Attach attach = new Attach();
				attach = boardService.selectRecipeAttachList(recipe2.getRcpNo());
				recipe2.setAttach(attach);
			}
			
			model.addAttribute("getRecipeList", getRecipeList);
			System.out.println(getRecipeList);
			return "board/getRecipeList";
		}
		
		//레시피 상세 조회 + 조회수 증가
		//@RequestParam userId는 레시피 작성자 id
		@GetMapping(value = "getRecipe")
		public String getRecipe(@ModelAttribute("recipe") Recipe recipe, @RequestParam(value = "rcpNo", required = false) Integer rcpNo, 
											@RequestParam(value = "userId", required = false) String userId,
											Model model) throws Exception {
			System.out.println("/board/getRecipe : GET");

			// 조회수 카운트
			boardService.updateBoardRecipeHits(rcpNo);
			//레시피 상세 조회
			model.addAttribute("recipe", boardService.getRecipe(recipe.getRcpNo()));
			//레시피 작성자 id
			User user1 = userService.getUser(userId);
			model.addAttribute("user1",user1);
			
			Attach attach = new Attach();
			attach = boardService.selectRecipeAttachList(recipe.getRcpNo());
			recipe.setAttach(attach);
			model.addAttribute("attach", attach);
			
			System.out.println("+++++++++"+attach);
			System.out.println("+++++++++"+recipe);
			
			//댓글 조회
			List<Comment> commentList = boardService.getRecipeComment(recipe.getRcpNo());
			model.addAttribute("commentList", commentList);
			
			return "board/getRecipe";
		}
		
		// 레시피(댓글) 작성
		@RequestMapping(value = "addRecipeComment", method = RequestMethod.POST)
		public String addRecipeComment(Comment comment, RedirectAttributes rttr, HttpSession session) throws Exception {
			System.out.println("레시피 댓글작성: POST");
			
//			String userId = (String) session.getAttribute("userId");
//			comment.setCommentWriter(userId);
			
			boardService.addRecipeComment(comment);
			
			rttr.addAttribute("rcpNo", comment.getRcpNo());
			
			return "redirect:/board/getRecipe?boardNo="+comment.getRcpNo();
		}
		
		//레시피 댓글 수정 처리 POST
		@PostMapping("/commentUpdate{commentNo}/{commentContent}")
		public Map<String, Object> commentUpdate(@PathVariable int commentNo, @PathVariable String commentContent) throws Exception {
			System.out.println("레시피 댓글수정처리: POST");
			Map<String, Object> map = new HashMap<String, Object>();
			try {
				Comment comment = new Comment();
				comment.setCommentNo(commentNo);
				comment.setCommentContent(commentContent);
				boardService.updateRecipeComment(comment);
				
				map.put("result", "success");
			} catch(Exception e) {
				e.printStackTrace();
				map.put("result", "fail");
			}
			return map;
		}
		
		//댓글 삭제 GET
		@RequestMapping(value="commentDeleteView", method = RequestMethod.GET)
		public String commentDeleteView(Comment comment, Model model) throws Exception {
			System.out.println("레시피 댓글삭제화면: GET");
			
			model.addAttribute("commentDelete", boardService.selectRecipeComment(comment.getCommentNo()));

			return "board/commentDeleteView";
		}
		
//		//댓글 삭제
//		@RequestMapping(value="commentDelete", method = RequestMethod.POST)
//		public String commentDelete(Comment comment,RedirectAttributes rttr) throws Exception {
//			System.out.println("레시피 댓글삭제처리: POST");
//			
//			boardService.deleteRecipeComment(comment);
//			
//			rttr.addAttribute("bno", comment.getRcpNo());
//			
//			return "redirect:/board/getRecipe";
//		}
		
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
			int recoCheck = boardService.recipeRecoCheck(rcpNo,userId);//성공1
			System.out.println(recoCheck);//0
			if(recoCheck == 0) {
				//추천수 처음 누름
				boardService.addRecipeReco(rcpNo, userId); //recommend테이블에 삽입 //성공2
				System.out.println(boardService.addRecipeReco(rcpNo, userId));
				boardService.updateRecipeReco(rcpNo); //recipe테이블 + 1 //
				System.out.println(rcpNo);
				boardService.updateRecipeRecoCheck(rcpNo, userId); //recommend 테이블 구분자 1 //
			} else if(recoCheck == 1) {
				boardService.updateRecipeRecoCheck(rcpNo, userId); //recommend 테이블 구분자 0 //
				boardService.updateRecipeRecoCheckCancel(rcpNo, userId); //recipe테이블 - 1 //
				boardService.deleteRecipeReco(rcpNo, userId); //recommend 테이블 삭제 //
			}
			return recoCheck;
		}
		
		
		//상점 후기 등록: update data : 성공
		@PostMapping(value = "addReview")
		public String addReview(@ModelAttribute("orders")Orders orders, Model model) {
			System.out.println("/board/addReview: POST");
			
			//주문번호로 리뷰내용 업데이트
			boardService.updateReview(orders);
			System.out.println("상점 후기 등록 완료!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!111");
			
			return "redirect:/orders/getOrdersList";
		}
		
		//상점 후기 내용 조회
		@GetMapping(value = "getReview")
		public String getReview(@RequestParam(value = "orderNo", required = false) int orderNo , 
											@RequestParam(value = "userId", required = false) String userId, Model model) throws Exception {
			System.out.println("/board/getReview : GET");
			
			User user = userService.getUser(userId);
			model.addAttribute("user", user);
//			Orders orders = boardService.getReview(orderNo);
//			model.addAttribute("orders", orders);
			return "board/getReview";
		}
		
		//상점후기 목록 조회 - 상점상세에서 상점후기버튼
		@GetMapping(value = "getReviewList")
		public String getReviewList(@ModelAttribute("orders") Orders orders, HttpSession session, Model model) throws Exception {
			List<Orders> getReviewList = boardService.getReviewList(orders);
			
			System.out.println(getReviewList.size());
			Store store = new Store();
			
			String userId = ((User) session.getAttribute("user")).getUserId();
			store.setUserId(userId);
			
			model.addAttribute("getReviewList", getReviewList);
			System.out.println("후기 목록 조회 성공!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+getReviewList);
			
			
			return "store/getStore?storeNo="+store.getStoreNo();
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
