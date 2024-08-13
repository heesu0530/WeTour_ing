
<!-- 로그인 페이지의 기능구성-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign in</title>
<link rel="stylesheet" type="text/css" href="/css/signIn.css">
<link rel="stylesheet" type="text/css" href="/css/common.css">
<link rel="stylesheet" type="text/css" href="/css/aloneLogin.css">
<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
<script type="text/javascript" src="/js/jquery.js"></script>
</head>
<body>
	<div align="center" class="signInTab">
		<!-- 로그인페이지 로고 이미지 -->
		<div>
			<a href="/"> <img src="/images/favicon.png" id="img">
			</a>
		</div>

		<!-- 로그인페이지 입력칸 -->
		<table>
			<tr>
				<th>ID&nbsp;&nbsp;&nbsp;</th>
				<th><input type="text"></th>
			</tr>
			<tr>
				<th>PASSWORD&nbsp;&nbsp;&nbsp;</th>
				<th><input type="password"></th>
			</tr>
		</table>

		<!-- Sign in 버튼 이미지 -->
		<div align="center">
			<a href="#"> <img src="/images/signIn_btn.png" id="img1">
			</a>
		</div>

		<!-- 로그인페이지 하단부 -->
		<div class="SignPageList" style="text-align: center;">
			<ul>
				<li>아이디 저장<input type="checkbox">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<a href="/signup">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<a href="#">ID / PW 찾기</a></li>
				<li>
					<a href="/adminPriductFlyList">관리자 페이지</a>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>