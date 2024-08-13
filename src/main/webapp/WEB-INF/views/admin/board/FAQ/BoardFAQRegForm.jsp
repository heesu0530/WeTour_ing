<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>

	<c:import url="../../header.jsp" />
	</div>
	<!--/lft_wrapper-->

	<div class="rit_wrapper">
		<!--rit_wrapper-->
		<div class="rit_wrapper_w">

			<!--tit_location_section-->
			<div class="tit_location_section fix">
				<h3 class="sub_tit_h3">게시판 관리<img src="../images/sub_common/ico_dot2.png" class="title_top1"/>
								 &nbsp;&nbsp; FAQ<img src="../images/sub_common/ico_dot2.png" class="title_top1"/>
								 &nbsp;&nbsp; 등록</h3>
			</div>
			<!--/tit_location_section-->


			<!--컨텐츠 영역-->
			<div class="sub_contents_wrap">
				<!--sub_contents_area-->
				<div class="sub_contents_area">
					<!--리스트 시작-->
					<div class="con_list_wrap">


						<!-- 신청서 -->
						<div class="table-wrap">
							<table cellspacing="0" cellpadding="0" border="0" summary="게시판 뷰" class="tbl_ty2">
								<caption>게시판 뷰</caption>
								<colgroup>
									<col width="15%">
									<col width="35%">
									<col width="15%">
									<col width="35%">
								</colgroup>
								<tbody>
									<tr>
										<th>제목</th>
										<td colspan="3"><input type="text" id="title" name="title" class="input_text"
											style="width: calc(100% - 20px);" value="건축물 에너지효율등급 인증명판 가이드북 게시"></td>
									</tr>
									<tr>
										<th>작성자</th>
										<td><input type="text" id="regi_man" name="regi_man" class="input_text" value="-"></td>
										<th>등록일자</th>
										<td><em class="input_text_em"> <input type="text" name="eval_exam_dd"
												id="eval_exam_dd" class="input_text1"> <img
												src="../images/sub_common/ico_cal1.png" alt="">
										</em></td>
									</tr>

									<tr>
										<th>카테고리</th>
										<td colspan="3"><select id="cate_cd" name="cate_cd" class="select_type1">
												<option value="">--선택--</option>
												<option value="1">공지사항</option>
												<option value="2" selected="selected">자료실</option>
										</select></td>
									</tr>

									<tr>
										<th>내용</th>
										<td colspan="3"><textarea></textarea></td>
									</tr>
									<tr>
										<th>첨부파일<br>다운로드
										</th>
										<td colspan="3"></td>
									</tr>
									<tr>
										<th>첨부파일<br>업로드
										</th>
										<td colspan="3"></td>
									</tr>

								</tbody>
							</table>
						</div>
						<!-- // 신청서 -->

						<!-- 버튼 영역-->
						<div class="btm_list_wrap">
							<p class="btn_section fix">
								<span class="lft_btn_section"> <a class="btn1_ty0" href="#"><em>삭제</em></a>
								</span> <span class="rit_btn_section"> <a class="btn1_ty4" href="#"><em>저장</em></a> <a
									class="btn1_ty5" href="/adminBoardFAQList"><em>목록</em></a>
								</span>
							</p>
						</div>
						<!-- // 버튼 영역-->

					</div>
					<!--/리스트 끝-->

					<c:import url="../../footer.jsp" />
</body>

</html>