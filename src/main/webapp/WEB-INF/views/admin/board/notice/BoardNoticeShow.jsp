<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
				<h3 class="sub_tit_h3">
					게시판 관리<img src="../images/sub_common/ico_dot2.png"
						class="title_top1" /> &nbsp;&nbsp; 공지사항<img
						src="../images/sub_common/ico_dot2.png" class="title_top1" />
					&nbsp;&nbsp; 상세페이지

				</h3>
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
							<table cellspacing="0" cellpadding="0" border="0" summary="게시판 뷰"
								class="tbl_ty2">
								<caption>공지사항 뷰</caption>
								<colgroup>
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
								</colgroup>
								<tbody>
									<c:if test='${ssKey.mem_role=="admin"}'>
										<tr>
											<th>공지사항등급</th>
											<td colspan="4"><input type="text" id="state_urgency_abc"
												name="state_urgency_abc" class="input_text"
												value="${notice.state_urgency_abc }" readonly="readonly">
											</td>
										</tr>
									</c:if>
									<tr>
										<th>제목</th>
										<td colspan="3"><input type="text" name="subject"
											title="공지사항제목" class="input_text"
											style="width: calc(100% - 20px);" readonly="readonly"
											value="${notice.subject }"></td>
									</tr>
									<tr>
										<th style="width: 20%;">작성자 / 등록 ID</th>
										<td style="width: 30%;">
											<div style="display: inline-block;">
												<em class="input_text_em"> <label>작성자:</label> <input
													type="text" name="writer" id="writer" class="input_text1"
													value="${ssKey.mem_name}" readonly>
												</em>
											</div>
											<div>
												<em class="input_text_em"> <label>등록ID:</label> <input
													type="text" name="reg_id" id="reg_id" class="input_text1"
													value="${ssKey.mem_id}" readonly>
												</em>
											</div>
										</td>
										<th style="width: 20%;">등록일자 / 수정일자</th>
										<td style="width: 30%;">
											<div>
												<em class="input_text_em"> <label for="reg_date">등록일자:</label>
													<input type="text" name="reg_date" id="reg_date"
													class="input_text1" readonly="readonly"> <img
													src="../images/sub_common/ico_cal1.png" alt="">
												</em>
												<script>
            									 document.addEventListener('DOMContentLoaded', function() {
                								 var reg_date = document.getElementById('reg_date_value').value;
                								 document.getElementById('reg_date').value = reg_Date;
            									 });
        										</script>
											</div>
											<div>
												<em class="input_text_em"> <label for="modi_date">수정일자:</label>
													<input type="text" name="modi_date" id="modi_date"
													class="input_text1" readonly="readonly"> <img
													src="../images/sub_common/ico_cal1.png" alt="">
												</em>
											</div>
										</td>
									</tr>
									<tr>
										<th>상위공지 여부</th>
										<td colspan="3"><input type="text" id="notice_yn"
											name="notice_yn" class="input_text"
											value="${notice.notice_yn }" readonly="readonly"></td>
									</tr>
									<tr>
										<th>내용</th>
										<td colspan="3"><textarea name="content" id="content"
												readonly="readonly"
												style="width: calc(100% - 20px); height: 100px;">${notice.content }</textarea></td>
									</tr>
								</tbody>
							</table>
							<!-- // 신청서 -->
							<!-- 버튼 영역-->
							<div class="btm_list_wrap">
								<c:if test="${ssKey.mem_role=='admin'}">
									<p class="btn_section fix">
										<span class="rit_btn_section">
											<input type="button" class="btn1_ty1" name="update" value="수정">
											<input type="button" class="btn1_ty2" name="delete" value="삭제">
											<input type="button" class="btn1_ty3" name="list" value="목록">
										</span>
									</p>
								</c:if>
							</div>
							<!-- // 버튼 영역-->
						</div>
					</div>
					<!--/리스트 끝-->
					<c:import url="../../footer.jsp" />
</body>
</html>