package com.example.member;

import java.util.HashMap;
import java.util.List;

public interface MemberDAOInter {
	public List<MemberVO> list();
	
	public int delete_member(int member_no);
	
	public int new_member(MemberVO memberVO);
	
	public int update_member(MemberVO memberVO);
	
	public MemberVO read(int member_no);
	
	public int login(HashMap<String, Object> map);
}
