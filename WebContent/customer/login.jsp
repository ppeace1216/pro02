<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
	<h2 class="title">로그인</h2>
	<form name="frm1" id="frm1" action="<%=request.getContextPath() %>/CustomerLoginCtrl" method="post">
	<table class="table">
		<tbody>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="cusId" id="cusId" placeholder="아이디 입력" class="form-control" autofocus required />
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="cusPw" id="cusPw" placeholder="비밀번호 입력" class="form-control" required /></td>
			</tr>
		</tbody>
	</table>
	<div class="btn-group">
		<input type="submit" name="submit-btn" class="btn btn-info" value="로그인">
		<input type="reset" name="reset-btn" class="btn btn-info" value="취소">
		<a href="<%=request.getContextPath() %>/customer/membership.jsp" class="btn btn-danger">회원가입</a>
	</div>
	</form>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>