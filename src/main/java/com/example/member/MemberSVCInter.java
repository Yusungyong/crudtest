package com.example.member;

import java.util.List;



public interface MemberSVCInter {
	
	/**
	 * @param -
	 * @author LENOVO
	 * @retult List<VO��ü>
	 */
	public List<MemberVO> list(); // list�迭�� VO��ü�� ��Ƽ� �����ϴ� �Լ�.
	
	public int delete_member(int member_no);
	
	public int new_member(MemberVO memberVO);
	
	public int update_member(MemberVO memberVO);
	
	public MemberVO read(int member_no);
	
}