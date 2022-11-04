<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 확인 및 수정</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='https://unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='https://unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='https://unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
</head>
<body>
<%@ include file="../header.jsp" %>
<%
	Customer customer = (Customer) request.getAttribute("customer");
%>
<div class="content container" id="content">
	<h2 class="title">회원 정보 확인 및 수정</h2>
	<form name="frm1" id="frm1" action="<%=request.getContextPath()%>/UpdateCustomerCtrl" method="post" onsubmit="return updateCheck(this)">
		<table class="table">
			<tbody>
				<tr>
					<th>아이디</th>
					<td>
					<div class="form-row">
							<input type="text" name="cusId" id="cusId" class="form-control" value="<%=customer.getCusId() %>" readonly required />
					</div>
					</td>
				</tr>
				<tr>
				    <th>비밀번호</th>
				    <td>
						<p>비밀번호 변경시에만 입력하시기 바랍니다.</p>
						<input type="hidden" name="cusPw" id="cusPw" value="<%=customer.getCusPw() %>">
						<input type="password" name="edit_cusPw" id="edit_cusPw" placeholder="비밀번호 입력" class="form-control" />
					</td>
				</tr>
				<tr>
				    <th>비밀번호 확인</th>
				    <td><input type="password" name="edit_cusPw2" id="edit_cusPw2" class="form-control" placeholder="비밀번호 확인" required></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" id="cusName" name="cusName" class="form-control" placeholder="이름을(를) 입력" value="<%=customer.getCusName() %>" required></td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<p><%=customer.getAddress() %></p>
						<input type="hidden" name="address" id="address">
						<p>주소 변경시에만 입력하시기 바랍니다.</p>
						<input type="text" name="postcode" id="postcode" style="width:160px;float:left;margin-right:20px;" placeholder="우편번호" class="form-control">
						<button id="post_btn" onclick="findAddr()" class="btn btn-primary">우편번호 검색</button>
						<input type="text" name="editaddress1" id="editaddress1" placeholder="기본 주소 입력" class="form-control" required /><br>
						<input type="text" name="editaddress2" id="editaddress2" placeholder="상세 주소 입력" class="form-control" required /><br>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" id="tel" name="tel" class="form-control" placeholder="000-0000-0000" value="<%=customer.getTel() %>" required></td>
				</tr>
				<tr>
					<th>등급</th>
					<td><%
				if(customer.getLevel()==0) {
					out.println("<span>준회원</span>");
				} else if(customer.getLevel()==1){
					out.println("<span>정회원</span>");
				} else if(customer.getLevel()==2){
					out.println("<span>우수회원</span>");
				} else if(customer.getLevel()==3){
					out.println("<span>VIP회원</span>");
				} else {
					out.println("<span>관리자</span>");
				}
				%></td>
				</tr>
				<tr>
					<th>회원 포인트</th>
					<td><%=customer.getPoint() %></td>
				</tr>
				<tr>
					<th>방문횟수</th>
					<td><%=customer.getVisited() %></td>
				</tr>
			</tbody>
		</table>
		<div class="btn-group">
			<input type="submit" name="submit-btn" class="btn btn-info" value="정보수정">
			<input type="reset" name="reset-btn" class="btn btn-info" value="취소">
		</div>
	</form>	
	<script>
	function updateCheck(f){
		if(f.edit_cusPw.value!=f.edit_cusPw2.value){
			alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
			f.edit_cusPw.focus();
			return false;
		}
	}
	</script>
	<script>
	function findAddr() {
		new daum.Postcode({
			oncomplete: function(data) {
				console.log(data);
				var roadAddr = data.roadAddress;
				var jibunAddr = data.jibunAddress;
				document.getElementById("postcode").value = data.zonecode;
				if(roadAddr !== '') {
					document.getElementById("editaddress1").value = roadAddr;				
				} else if(jibunAddr !== ''){
					document.getElementById("editaddress1").value = jibunAddr;
				}
				document.getElementById("editaddress2").focus();
			}
		}).open();
	}
	</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
</body>
</html>