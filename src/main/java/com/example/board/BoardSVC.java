package com.example.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("com.example.board.BoardSVC")

public class BoardSVC implements BoardSVCInter{
	
	@Autowired
	private BoardDAOInter boardDAO;
	
	@Override
	public List<BoardVO> list_all() {
		List<BoardVO> list = this.boardDAO.list_all();
		return list;
	}

	@Override
	public List<BoardVO> read_board(int board_no) {
		List<BoardVO> list = this.boardDAO.read_board(board_no);
		return list;
	}

	@Override
	public void readCntUp(int board_no) {
		this.boardDAO.readCntUp(board_no);
		
	}

}
