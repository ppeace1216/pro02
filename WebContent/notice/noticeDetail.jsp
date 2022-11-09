<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='https://unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='https://unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='https://unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
</head>
<body>
<%@ include file="../header.jsp" %>
<%
	Notice vo = (Notice) request.getAttribute("notice");
%>
<div class="content container" id="content">
	<div class="row" id="content_row">
		<% if(sid!=null && sid.equals("admin")) { %>
		<%@ include file="../admin/admin_sidebar.jsp" %>
		<% } %>
		<% if(sid!=null && sid.equals("admin")) { %>
		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
		<% } else { %>
		<main class="content container">
		<% } %>
			<h2 class="title">공지사항 목록</h2>
			<table class="table">
				<tbody>
					<tr>
						<th>번호</th>
						<td><%=vo.getNotiNo() %></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><%=vo.getTitle() %></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><%=vo.getContent() %></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><%=vo.getAuthor() %></td>
					</tr>
					<tr>
						<th>작성시간</th>
						<td><%=vo.getResdate() %></td>
					</tr>
					<tr>
						<th>조회수</th>
						<td><%=vo.getVisited() %></td>
					</tr>
				</tbody>
			</table>
			<div class="btn-group">
				<a href="<%=request.getContextPath()%>/GetNotiListCtrl" class="btn btn-info">목록으로</a>
				<% if(sid!=null && sid.equals("admin")) { %>
				<a href="<%=request.getContextPath()%>/UpdateNoticeCtrl?notiNo=<%=vo.getNotiNo() %>" class="btn btn-info">글 수정</a>
				<a href="<%=request.getContextPath()%>/DeleteNoticeCtrl?notiNo=<%=vo.getNotiNo() %>" class="btn btn-danger">글 삭제</a>
				<% } %>
			</div>
		</main>
		</main>
	</div>
</div>
</body>
</html>