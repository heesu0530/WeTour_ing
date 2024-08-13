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
				<h3 class="sub_tit_h3">상품등록<img src="../images/sub_common/ico_dot2.png" class="title_top1"/>
								 &nbsp;&nbsp;여행 상품 <img src="../images/sub_common/ico_dot2.png" class="title_top1"/>
								 &nbsp;&nbsp; 호텔<img src="../images/sub_common/ico_dot2.png" class="title_top1"/>
								 &nbsp;&nbsp; 등록</h3>
			</div>
			<!--/tit_location_section-->


			<!--컨텐츠 영역-->
			<div class="sub_contents_wrap">
				<!--sub_contents_area-->
				<div class="sub_contents_area">
					<!--리스트 시작-->
					<div class="con_list_wrap">

						<form action="" name="" method="post">
							<!-- 호텔 상품 등록 -->
							<div class="table-wrap">
								<table summary="상품등록" class="tbl_ty2">
									<caption>호텔 등록</caption>
									<colgroup>
										<col width="15%">
										<col width="35%">
										<col width="15%">
										<col width="35%">
									</colgroup>
									<tbody>
										<tr>
											<th>호텔명/제목</th>
											<td><input type="text" id="regi_man" name="regi_man" class="input_text" value="강릉 경포호텔"></td>
											<th>호텔 고유 번호</th>
											<td><input type="text" id="regi_man" name="regi_man" class="input_text" value="HO101"></td>
										</tr>
	
										<tr>
											<th>호텔 성급</th>
											<td class="left">
												<input type="radio" name="mp_sct_code" value="2" class="mp_sct_code"> 1성급 &nbsp;&nbsp;&nbsp;
												<input type="radio" name="mp_sct_code" value="2" class="mp_sct_code"> 2성급 &nbsp;&nbsp;&nbsp;
												<input type="radio" name="mp_sct_code" value="3" class="mp_sct_code"> 3성급 &nbsp;&nbsp;&nbsp;
												<input type="radio" name="mp_sct_code" value="4" class="mp_sct_code"> 4성급 &nbsp;&nbsp;&nbsp;
												<input type="radio" name="mp_sct_code" value="4" class="mp_sct_code"> 5성급 
											</td>
											<th>호텔 가격</th>
											<td><input type="text" id="regi_man" name="regi_man" class="input_text" value="150,000"></td>
										</tr>
										
										<tr>
											<th>숙소 유형</th>
											<td class="left">
												<input type="radio" name="mp_sct_code" value="2" class="mp_sct_code"> 콘도 &nbsp;&nbsp;&nbsp;
												<input type="radio" name="mp_sct_code" value="2" class="mp_sct_code"> 호텔 &nbsp;&nbsp;&nbsp;
												<input type="radio" name="mp_sct_code" value="3" class="mp_sct_code"> 펜션 &nbsp;&nbsp;&nbsp;
												<input type="radio" name="mp_sct_code" value="4" class="mp_sct_code"> 기타 
											</td>
											<th>주변 지역</th>
											<td>
												<input type="text" id="regi_man" name="regi_man" class="input_text" value="경포 해변">
												<input type="text" id="regi_man" name="regi_man" class="input_text" value="주문진항">
												<input type="text" id="regi_man" name="regi_man" class="input_text" value="사천진 해변">
												<input type="text" id="regi_man" name="regi_man" class="input_text" value="도깨비드라마촬영지">
											</td>
										</tr>
	
										<tr>
											<th>조식 여부</th>
											<td class="left">
												<input type="radio" name="mp_sct_code" value="2" class="mp_sct_code"> 포함 &nbsp;&nbsp;&nbsp;
												<input type="radio" name="mp_sct_code" value="2" class="mp_sct_code"> 불포함 &nbsp;&nbsp;&nbsp;
											</td>
											<th>편의 시설</th>
											<td class="left">
												<input type="checkbox" name="mp_sct_code" value="2" class="mp_sct_code"> 무선인터넷 &nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="mp_sct_code" value="2" class="mp_sct_code"> 레스토랑 &nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="mp_sct_code" value="3" class="mp_sct_code"> 수영장 &nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="mp_sct_code" value="4" class="mp_sct_code"> 에어컨 &nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="mp_sct_code" value="4" class="mp_sct_code"> 냉장고 &nbsp;&nbsp;&nbsp;
											</td>
										</tr>
	
										<tr>
											<th>주소</th>
											<td colspan="3"><input type="text" id="title" name="title" class="input_text"
												style="width: calc(100% - 20px);" value="스카이베이 호텔 경포"></td>
										</tr>
	
										<tr>
											<th>전화</th>
											<td><input type="text" id="regi_man" name="regi_man" class="input_text" value="82-33-923 2000"></td>
											<th>팩스</th>
											<td><input type="text" id="regi_man" name="regi_man" class="input_text" value="82-33-923"></td>
										</tr>
	
										<tr>
											<th>체크인/아웃</th>
												<td class="left">
													<em class="input_text_em">
														<input type="text" placeholder="15:00 AM" class="input_text1">
														<img src="../images/sub_common/ico_cal1.png" alt="">
													</em> ~ 
													<em class="input_text_em">
														<input type="text" placeholder="11:00 PM" class="input_text1">
														<img src="../images/sub_common/ico_cal1.png" alt="">
													</em>
												</td>
											<th>상품 등록날짜</th>
											<td>
												<em class="input_text_em">
													<input type="text" name="eval_exam_dd" id="eval_exam_dd" class="input_text1">
													<img src="../images/sub_common/ico_cal1.png" alt="">
												</em>
												<script>
	        								document.addEventListener('DOMContentLoaded', function() {
	           								var now = '<%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>';
														document.getElementById('eval_exam_dd').value = now;
													});
												</script>
											</td>
										</tr>
	
										<tr>
											<th>호텔 소개</th>
											<td colspan="3"><textarea> 강릉에서 해변 근처에 위치한 스카이베이 호텔 경포에 머무실 경우 차로 5분 정도 이동하면 경포 해변 및 경포대에 가실 수 있습니다. 이 업스케일 호텔에서 주문진 해변까지는 19.2km 떨어져 있으며, 28.3km 거리에는 정동진 해변도 있습니다.</textarea></td>
										</tr>
	
										<tr>
											<th>객실 소개</th>
											<td colspan="3"><textarea> 538개 객실에는 냉장고 및 LED TV도 갖추어져 있어 편하게 머무실 수 있습니다. 무료 무선 인터넷을 이용하실 수 있으며 디지털 채널 프로그램도 구비되어 있어 지루하지 않게 시간을 보내실 수 있습니다. 욕실에는 샤워, 비데, 헤어드라이어 등이 마련되어 있습니다. 편의 시설/서비스로는 전화 외에 금고 및 커피/티 메이커도 있습니다.</textarea></td>
										</tr>
	
										<tr>
											<th>관리자 Email</th>
											<td><input type="text" id="regi_man" name="regi_man" class="input_text" value="aaa@gmail.com"></td>
											<th>IP주소</th>
											<td><input type="text" id="regi_man" name="regi_man" class="input_text" value="192.0.0.1"></td>
										</tr>
	
										<tr>
											<th>대표 이미지</th>
											<td class="left" colspan="3">
												<input type="file" class="filename" name="filename_2" id="filename_2">
											</td>
										</tr>
										<tr>
											<th>상세 이미지 1</th>
											<td class="left" colspan="3">
												<input type="file" class="filename" name="filename_2" id="filename_2">
											</td>
										</tr>
										<tr>
											<th>상세 이미지 2</th>
											<td class="left" colspan="3">
												<input type="file" class="filename" name="filename_2" id="filename_2">
											</td>
										</tr>
										<tr>
											<th>상세 이미지 3</th>
											<td class="left" colspan="3">
												<input type="file" class="filename" name="filename_2" id="filename_2">
											</td>
										</tr>
	
	
									</tbody>
								</table>
							</div>
							<!-- // 신청서 -->
						</form>

						<!-- 버튼 영역-->
						<div class="btm_list_wrap">
							<p class="btn_section fix">
								<!-- <span class="lft_btn_section"> <a class="btn1_ty0" href="#"><em>삭제</em></a> -->
								</span> <span class="rit_btn_section"> <a class="btn1_ty4" href="#"><em>저장</em></a> <a
									class="btn1_ty5" href="/adminProductHotelList"><em>목록</em></a>
								</span>
							</p>
						</div>
						<!-- // 버튼 영역-->

					</div>
					<!--/리스트 끝-->
					<c:import url="../../footer.jsp" />
</body>

</html>