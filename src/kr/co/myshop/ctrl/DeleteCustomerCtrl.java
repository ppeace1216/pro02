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
import javax.servlet.http.HttpSession;

import com.crypto.util.SHA256;


@WebServlet("/DeleteCustomerCtrl")
public class DeleteCustomerCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static String DRIVER = "com.mysql.cj.jdbc.Driver";
	private final static String URL = "jdbc:mysql://localhost:3306/myshop?serverTimezone=Asia/Seoul";
	private final static String USER = "root";
	private final static String PASS = "a1234";
	String sql = "";
	int cnt = 0;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String cusId = (String) session.getAttribute("sid");

		try {
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			sql="delete from customer where cusid=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cusId);

			cnt = pstmt.executeUpdate();
			if (cnt>=1){
				if (cusId.equals("admin")){
					response.sendRedirect("/admin/index.jsp");
				} else {
					session.invalidate();
					response.sendRedirect("index.jsp");
				}
			} else {
				response.sendRedirect("GetCustomInfoCtrl?cusId="+cusId);
			}
			pstmt.close();
			conn.close();
		} catch (Exception e){
			e.printStackTrace();
		}
	}
}
