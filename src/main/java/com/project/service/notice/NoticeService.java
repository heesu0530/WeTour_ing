package com.project.service.notice;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.vo.notice.NoticeVo;
import com.project.vo.page.PageVo;

@Service
public interface NoticeService {

	Map<String, Object> getNoticies(NoticeVo nvo, PageVo pgvo);


	int noticeProc(NoticeVo nvo);


	NoticeVo getNotice(NoticeVo nvo);


}
