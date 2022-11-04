<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, kr.co.myshop.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 페이지</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='https://unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='https://unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='https://unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="content container" id="content">
	<h2 class="title">회원 가입</h2>
	<form name="frm1" id="frm1" action="<%=request.getContextPath()%>/InsertCustomerCtrl" method="post" onsubmit="return joinCheck(this)">
		<table class="table">
			<tbody>
				<tr>
					<th>아이디</th>
					<td>
					<div class="form-row">
							<input type="text" name="cusId" id="cusId" placeholder="아이디 입력" class="form-control" autofocus required />
							<input type="button" class="btn btn-primary" value="아이디 중복 확인" onclick="idCheck()">
							<input type="hidden" name="idck" id="idck" value="no">
					</div>
					</td>
				</tr>
				<tr>
				    <th>비밀번호</th>
				    <td>
				        <input type="password" id="cusPw" name="cusPw" class="form-control" placeholder="비밀번호 입력" maxlength="20" required>
				    </td>
				</tr>
				<tr>
				    <th>비밀번호 확인</th>
				    <td><input type="password" id="cusPw2" name="cusPw2" class="form-control" placeholder="비밀번호 확인" required></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" id="cusName" name="cusName" class="form-control" placeholder="이름을(를) 입력" required></td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
					<input type="text" name="postcode" id="postcode" style="width:160px;float:left;margin-right:20px;" placeholder="우편번호" class="form-control">
					<button id="post_btn" onclick="findAddr()" class="btn btn-primary">우편번호 검색</button>
					<input type="text" name="address1" id="address1" placeholder="기본 주소 입력" class="form-control" required /><br>
					<input type="text" name="address2" id="address2" placeholder="상세 주소 입력" class="form-control" required /><br>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" id="tel" name="tel" class="form-control" placeholder="000-0000-0000" required></td>
				</tr>
			</tbody>
		</table>
		<div class="btn-group">
			<input type="submit" name="submit-btn" class="btn btn-info" value="회원가입">
			<input type="reset" name="reset-btn" class="btn btn-info" value="취소">
		</div>
	</form>	
	<script>
	function idCheck(){
		var cusId = document.frm1.cusId.value;
		var win = window.open("idCheck.jsp?cusId="+cusId,"id 중복 체크", "width=500, height=200");
	}
	function joinCheck(f){
		if(f.cusPw.value!=f.cusPw2.value){
			alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
			f.cusPw.focus();
			return false;
		}
		if(f.idck.value!="yes"){
			alert("아이디 중복 체크를 하지 않으셨습니다.");
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
					document.getElementById("address1").value = roadAddr;				
				} else if(jibunAddr !== ''){
					document.getElementById("address1").value = jibunAddr;
				}
				document.getElementById("address2").focus();
			}
		}).open();
	}
	</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>