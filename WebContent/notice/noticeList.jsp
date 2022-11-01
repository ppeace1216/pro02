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
<%
	List<Notice> noti = (ArrayList<Notice>) request.getAttribute("noti");
%>
<h2>공지사항목록</h2>
<table class="table">
	<thead>
		<tr>
			<th>번호</th><th>제목</th><th>작성일</th>
		</tr>
	</thead>
	<tbody>
	<% for(int i=0;i<noti.size();i++){
		Notice vo = noti.get(i);	
	%>
		<tr><%=vo.getNotiNo() %></tr>
		<tr><a href="BoardDetailCtrl?notiNo=<%=vo.getNotiNo() %>"><%=vo.getTitle() %></a></tr>
		<tr><%=vo.getResdate() %></tr>
	<%} %>
	</tbody>
</table>
</body>
</html>