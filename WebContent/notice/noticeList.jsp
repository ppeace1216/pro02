<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>공지사항 목록</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='https://unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='https://unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='https://unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
</head>
<body>
<%@ include file="../header.jsp" %>
<%
	List<Notice> notiList = (ArrayList<Notice>) request.getAttribute("notiList");
%>
<div class="content container">
	<h2>공지사항 목록</h2>
	<table class="table">
		<thead>
			<tr>
				<th>번호</th><th>제목</th><th>작성일</th>
			</tr>
		</thead>
		<tbody>
		<% for(int i=0;i<notiList.size();i++){
			Notice vo = notiList.get(i);
		%>
			<tr><%=vo.getNotiNo() %></tr>
			<tr><a href="GetNotiDetailCtrl?notiNo=<%=vo.getNotiNo() %>"><%=vo.getTitle() %></a></tr>
			<tr><%=vo.getResdate() %></tr>
		<%} %>
		</tbody>
	</table>
</div>
</body>
</html>