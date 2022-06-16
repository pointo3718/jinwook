<<<<<<< HEAD
=======
<<<<<<< HEAD
/*
 * package com.jinwook.home;
 * 
 * import java.time.LocalDate;
 * 
 * import org.junit.jupiter.api.Test; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.boot.test.context.SpringBootTest;
 * 
 * import com.jinwook.home.service.board.BoardService; import
 * com.jinwook.home.service.domain.Comment;
 * 
 * @SpringBootTest public class CommentTests {
 * 
 * @Autowired private BoardService commentService;
 * 
 * @Test public void addComments() { int number = 20;
 * 
 * for (int i = 1; i <= number; i++) { Comment comment = new Comment();
 * comment.setBoardNo(1); comment.setRcpNo(1); comment.setCommentContent(i +
 * "번 댓글을 추가합니다!"); comment.setCommentWriter(i + "번 회원");
 * comment.setCommentDate(LocalDate.now()); commentService.addComment(comment);
 * }
 * 
 * System.out.println("댓글 " + number + "개가 등록되었습니다."); }
 * 
 * @Test public void deleteComment() { Comment comment = new Comment();
 * commentService.deleteComment(1); // 삭제할 댓글 번호
 * 
 * System.out.println("댓글 " + comment + "가 삭제되었습니다."); }
 * 
 * // @Test // public void getCommentList() { // CommentDTO params = new
 * CommentDTO(); // params.setBoardIdx((long) 6529); // 댓글을 추가할 게시글 번호 // //
 * commentService.getCommentList(params); // }
 * 
 * }//class
 */
=======
>>>>>>> refs/remotes/origin/master
//package com.jinwook.home;
//
//import java.time.LocalDate;
//
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import com.jinwook.home.service.board.BoardService;
//import com.jinwook.home.service.domain.Comment;
//
//@SpringBootTest
//public class CommentTests {
//	
//	@Autowired
//	private BoardService commentService;
//	
//	@Test
//	public void addComments() {
//		int number = 20;
//
//		for (int i = 1; i <= number; i++) {
//			Comment comment = new Comment();
//			comment.setBoardNo(1); 
//			comment.setRcpNo(1); 
//			comment.setCommentContent(i + "번 댓글을 추가합니다!");
//			comment.setCommentWriter(i + "번 회원");
//			comment.setCommentDate(LocalDate.now());
//			commentService.addComment(comment);
//		}
//		
//		System.out.println("댓글 " + number + "개가 등록되었습니다.");
//	}
//	
//	@Test
//	public void deleteComment() {
//		Comment comment = new Comment();
//		commentService.deleteComment(1); // 삭제할 댓글 번호
//
//		System.out.println("댓글 " + comment + "가 삭제되었습니다.");
//	}
//
////	@Test
////	public void getCommentList() {
////		CommentDTO params = new CommentDTO();
////		params.setBoardIdx((long) 6529); // 댓글을 추가할 게시글 번호
////
////		commentService.getCommentList(params);
////	}
//	
//}//class
<<<<<<< HEAD
=======
>>>>>>> refs/heads/Song
>>>>>>> refs/remotes/origin/master
