package com.project.vo.notice;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
	public class NoticeVo {
	  private int rn;
		private int    notice_no             ;//고유번호
		private String writer                ;//작성자
		private String reg_id                ;//등록아이디
		private String modi_id               ;//수정아이디
		private String subject               ;//제목
		private String content               ;//내용
		private String state_yn              ;//삭제여부
		private String reg_date              ;//등록날짜
		private String modi_date             ;//수정날짜
		private String state_urgency_abc     ;//공지등급
		private String notice_yn             ;//상위공지여부
		private String notice_start_date     ;//공지시작일자
		private String notice_end_date       ;//공지 종료 일자
		private String ip                    ;//접속 ip
		private int readcount                ;//조회수
		private String reg_yn			           ;//등록여부
		private String modi_yn	             ;//수정
		private String state_urgency_a       ;//긴급공지사항
		private int start;
		private int end;
			
	}
