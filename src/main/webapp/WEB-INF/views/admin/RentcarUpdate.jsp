<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/css/rentcar.css">
<script type="text/javascript" src="/js/jquery-3.7.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div>
	<c:import url="header.jsp"/>
		<div>
			<h3>차량목록</h3>
			<table class="">
				<thead>
					<tr>
						<th class="">상품번호</th>
						<th class="">상품명</th>
						<th class="">상품가격</th>
						<th class="">등록일</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</body>
</html>