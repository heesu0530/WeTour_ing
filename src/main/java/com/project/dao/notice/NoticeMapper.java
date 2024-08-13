package com.project.dao.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.vo.notice.NoticeVo;


@Mapper
public interface NoticeMapper {
	
	int getTotalNotice();

	List<NoticeVo> getNoticies(NoticeVo nvo);

	int noticeProc(NoticeVo nvo);

	NoticeVo getNotice(NoticeVo nvo);

	int countUpdate(NoticeVo nvo);
	
}