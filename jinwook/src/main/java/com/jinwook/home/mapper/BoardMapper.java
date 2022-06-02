package com.jinwook.home.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jinwook.home.service.domain.Board;
import com.jinwook.home.service.domain.Recipe;

@Mapper
public interface BoardMapper {
	//�Խñ� ���
	public int addBoard(Board board);

	//�Խñ� ����
	public int updateBoard(Board board);

	//�Խñ� ����
	public int deleteBoard(int boardNo);
	
	//�Խñ� �� ��ȸ
	public Board getBoard(int boardNo);

	//�Խñ� ��� ��ȸ???
	public List<Board> getBoardList(Board board);

	// ������ ���
	public int addRecipe(Recipe rcp);

	// ������ ����
	public int updateRecipe(Recipe rcp);

	// ������ ����
	public int deleteRecipe(int rcpNo);

	// ������ �� ��ȸ
	public Recipe getRecipe(int rcpNo);

	// ������ ��� ��ȸ???
	public List<Recipe> getRecipeList(int rcpNo);
	
	//���, �亯 ���
	public void addComment(Board board);
	
	//��� ����
	public void updateComment(Board board);
	
	// �Խñ� ����¡ ó��
	public int selectBoardTotalCount(Board board);
}
