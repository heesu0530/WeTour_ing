package com.project.service.member;

import java.util.Map;

import com.project.vo.member.MemberVo;

public interface MemberService {

	MemberVo getMember(MemberVo mvo);

	int idCheck(String mem_id);

	int memberJoin(MemberVo mvo);

	int memberUpdate(MemberVo mvo);

	Map<String, Object> getMemberList(MemberVo mvo);

}
