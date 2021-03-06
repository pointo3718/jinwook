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
	
	
	//1:1?????? ?????? ??????
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
				//getBoard ??????????????? null?????? ????????? ????????? ???????????? ???????????????
			}
			String sessionUserId = ((User) session.getAttribute("user")).getUserId();
		    user.setUserId(sessionUserId);
		    
			model.addAttribute("user", user);
			model.addAttribute("board", board);
			System.out.println(user);
			System.out.println(board);
		}
		return "board/addBoardInquiryView"; //????????? ??????: .jsp
	}
	
	//1:1???????????? + ????????????
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
            String originFileName = mf.getOriginalFilename(); // ?????? ?????? ???
            long fileSize = mf.getSize(); // ?????? ?????????

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
	
	// 1:1?????? ?????? ??????v
	@GetMapping(value = "updateBoardInquiryView")
	public String updateBoardInquiryView(@RequestParam(value = "boardNo", required = false) Integer boardNo,
			@RequestParam(value = "userId", required = false) String userId, HttpSession session, Model model)
					throws Exception {
		System.out.println("/board/updateBoardInquiryView: GET");
		
		Board board = boardService.getBoardInquiry(boardNo);
		
		model.addAttribute("board", boardService.getBoardInquiry(boardNo));
//		List<Map<String, Object>> fileList = boardService.selectBoardAttachList(board.getBoardNo());
//		model.addAttribute("file", fileList);
			
		return "board/updateBoardInquiryView"; // ????????? ??????: .jsp
	}
	
	//1:1?????? ??????
	@PostMapping(value = "updateBoardInquiry")
	public String updateBoardInquiry(Board board, Model model) throws Exception {
		System.out.println("/board/updateBoardInquiry: POST");
		
		boardService.updateBoardInquiry(board);
		
		return "redirect:/board/getBoardInquiryList";
	}
	
	//???????????? ?????? ??????
		@GetMapping(value = "addBoardAnnouncementView")
		public String addBoardAnnouncementView(@RequestParam(value = "boardNo", required = false) Integer boardNo, 
																	@RequestParam(value = "userId", required = false) String userId, Model model) throws Exception {
			
			if (boardNo == null) {
				model.addAttribute("board", new Board());
			} else {
				Board board = boardService.getBoardAnnouncement(boardNo);
				User user = userService.getUser(userId);
				if (board == null) {
					return "redirect:/board/getBoardAnnouncementList";
					//getBoard ??????????????? null?????? ????????? ????????? ???????????? ???????????????
				}
				model.addAttribute("user", user);
				model.addAttribute("board", board);
				System.out.println(user);
				System.out.println(board);
				
			}
			return "board/addBoardAnnouncementView"; //????????? ??????: .jsp
		}
		
		//???????????? ?????? + ?????? ?????? ??????
		@PostMapping(value = "addBoardAnnouncement")
		public String addBoardAnnouncement(Board board, HttpSession session, HttpServletRequest request, 
				MultipartHttpServletRequest mpRequest, Model model) throws Exception {
			System.out.println("/board/addBoardAnnouncement: POST");

			Map<String, Object> pagingParams = getPagingParams(board);
			
			String userId = ((User) session.getAttribute("user")).getUserId();
			User user = new User();
			user.setUserId(userId);
			board.setUser(user);
			
			List<MultipartFile> fileList = mpRequest.getFiles("file");
	        String src = mpRequest.getParameter("src");

	        String path = "C:\\Users\\impri\\git\\jinwook\\jinwook\\src\\main\\webapp\\resources\\static\\";

	        for (MultipartFile mf : fileList) {
	            String originFileName = mf.getOriginalFilename(); // ?????? ?????? ???
	            long fileSize = mf.getSize(); // ?????? ?????????

	            System.out.println("originFileName : " + originFileName);
	            System.out.println("fileSize : " + fileSize);

	            String safeFile = path + originFileName;
	            try {
	                mf.transferTo(new File(safeFile));
	                boardService.addBoardAnnouncement(board, mpRequest);
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }
			return "redirect:/board/getBoardAnnouncementList";
		}
		
		// ???????????? ?????? ??????v
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
					//getBoard ??????????????? null?????? ????????? ????????? ???????????? ???????????????
				}
//				String sessionUserId = ((User) session.getAttribute("user")).getUserId();
//				user.setUserId(sessionUserId);
		    
