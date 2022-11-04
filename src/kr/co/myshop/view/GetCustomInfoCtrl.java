package kr.co.myshop.view;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.myshop.vo.Customer;

@WebServlet("/GetCustomInfoCtrl")
public class GetCustomInfoCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/myshop?serverTimezone=Asia/Seoul";
    private static final String USER = "root";
    private static final String PASS = "a1234";
    String sql="";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String cusId = (String) session.getAttribute("sid");
		try {
			Class.forName(DRIVER);
			sql="select * from customer where cusId=?";
			Connection conn = DriverManager.getConnection(URL,USER,PASS);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cusId);
			ResultSet rs = pstmt.executeQuery();
			
			Customer vo = new Customer();
			if (rs.next()){
				vo.setCusId(rs.getString("cusid"));
				vo.setCusPw(rs.getString("cuspw"));
				vo.setCusName(rs.getString("cusname"));
				vo.setAddress(rs.getString("address"));
				vo.setTel(rs.getString("tel"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setPoint(rs.getInt("point"));
				vo.setVisited(rs.getInt("visited"));
				vo.setLevel(rs.getInt("level"));
			}
			request.setAttribute("customer", vo);
			
			RequestDispatcher view = request.getRequestDispatcher("./customer/customInfo.jsp");
			view.forward(request, response);
			
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (Exception e){
			e.printStackTrace();
		}
	}
}
