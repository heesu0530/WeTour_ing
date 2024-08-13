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
								 &nbsp;&nbsp; FAQ</h3>
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
										<li><strong>· 검색조건</strong> 
										<select id="cate_cd" name="cate_cd" class="select_type1">
												<option value="">선택</option>
												<option value="1">항공</option>
												<option value="2">렌터카</option>
												<option value="3">호텔</option>
										</select></li>
									</ul>
									<ul class="fix">
										<li style="width: auto;"><strong>· 검색조건</strong> <select class="select_type1"
											id="searchfield" name="searchfield" style="width: 100px">
												<option value="title">제목</option>
												<option value="regi_man">작성자</option>
										</select> <input type="text" placeholder="검색어를 입력해 주세요" class="input_text_n" style="width: 200px">
										</li>
									</ul>
									<input class="btn_search" type="image" src="../images/sub_common/btn_search.png" alt="검색">
								</div>
							</div>
						</fieldset>
					</form>
					<!-- // 검색 -->

					<!--리스트 시작-->
					<div class="con_list_wrap">
						<div class="tit_area fix">
							<h6 class="sub_tit_h6 f_left">목록</h6>
							<!-- <p class="tit_btn_area f_right">
												<a href="#" class="btn2_ty3">엑셀다운로드</a>
											</p> -->
						</div>

						<div class="table-wrap">
							<table cellpadding="0" cellspacing="0" border="0" class="tbl_ty1" id="normal">
								<colgroup>
									<col width="50px" />
									<col width="" />
									<col width="100px" />
									<col width="100px" />
									<col width="100px" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										<th scope="col">조회수</th>
										<th scope="col">작성일자</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td class="left"><a href="javascript:page_move( 'regiform', { 'no': '83' } )">
												[자료실] 건축물 에너지효율등급 인증명판 가이드북 게시 </a></td>
										<td>-</td>
										<td>122</td>
										<td>2018-01-22</td>
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
								<!-- <span class="lft_btn_section">
													<a class="btn1_ty1" href="#"><em>삭제</em></a>
												</span> -->

								<span class="rit_btn_section"> <a class="btn1_ty3" href="/adminBoardFAQRegForm"><em>등록</em></a>
									<!-- <a class="btn1_ty4" href="#"><em>목록</em></a> -->
								</span>
							</p>
						</div>

					</div>
					<!--/리스트 끝-->

					<c:import url="../../footer.jsp" />
</body>
</html>