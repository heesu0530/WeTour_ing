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
				<h3 class="sub_tit_h3">
					상품등록<img src="../images/sub_common/ico_dot2.png" class="title_top1" /> &nbsp;&nbsp;
					여행상품<img src="../images/sub_common/ico_dot2.png" class="title_top1" /> &nbsp;&nbsp;
					호텔
				</h3>
			</div>
			<!--/tit_location_section-->


			<!--컨텐츠 영역-->
			<div class="sub_contents_wrap">
				<!--sub_contents_area-->
				<div class="sub_contents_area">

					<!-- 검색 -->
					<form action="#">
						<fieldset>
							<legend>검색</legend>

							<div class="search_board_section">
								<div class="search_board_form">
									<ul class="fix">
										<li>
											<strong>&middot; 숙소유형</strong>
												<select class="select_type1" name="crtif_kind" id="crtif_kind">
												<option value="">전체</option>
												<option value="1">콘도</option>
												<option value="2">호텔</option>
												<option value="3">펜션</option>
												<option value="4">기타</option>
										</select></li>
										<li>
											<strong>&middot; 호텔성급</strong>
											<select class="select_type1" name="bld_use_kind" id="bld_use_kind" onchange="bldUseKindChange( this )">
												<option value="">전체</option>
												<option value="1">1성급</option>
												<option value="2">2성급</option>
												<option value="3">3성급</option>
												<option value="4">4성급</option>
												<option value="5">5성급</option>
										</select></li>
										<li><strong>&middot; 조식여부</strong>
											<select class="select_type1" id="bld_main_use" name="bld_main_use">
												<option value="">전체</option>
												<option value="1">포함</option>
												<option value="2">불포함</option>
											</select>
										</li>
									</ul>
									<input class="btn_search" type="image" src="../images/sub_common/btn_search.png" alt="검색" />
								</div>
								<input type="hidden" id="search_view" value="Y" />
								<!-- <a href="#" class="btn_search_open"><img src="../images/sub_common/btn_open1.png" alt="" /></a> -->
							</div>
						</fieldset>
					</form>
					<!-- // 검색 -->

					<!--리스트 시작-->
					<div class="con_list_wrap">
						<div class="tit_area fix">
							<h6 class="sub_tit_h6 f_left">호텔 상품 목록</h6>
							<p class="tit_btn_area f_right">
								<a href="#" class="btn2_ty3">엑셀다운로드</a>
							</p>
						</div>

						<div class="table-wrap">
							<table class="tbl_ty1" id="normal">
								<colgroup>
									<col width="120px" />
									<col width="" />
									<col width="100px" />
									<col width="100px" />
									<col width="100px" />
									<col width="100px" />
									<col width="" />
									<col width="100px" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">고유번호</th>
										<th scope="col">호텔명/제목</th>
										<th scope="col">성급</th>
										<th scope="col">가격</th>
										<th scope="col">숙소 유형</th>
										<th scope="col">조식여부</th>
										<th scope="col">편의 시설</th>
										<th scope="col">등록날짜</th>
									</tr>
								</thead>
								<tbody>
									<tr id="list_RT_tr_1">
										<td>
											<a href="javascript:page_move( '../auth_req/regiform', { 'no': '2019083079' } )">
												<strong class="b_blue1">HO101</strong>
											</a>
										</td>
										<td>강릉 경포호텔</td>
										<td>4성급</td>
										<td class="right">150,000</td>
										<td>
											<p>
												<em class="btn_ty3">호텔</em>
											</p>
										</td>
										<td>
											<p>
												<em class="btn_ty1">포함</em>
											</p>
										</td>
										<td>
											<p>
												<em class="btn_ty4">무선인터넷</em>
												<em class="btn_ty5">레스토랑</em>
												<em class="btn_ty5">수영장</em><br/>
												<em class="btn_ty6">에어컨</em>
												<em class="btn_ty7">냉장고</em>
											</p>
										</td>
										<td>
											<p>
												2019-08-09
											</p>
										</td>
									</tr>

									<tr id="list_RT_tr_2">
										<td><a href="javascript:page_move( '../auth_req/regiform', { 'no': '2019083078' } )">
												<strong class="b_blue1">HO102</strong>
											</a>
										</td>
										<td>강릉 경포호텔</td>
										<td>4성급</td>
										<td class="right">150,000</td>
										<td>
											<p>
												<em class="btn_ty3">호텔</em>
											</p>
										</td>
										<td>
											<p>
												<em class="btn_ty2">불포함</em>
											</p>
										</td>
										<td>
											<p>
												<em class="btn_ty4">무선인터넷</em>
												<em class="btn_ty5">레스토랑</em>
												<em class="btn_ty5">수영장</em><br/>
												<em class="btn_ty6">에어컨</em>
												<em class="btn_ty7">냉장고</em>
											</p>
										</td>
										<td>
											<p>
												2019-08-09
											</p>
										</td>
									</tr>
									
								</tbody>

							</table>
						</div>

						<div class="btm_list_wrap">
							<div id="pageList">
								<ul id="leftnav">
									<li><a href="#"> <img src="../images/sub_common/btn_ppre.png" alt="처음 페이지" />
									</a></li>
									<li><a href="#"> <img src="../images/sub_common/btn_pre.png" alt="이전 페이지" />
									</a></li>
								</ul>
								<ol>
									<li><strong>1</strong></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">6</a></li>
									<li><a href="#">7</a></li>
									<li><a href="#">8</a></li>
									<li><a href="#">9</a></li>
									<li><a href="#">10</a></li>
								</ol>
								<ul id="rightnav">
									<li><a href="#"> <img src="../images/sub_common/btn_nxt.png" alt="다음 페이지" />
									</a></li>
									<li><a href="#"> <img src="../images/sub_common/btn_nnxt.png" alt="마지막 페이지" />
									</a></li>
								</ul>
							</div>
							
							<p class="btn_section fix">
								<span class="rit_btn_section">
									<a class="btn1_ty3" href="/adminProductHotelRegForm"><em>등록</em></a>
								</span>
							</p>
							
						</div>

					</div>
					<!--/리스트 끝-->
					<c:import url="../../footer.jsp" />
</body>
</html>