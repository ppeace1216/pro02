<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%
	String sid = (String) session.getAttribute("sid");
	String sname = (String) session.getAttribute("sname");
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="in_container"> 
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="index.jsp">SLOU BED<span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Brand Story</a>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
	          Product
	        </a>
	        <div class="dropdown-menu">
	          <a class="dropdown-item" href="#">매트리스 & 토퍼</a>
	          <a class="dropdown-item" href="#">모션 매트리스</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="#">프레임</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="#">베개</a>
	          <a class="dropdown-item" href="#">이불</a>
	        </div>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Review</a>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="true">
	          Support
	        </a>
	        <div class="dropdown-menu">
	        	<a class="dropdown-item" href="#">Q&A</a>
	          	<a class="dropdown-item" href="GetNotiListCtrl">공지사항</a>
	        	<a class="dropdown-item" href="#">AS</a>
	        </div>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Store</a>
	      </li>
	    </ul>
	    <ul class="nav justify-content-end">
		  <% if(sid!=null) { %>
			  <li class="nav-item">
			    <span class="nav-link"><%=sname %>님</span>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link active" href="<%=request.getContextPath() %>/LogOutCtrl">로그아웃</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="<%=request.getContextPath() %>/GetCustomInfoCtrl">회원정보</a>
			  </li>
			  <% if(sid.equals("admin")) { %>
				  <li class="nav-item">
				    <a class="nav-link" href="<%=request.getContextPath() %>/admin/index.jsp">관리자 페이지로</a>
				  </li>
			  <% } %>
		  <% } else { %>
			  <li class="nav-item">
			    <a class="nav-link active" href="<%=request.getContextPath() %>/customer/login.jsp">로그인</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="<%=request.getContextPath() %>/customer/membership.jsp">회원가입</a>
			  </li>
		  <% } %>
		  <li class="nav-item">
		    <a class="nav-link" href="#"><img src="./img/icon/cart.png" alt="장바구니"></a>
		  </li>
		</ul>	    
	  </div>
	</div>
</nav>