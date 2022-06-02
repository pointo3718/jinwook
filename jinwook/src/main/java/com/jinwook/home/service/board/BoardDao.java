package com.jinwook.home.service.board;

import java.util.List;

import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Recipe;

public interface BoardDao {

		// �Խ��� ���(1:1����, ��������, �����ı�)
		public int addBoard(Board board) throws Exception;
		
		// �Խ��� ����(1:1����, ��������)
		public int updateBoard(Board board) throws Exception;
		
		// �Խ��� ����(1:1����, ��������)
		public int deleteBoard(int boardNo) throws Exception;
		
		//�Խ��� �� ��ȸ
		public Recipe getBoard(int boardNo) throws Exception;
				
		//�Խ��� ��� ��ȸ //���ڷ� ������ �����ϳ�?
		public List<Board> getBoardList(int boardNo) throws Exception;
	
		//������ ���
		public int addRecipe(Recipe rcp) throws Exception;

		//������ ����
		public int updateRecipe(Recipe rcp) throws Exception;

		//������ ����
		public int deleteRecipe(int rcpNo) throws Exception;
		
		//������ �� ��ȸ
		public Recipe getRecipe(int rcpNo) throws Exception;
		
		//������ ��� ��ȸ //���ڷ� ������ �����ϳ�?
		public List<Recipe> getRecipeList(int rcpNo) throws Exception;
		
		//���, �亯 ���
		public void addComment(Board board) throws Exception;
		
		//��� ����
		public void updateComment(Board board) throws Exception;
}
