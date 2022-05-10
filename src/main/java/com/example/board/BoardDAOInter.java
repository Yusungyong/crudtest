package com.example.board;

import java.util.List;

public interface BoardDAOInter {
	
	public List<BoardVO> list_all();
	
	public List<BoardVO> read_board(int board_no); // 게시판 번호 전달받아서 번호에 해당하는 게시물 리턴
	
	public void readCntUp(int board_no); // 게시판 번호를 전달받아서 해당 게시판 조회수 1 상승

}
