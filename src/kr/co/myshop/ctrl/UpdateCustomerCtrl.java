package kr.co.myshop.ctrl;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crypto.util.SHA256;


@WebServlet("/UpdateCustomerCtrl")
public class UpdateCustomerCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static String DRIVER = "com.mysql.cj.jdbc.Driver";
	private final static String URL = "jdbc:mysql://localhost:3306/myshop?serverTimezone=Asia/Seoul";
	private final static String USER = "root";
	private final static String PASS = "a1234";
	String sql = "";
	int cnt = 0;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String cusId = request.getParameter("cusId");
		String cus = request.getParameter("edit_cusPw");
		String cusPw = request.getParameter("cusPw");
		if(cus!=null || cus!="") {
			try {
				cusPw = SHA256.encrypt(cus);
			} catch (NoSuchAlgorithmException e1) {
				e1.printStackTrace();
			}
		}
		String cusName = request.getParameter("cusName");
		String address1 = request.getParameter("editaddress1");
		String address2 = request.getParameter("editaddress2");
		String address = address1 + " " + address2;
		String tel = request.getParameter("tel");
		try {
			Class.forName(DRIVER);
			sql="update customer set cuspw=?, cusname=?, address=?, tel=? where cusid=?";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cusPw);
			pstmt.setString(2, cusName);
			pstmt.setString(3, address);
			pstmt.setString(4, tel);
			pstmt.setString(5, cusId);
			cnt = pstmt.executeUpdate();
			if (cnt>=1){
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("GetCustomInfoCtrl");
			}
			pstmt.close();
			conn.close();
			
		} catch (Exception e){
			e.printStackTrace();
		}
	}
}