//				model.addAttribute("user", user);
				model.addAttribute("board", board);

			}
			return "board/updateBoardAnnouncementView"; // ????????? ??????: .jsp
		}
		
		// ???????????? ?????? ??????v
		@PostMapping(value = "updateBoardAnnouncement")
		public String updateBoardAnnouncement(@ModelAttribute("board") Board board,
				@RequestParam(value = "boardNo", required = false) Integer boardNo, Model model) {
			System.out.println("/board/updateBoardAnnouncement: POST");
			boardService.updateBoardAnnouncement(board);
			return "redirect:/board/getBoardAnnouncementList";
		}
		
	//1:1?????? ?????? ????????? ??????
	@GetMapping(value = "getBoardInquiryList")
	public String getBoardInquiryList(@ModelAttribute("board") Board board, HttpSession session, Model model) throws Exception {
	
		String userId = ((User) session.getAttribute("user")).getUserId();
		User user = new User();
		user.setUserId(userId);
		board.setUser(user);
		
		List<Board> getBoardInquiryList = boardService.getBoardInquiryList(board);
		model.addAttribute("getBoardInquiryList", getBoardInquiryList);//jsp foreach items
		
		System.out.println("------------------------------------------------"+getBoardInquiryList);
		return "board/listBoardInquiry";
	}

	//1:1?????? ?????? ??????
	@GetMapping(value = "getBoardAdminInquiryList")
	public String getBoardAdminInquiryList(@ModelAttribute("board") Board board, HttpSession session, Model model) throws Exception {
		
		String userId = ((User) session.getAttribute("user")).getUserId();
		User user = new User();
		user.setUserId(userId);
		board.setUser(user);
		
		List<Board> getBoardAdminInquiryList = boardService.getBoardAdminInquiryList(board);
		model.addAttribute("getBoardAdminInquiryList", getBoardAdminInquiryList);//jsp foreach items
		model.addAttribute("user", user);//jsp foreach items
		
		System.out.println("------------------------------------------------"+getBoardAdminInquiryList);
		return "board/listBoardAdminInquiry";
	}
	
	//???????????? ?????? ??????
	@GetMapping(value = "getBoardAnnouncementList")
	public String getBoardAnnouncementList(@ModelAttribute("board") Board board, Model model) throws Exception {
		List<Board> getBoardAnnouncementList = boardService.getBoardAnnouncementList(board);
		model.addAttribute("getBoardAnnouncementList", getBoardAnnouncementList);
		
		return "board/listBoardAnnouncement";
	}
	
	//1:1?????? ?????? ??????
	@GetMapping(value = "getBoardInquiry")
	public String getBoardInquiry(@ModelAttribute("board") Board board, @RequestParam(value = "boardNo", required = false) int boardNo, 
			@RequestParam(value = "userId", required = false) String userId,Model model) throws Exception {
		System.out.println("/board/getBoardInquiry: GET");
		
		// ????????? ?????????
		boardService.updateBoardInquiryHits(boardNo);
		//?????? ??????
		model.addAttribute("board", boardService.getBoardInquiry(board.getBoardNo()));
		//???????????? ????????? id
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
//		model.addAttribute("file", fileList);//?????? ?????? ????????? ????????? ??? ????????? ????????? ??????
		
		List<Comment> commentList = boardService.getInquiryComment(board.getBoardNo());
		model.addAttribute("commentList", commentList);
		
		return "board/getBoardInquiry";
	}
	
	// 1:1 ?????? ??????(??????) ??????
	@RequestMapping(value = "addInquiryComment", method = RequestMethod.POST)
	public String addInquiryComment(Comment comment, RedirectAttributes rttr) throws Exception {
		System.out.println("????????????: POST");

		boardService.addComment(comment);
		System.out.println("1:1?????? ?????? ?????? ??????? --------------------------------");
		//?????? ?????? ??? ??????????????? ??????
		Board board = new Board();
		boardService.updateBoardInqStatus(comment.getBoardNo());
		rttr.addAttribute("boardNo", comment.getBoardNo());
		
		return "redirect:/board/getBoardInquiry?boardNo="+comment.getBoardNo();
	}
	
	//???????????? ?????? ?????? - ????????????
	@GetMapping(value = "getBoardAnnouncement")
	public String getBoardAnnouncement(@ModelAttribute("board") Board board, @RequestParam(value = "boardNo", required = false) int boardNo, 
			@RequestParam(value = "userId", required = false) String userId, Model model, HttpSession session) throws Exception {
		System.out.println("/board/getBoardAnnouncement: GET");
		
		//???????????? ????????? id
		User user1 = userService.getUser(userId);
		model.addAttribute("user1",user1);
		// ????????? ?????????
		boardService.updateBoardAnnouncementHits(boardNo);
		//?????? ??????
		model.addAttribute("board", boardService.getBoardAnnouncement(board.getBoardNo()));
		
			Attach attach = new Attach();
			attach = boardService.selectBoardAttachList(board.getBoardNo());
			board.setAttach(attach);
			model.addAttribute("attach", attach);
		
		System.out.println("--------------"+attach);
		System.out.println("------------"+board);
		
		
		return "board/getBoardAnnouncement";
	}
	
