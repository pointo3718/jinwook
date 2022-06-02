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
	
	//�Խ��� ���
	public void addBoard(Board board);
	
	//�Խ��� ����
	public void updateBoard(Board  board);
	
	//�Խ��� ����
	public int deleteBoard(int boardNo);
	
	//�Խ��� �� ��ȸ
	public Board getBoard(int boardNo);
	
	//�Խ��� ��� ��ȸ
	public List<Board> getBoardList(int boardNo);
	
	//����, ������, ��� ��ŷ ��� ��ȸ
	public List<Board> getRankList(int boardNo);
	
	//���, �亯 ���
	public void addComment(Board board);
	
	//��� ����
	public void updateComment(Board board);
	
	//�� ���
	public void addJjim(Board board);
	
	//�� ����
	public void deleteJjim(Board board);
	
	//��õ ���
	public void addRecommemnd(Board board);
	
	//��õ ����
	public void deleteRecommemnd(Board board);
	
	//���� �ı� ���?????
	public void addReview(Recipe rcp);
	
	//���� �ı� ��� ��ȸ?????
	public List<Board> getListReview(int boardNo);
	
}
