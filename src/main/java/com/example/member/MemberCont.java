package com.example.member;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberCont {
	
	private static final String MemberVO = null;
	@Autowired
	@Qualifier("com.example.member.MemberSVC")
	private MemberSVCInter memberSVC;

	public MemberCont() {
		System.out.println("MemberController.. Start");
	}
	
	@RequestMapping(value="/member/list.do", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		List<MemberVO> list = this.memberSVC.list();   // this.MemberSVC.list();占쏙옙 占쏙옙占쏙옙 占십울옙占쏙옙
		
		mav.addObject("list", list);
		mav.setViewName("/member/list");
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/member/delete_ajax", method=RequestMethod.POST)
	public String delete_member(int member_no) {
		JSONObject json = new JSONObject();
		int cnt = this.memberSVC.delete_member(member_no);
		
		json.put("cnt", cnt);

		return json.toString();
	}
	
	@RequestMapping(value="/member/new_member.do", method = RequestMethod.POST)
	public ModelAndView new_member(MemberVO memberVO) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = this.memberSVC.new_member(memberVO);
		mav.addObject("cnt", cnt);
		
		
		mav.setViewName("redirect:/member/list.do");
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/member/update_form.do", method = RequestMethod.GET)
	public String update_form (int member_no) {
		MemberVO memberVO = this.memberSVC.read(member_no);
		
		JSONObject json = new JSONObject();
		json.put("member_no", memberVO.getMember_no());
		json.put("name", memberVO.getMember_name());
		json.put("address", memberVO.getMember_address());
		json.put("phone", memberVO.getMember_phone());
		json.put("email", memberVO.getMember_email());
		
		
		return json.toString();
	}
	
	@RequestMapping(value="/member/update_member.do", method = RequestMethod.POST)
	public ModelAndView update_member(MemberVO memberVO) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = this.memberSVC.update_member(memberVO);
		mav.addObject("cnt", cnt);
		
		mav.setViewName("redirect:/member/list.do");
		return mav;
	}	
	
	
	
	/*
	 * 회占쏙옙占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙
	 */
	@RequestMapping(value="/member/create_member.do", method = RequestMethod.GET)
	public ModelAndView member_create() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/create");
		return mav;
	}
	
	/*
	 * 회占쏙옙占쏙옙占쏙옙 처占쏙옙 POST 占쏙옙占�
	 */
	
	@RequestMapping(value="/member/create.do", method = RequestMethod.POST)
	public ModelAndView create(MemberVO memberVO, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView();		
		int cnt = this.memberSVC.new_member(memberVO );
		
		mav.addObject("cnt", cnt);
		if (cnt == 1) {
			mav.setViewName("redirect:/member/list.do"); // 회원가입 성공시 메세지 페이지로
		} else {
			ScriptUtils.alert(response,"가입 실패"); // 가입실패시 팝업창만 띄운뒤 페이지 유지 
		}

		return mav;
	}	
	@ResponseBody
	@RequestMapping(value="/member/login.do",method = RequestMethod.GET)
	public String login (
			HttpServletRequest req,
			HttpServletResponse res,
			String id, String pwd) {
		
		// 占식띰옙占쏙옙占� 占쏙옙占쏙옙占쏙옙占쏙옙 id, pwd 占쏙옙占쌨뱄옙占쏙옙
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		HttpSession session = req.getSession();
		
		JSONObject json = new JSONObject();
		
		
		map.put("id", id);
		map.put("pwd", pwd);
		
		
		int cnt = this.memberSVC.login(map);

		json.put("id", id);
		json.put("pwd", pwd);
		json.put("cnt", cnt);
		if (cnt == 0) { //占싸깍옙占쏙옙 占쏙옙占쏙옙
			session.setAttribute("pwd", null);
			session.setAttribute("id", null);

		} else {
			session.setAttribute("pwd", pwd);
			session.setAttribute("id", id);

		}
		
		return json.toString();
	}
	
	@RequestMapping(value="/member/login_form.do", method = RequestMethod.GET)
	public ModelAndView login_form() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/login");
		return mav;
	}
	
	@RequestMapping(value="/member/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		req.getSession().setAttribute("id", null);
		req.getSession().invalidate();
		  mav.setViewName("redirect:/member/list.do");
		  return mav;
		}
}
