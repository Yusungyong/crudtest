package com.example.member;

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
		List<MemberVO> list = this.memberSVC.list();   // this.MemberSVC.list();로 변경 필요함
		
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
	
	
	
	
}
