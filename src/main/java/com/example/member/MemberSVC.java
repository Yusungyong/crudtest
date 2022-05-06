package com.example.member;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

// Autowired 기능에의해 자동 할당될 때 사용되는 이름
@Component("com.example.member.MemberSVC")
public class MemberSVC  implements MemberSVCInter{
	  // DI: 객체가 필요한 곳에 객체를 자동으로 생성하여 할당
	  // Autowired: DI 사용 선언
	  // Spring이 자동으로 MemberDAOInter를 구현하여 DAO class 생성후 객체를 만들어 할당
	@Autowired
	private MemberDAOInter MemberDAO;
	
	@Override
	public List<MemberVO> list() {
		List<MemberVO> list = this.MemberDAO.list();
		return list;
	}

	@Override
	public int delete_member(int member_no) {
		int cnt = this.MemberDAO.delete_member(member_no);
		return cnt;
		
	}

	@Override
	public int new_member(MemberVO memberVO) {
		int cnt = this.MemberDAO.new_member(memberVO);
		return cnt;
	}

	@Override
	public int update_member(MemberVO memberVO) {
		int cnt = this.MemberDAO.update_member(memberVO);
		return cnt;
	}

	@Override
	public MemberVO read(int member_no) {
		MemberVO memberVO = this.MemberDAO.read(member_no);
		return memberVO;
	}

	@Override
	public int login(HashMap<String, Object> map) {
		int cnt = this.MemberDAO.login(map);
		return cnt;
	}
	
}
