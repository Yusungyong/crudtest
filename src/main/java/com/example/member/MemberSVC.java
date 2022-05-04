package com.example.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

// Autowired ��ɿ����� �ڵ� �Ҵ�� �� ���Ǵ� �̸�
@Component("com.example.member.MemberSVC")
public class MemberSVC  implements MemberSVCInter{
	  // DI: ��ü�� �ʿ��� ���� ��ü�� �ڵ����� �����Ͽ� �Ҵ�
	  // Autowired: DI ��� ����
	  // Spring�� �ڵ����� MemberDAOInter�� �����Ͽ� DAO class ������ ��ü�� ����� �Ҵ�
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
	
}
