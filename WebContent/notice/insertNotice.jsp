<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
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
	<h2 class="title">공지사항 등록</h2>
	<form name="frm1" id="frm1" action="<%=request.getContextPath()%>/InsertNoticeCtrl" method="post">
		<table class="table">
			<tbody>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" id="title" placeholder="제목 입력" class="form-control" autofocus required /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea cols="80" rows="6" name="content" id="content" class="form-control" required></textarea></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="author" id="author" value="admin" class="form-control" readonly></td>
				</tr>
			</tbody>
		</table>
		<div class="btn-group">
			<input type="submit" name="submit-btn" class="btn btn-primary" value="글 등록">
			<input type="reset" name="reset-btn" class="btn btn-danger" value="취소">
			<a href="<%=request.getContextPath()%>/GetNotiListCtrl" class="btn btn-info">목록으로</a>
		</div>
	</form>	
</div>
</body>
</html>