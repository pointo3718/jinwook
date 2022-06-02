package com.jinwook.home.service.board;

import java.util.List;

import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Recipe;

public interface BoardService {
	//������ ���
	public void addRecipe(Recipe rcp);

	//������ ����
	public void updateRecipe(Recipe rcp);

	//������ ����
	public int deleteRecipe(int rcpNo);
	
	//������ �� ��ȸ
	public Recipe getRecipe(int rcpNo);
	
	//������ ��� ��ȸ
	public List<Recipe> getRecipeList(int rcpNo);
	
	//���� �ı� ���
	public void addReview(Recipe rcp);
	
	//���� �ı� ��� ��ȸ
	public List<Board> getListReview(int boardNo);
	
	//����, ������, ��� ��ŷ ��� ��ȸ
	public List<Board> getRankList(int boardNo);
	
	//1:1���� ���
	public void addInquiry(Board board);
	
	//1:1���� ����
	public void updateInquiry(Board board);
	
	//1:1���� ����
	public int deleteInquiry(int boardNo);
	
	//1:1���� ��� ��ȸ
	public List<Board> getInquiryList(int boardNo);
	
	//1:1���� �� ��ȸ
	public Board getInquiry(int rcpNo);
	
	//�������� ���
	public void addAnouncement(Board board);
	
	//�������� ����
	public void updateAnouncement(Board board);
	
	//�������� ����
	public int deleteAnouncement(int boardNo);
	
	//�������� ��� ��ȸ
	public List<Board> getAnnouncementList(int boardNo);
	
	//�������� �� ��ȸ
	public Board getAnnouncement(int rcpNo);
	
	//���, �亯 ���
	public void addComment(Board board);
	
	//��� ����
	public void updateComment(Board board);
	
}
