<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>회원 가입 페이지</title>
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
	<h2 class="title">회원 가입</h2>
	<form name="frm1" id="frm1" action="<%=request.getContextPath()%>/InsertCustomerCtrl" method="post">
		<table class="table">
			<tbody>
				<tr>
					<th>아이디</th>
					<td>
					<input type="text" name="cusId" id="cusId" placeholder="아이디 입력" class="in_dt" maxlength="16" pattern="[a-z0-9]" autofocus required />
					<input type="button" class="btn btn-primary" onclick="idcheck()" value="아이디 중복체크"/>
					</td>
				</tr>
				<tr>
				    <th>비밀번호</th>
				    <td>
				        <input type="password" id="cusPw" name="cusPw" class="in_dt" placeholder="영문대소문자,특수문자,숫자를 조합하여 8~20자" maxlength="20" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$" required>
				    </td>
				</tr>
				<tr>
				    <th>비밀번호 확인</th>
				    <td><input type="password" id="cusPw2" name="cusPw2" class="in_dt" placeholder="비밀번호 확인" required></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" id="cusName" name="cusName" class="in_dt" placeholder="이름을(를) 입력" required></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address1" id="author" value="admin" class="in_dt" readonly></td>
					<td><input type="text" name="address2" id="author" value="admin" class="in_dt" readonly></td>
				</tr>
			</tbody>
		</table>
		<div class="btn-group">
			<input type="submit" name="submit-btn" class="btn btn-info" value="글 등록">
			<input type="reset" name="reset-btn" class="btn btn-info" value="취소">
			<a href="../GetBoardListCtrl" class="btn btn-danger">목록으로</a>
		</div>
	</form>	
</div>
</body>
</html>