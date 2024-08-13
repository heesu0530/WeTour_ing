package com.project.dao.member;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.project.vo.member.MemberVo;


@Mapper
public interface MemberMapper {

	MemberVo getMember(MemberVo mvo);

	int idCheck(String mem_id);

	int memberJoin(MemberVo mvo);

	int memberUpdate(MemberVo mvo);

	int getMemberTot();

	ArrayList<MemberVo> getMemberList(MemberVo mvo);

}
