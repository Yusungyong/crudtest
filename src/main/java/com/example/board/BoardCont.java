package com.example.board;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardCont {
	
	@Autowired
	@Qualifier("com.example.board.BoardSVC")
	private BoardSVCInter BoardSVC;
	
	public BoardCont() {
		super();
		System.out.println("boardCont start!");
	}
	
	@RequestMapping(value="/board/list_all.do", method=RequestMethod.GET)
	public ModelAndView list_all() {
		ModelAndView mav = new ModelAndView();
		
		List<BoardVO> list = this.BoardSVC.list_all();
		mav.addObject("list", list);
		
		mav.setViewName("/board/list_all");
		return mav;
	}
	
	@RequestMapping(value="/board/read_board.do", method=RequestMethod.GET)
	public ModelAndView read_board(int board_no) {
		ModelAndView mav = new ModelAndView();
		
		List<BoardVO> list = this.BoardSVC.read_board(board_no);
		this.BoardSVC.readCntUp(board_no);

		mav.addObject("list", list);
		
		mav.setViewName("/board/read_board");
		return mav;
	}
	
	
}
