package com.jinwook.home.service.board;

import java.util.List;

import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Recipe;

public interface BoardDao {

		//������ ���
		public void addRecipe(Recipe rcp) throws Exception;

		//������ ����
		public void updateRecipe(Recipe rcp) throws Exception;

		//������ ����
		public void deleteRecipe(int rcpNo) throws Exception;
		
		//������ �� ��ȸ
		public Recipe getRecipe(int rcpNo) throws Exception;
		
		//������ ��� ��ȸ //���ڷ� ������ �����ϳ�?
		public List<Recipe> getRecipeList(int rcpNo) throws Exception;
		
		//���� �ı� ���
		public void addReview(Board board) throws Exception;
		
		//���� �ı� ��� ��ȸ
		public List<Board> getReviewList(int boardNo) throws Exception;
		
		//����, ������, ��� ��ŷ ��� ��ȸ //���ڷ� ������ �����ϳ�?
		public List<Board> getRankList(int boardNo) throws Exception;
		
		//1:1���� ���
		public void addInquiry(Board board) throws Exception;
		
		//1:1���� ����
		public void updateInquiry(Board board) throws Exception;
		
		//1:1���� ����
		public void deleteInquiry(int boardNo) throws Exception;
		
		//1:1���� ��� ��ȸ //���ڷ� ������ �����ϳ�?
		public List<Board> getInquiryList(int boardNo) throws Exception;
		
		//1:1���� �� ��ȸ
		public Board getInquiry(int rcpNo) throws Exception;
		
		//�������� ���
		public void addAnouncement(Board board) throws Exception;
		
		//�������� ����
		public void updateAnouncement(Board board) throws Exception;
		
		//�������� ����
		public void deleteAnouncement(int boardNo) throws Exception;
		
		//�������� ��� ��ȸ //���ڷ� ������ �����ϳ�?
		public List<Board> getAnnouncementList(int boardNo) throws Exception;
		
		//�������� �� ��ȸ
		public Board getAnnouncement(Board board) throws Exception;
		
		//���, �亯 ���
		public void addComment(Board board) throws Exception;
		
		//��� ����
		public void updateComment(Board board) throws Exception;
}
