package com.example.board;

import java.util.List;

public interface BoardDAOInter {
	
	public List<BoardVO> list_all();
	
	public List<BoardVO> read_board(int board_no); // �Խ��� ��ȣ ���޹޾Ƽ� ��ȣ�� �ش��ϴ� �Խù� ����
	
	public void readCntUp(int board_no); // �Խ��� ��ȣ�� ���޹޾Ƽ� �ش� �Խ��� ��ȸ�� 1 ���

}