//	//1:1?????? ?????? ??????
//	@PostMapping(value = "deleteBoardInquiry")
//	public String deleteBoardInquiry(@RequestParam(value = "boardNo", required = false) Integer boardNo) {
//		if (boardNo == null) {
//			// TODO => ???????????? ?????? ??????????????? ???????????? ????????????, ????????? ???????????? ???????????????
//			return "redirect:/board/getBoardInquiryList";
//		}
//
//			int isDeleted = boardService.deleteBoardInquiry(boardNo);
//
//		return "redirect:/board/getBoardInquiryList";
//	}
	
	//???????????? ?????? ??????
	@PostMapping(value = "deleteBoardAnnouncement")
	public String deleteBoardAnnouncement(@RequestParam(value = "boardNo", required = false) Integer boardNo) {
		if (boardNo == null) {
			// TODO => ???????????? ?????? ??????????????? ???????????? ????????????, ????????? ???????????? ???????????????
			return "redirect:/board/listBoardAnnouncement";
		}
		int isDeleted = boardService.deleteBoardAnnouncement(boardNo);
		
		return "redirect:/board/getBoardAnnouncementList";
	}
	
	
	// ????????? ?????? ??????v
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
				return "redirect:/board/listBoardRecipe";
				// getRecipe ??????????????? null?????? ????????? ????????? ???????????? ???????????????
			}
			model.addAttribute("user", user);
			model.addAttribute("recipe", recipe);
			System.out.println(user);
			System.out.println(recipe);
		}
		return "board/addBoardRecipeView"; // ????????? ??????: .jsp
	}
	
	
		//????????? ?????? ??????v
		//????????? ?????? ??? ?????? ?????? ??????.
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
	            String originFileName = mf.getOriginalFilename(); // ?????? ?????? ???
	            long fileSize = mf.getSize(); // ?????? ?????????

	            System.out.println("originFileName : " + originFileName);
	            System.out.println("fileSize : " + fileSize);

	            String safeFile = path + originFileName;
	            System.out.println(safeFile);
	            try {
	                mf.transferTo(new File(safeFile));
	                boardService.addRecipe(recipe, mpRequest);//????????? ??????
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
		
		// ????????? ?????? ??????v
		@GetMapping(value = "updateRecipeView")
		public String updateRecipeView(@RequestParam(value = "rcpNo", required = false) Integer rcpNo,
				@RequestParam(value = "userId", required = false) String userId, HttpSession session, Model model)
				throws Exception {
			System.out.println("/board/updateRecipeView: GET");
			
			Recipe recipe = boardService.getRecipe(rcpNo);
			model.addAttribute("recipe", boardService.getRecipe(rcpNo));
//		    List<Map<String, Object>> fileList = boardService.selectRecipeAttachList(recipe.getRcpNo());
//		    model.addAttribute("file", fileList);
		    
			return "board/updateBoardRecipeView"; // ????????? ??????: .jsp
		}
		
		//????????? ?????? ??????v
		@PostMapping(value = "updateRecipe")
		public String updateRecipe(@ModelAttribute("recipe") Recipe recipe, 
				@RequestParam(value = "rcpNo", required = false) Integer rcpNo, Model model) {
			System.out.println("/board/updateRecipe: POST");
			boardService.updateRecipe(recipe);
			return "redirect:/board/getRecipeList";
		}
		
		//????????? ?????? ??????v
//		@PostMapping(value = "deleteRecipe")
//		public String deleteRecipe(@RequestParam(value = "rcpNo", required = false) Integer rcpNo) {
//			System.out.println("/board/deleteRecipe: POST");
//			boardService.deleteRecipe(rcpNo);
//			return "redirect:/board/getRecipeList";
//		}
		
		//????????? ?????? ??????
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
			return "board/listBoardRecipe";
		}
		
		//????????? ?????? ?????? + ????????? ??????
		//@RequestParam userId??? ????????? ????????? id
		@GetMapping(value = "getRecipe")
		public String getRecipe(@ModelAttribute("recipe") Recipe recipe, @RequestParam(value = "rcpNo", required = false) Integer rcpNo, 
											@RequestParam(value = "userId", required = false) String userId,
											Model model) throws Exception {
			System.out.println("/board/getRecipe : GET");

			// ????????? ?????????
			boardService.updateBoardRecipeHits(rcpNo);
			//????????? ?????? ??????
			model.addAttribute("recipe", boardService.getRecipe(recipe.getRcpNo()));
			//????????? ????????? id
			User user1 = userService.getUser(userId);
			model.addAttribute("user1",user1);
			
			Attach attach = new Attach();
			attach = boardService.selectRecipeAttachList(recipe.getRcpNo());
			recipe.setAttach(attach);
			model.addAttribute("attach", attach);
			
			System.out.println("+++++++++"+attach);
			System.out.println("+++++++++"+recipe);
			
			//?????? ??????
			List<Comment> commentList = boardService.getRecipeComment(recipe.getRcpNo());
			model.addAttribute("commentList", commentList);
			
			return "board/getBoardRecipe";
		}
		
		// ?????????(??????) ??????
		@RequestMapping(value = "addRecipeComment", method = RequestMethod.POST)
		public String addRecipeComment(Comment comment, RedirectAttributes rttr, HttpSession session) throws Exception {
			System.out.println("????????? ????????????: POST");
			
//			String userId = (String) session.getAttribute("userId");
//			comment.setCommentWriter(userId);
			
			boardService.addRecipeComment(comment);
			
			rttr.addAttribute("rcpNo", comment.getRcpNo());
			
			return "redirect:/board/getRecipe?boardNo="+comment.getRcpNo();
		}
		
		//????????? ?????? ?????? ?????? POST
		@PostMapping("/commentUpdate{commentNo}/{commentContent}")
		public Map<String, Object> commentUpdate(@PathVariable int commentNo, @PathVariable String commentContent) throws Exception {
			System.out.println("????????? ??????????????????: POST");
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
		
		
//		//?????? ??????
//		@RequestMapping(value="commentDelete", method = RequestMethod.POST)
//		public String commentDelete(Comment comment,RedirectAttributes rttr) throws Exception {
//			System.out.println("????????? ??????????????????: POST");
//			
//			boardService.deleteRecipeComment(comment);
//			
//			rttr.addAttribute("bno", comment.getRcpNo());
//			
//			return "redirect:/board/getRecipe";
//		}
		
		//????????? ????????? /board/updateRecipeReco	
		@ResponseBody
		@PostMapping(value = "updateRecipeReco")
		public int updateRecipeReco(@RequestParam(value = "rcpNo", required = false) Integer rcpNo , 
													Model model,HttpSession session) throws Exception {
			System.out.println("/board/updateRecipeReco: POST");
			String userId = ((User) session.getAttribute("user")).getUserId();
			//????????? ????????? ???????????? ?????? id
			//((User) session.getAttribute("user")).getUserId();
			System.out.println(rcpNo);
			int recoCheck = boardService.recipeRecoCheck(rcpNo,userId);//??????1
			System.out.println(recoCheck);//0
			if(recoCheck == 0) {
				//????????? ?????? ??????
				boardService.addRecipeReco(rcpNo, userId); //recommend???????????? ?????? //??????2
				System.out.println(boardService.addRecipeReco(rcpNo, userId));
				boardService.updateRecipeReco(rcpNo); //recipe????????? + 1 //
				System.out.println(rcpNo);
				boardService.updateRecipeRecoCheck(rcpNo, userId); //recommend ????????? ????????? 1 //
			} else if(recoCheck == 1) {
				boardService.updateRecipeRecoCheck(rcpNo, userId); //recommend ????????? ????????? 0 //
				boardService.updateRecipeRecoCheckCancel(rcpNo, userId); //recipe????????? - 1 //
				boardService.deleteRecipeReco(rcpNo, userId); //recommend ????????? ?????? //
			}
			return recoCheck;
		}
		
		
		//?????? ?????? ??????: update data : ??????
		@PostMapping(value = "addReview")
		public String addReview(@ModelAttribute("orders")Orders orders, Model model) {
			System.out.println("/board/addReview: POST");
			
			//??????????????? ???????????? ????????????
			boardService.updateReview(orders);
			System.out.println("?????? ?????? ?????? ??????!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!111");
			
			return "redirect:/orders/getOrdersList";
		}
		
		//?????? ?????? ?????? ??????
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
		
		//???????????? ?????? ?????? - ?????????????????? ??????????????????
		@GetMapping(value = "getReviewList")
		public String getReviewList(@ModelAttribute("orders") Orders orders, HttpSession session, Model model) throws Exception {
			List<Orders> getReviewList = boardService.getReviewList(orders);
			
			System.out.println(getReviewList.size());
			Store store = new Store();
			
			String userId = ((User) session.getAttribute("user")).getUserId();
			store.setUserId(userId);
			
			model.addAttribute("getReviewList", getReviewList);
			System.out.println("?????? ?????? ?????? ??????!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+getReviewList);
			
			
			return "store/getStore?storeNo="+store.getStoreNo();
		}
		
		//?????? ?????? ?????? ??????
		@PostMapping(value = "deleteReview")
		public String deleteReview(@RequestParam(value = "orderNo", required = false) int orderNo) {
			System.out.println("/board/deleteReview : POST");
			boardService.deleteReview(orderNo);
			return "redirect:/board/addReviewView";
		}
		
		//????????? ?????????
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
