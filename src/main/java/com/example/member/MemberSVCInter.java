package com.example.member;

import java.util.HashMap;
import java.util.List;



public interface MemberSVCInter {
	
	/**
	 * @param -
	 * @author LENOVO
	 * @retult List<VO객체>
	 */
	public List<MemberVO> list(); // list배열에 VO객체를 담아서 리턴하는 함수.
	
	public int delete_member(int member_no);
	
	public int new_member(MemberVO memberVO);
	
	public int new_member_ad(MemberVO memberVO);
	
	public int update_member(MemberVO memberVO);
	
	public MemberVO read(int member_no);
	
	public int login(HashMap<String, Object> map);
	
	public int CheckId(String id);
	
}
